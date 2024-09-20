package kr.or.ddit.groupware.groupemployee.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.groupware.adrgroup.dao.AdrGroupMapper;
import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.groupemployee.dao.GroupEmployeeMapper;
import kr.or.ddit.vo.AdrGroupVO;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GroupEmployeeVO;

@Service
public class GroupEmployeeServiceImpl implements GroupEmployeeService {
	@Autowired
	private GroupEmployeeMapper mapper;
	
	@Autowired
	private AdrGroupMapper grmapper;
	
	@Autowired
    private AlarmService alarmService;
	
	@Autowired
    private NotificationWebSocketHandler notificationWebSocketHandler;
	
	public GroupEmployeeVO retrieveGroupEmployee(Integer grpNo, Integer empNo) throws PkNotFoundException {
		GroupEmployeeVO groupEmployee = new GroupEmployeeVO();
		groupEmployee.setGrpNo(grpNo);
		groupEmployee.setEmpNo(empNo);
		
		GroupEmployeeVO result = mapper.selectGroupEmployee(groupEmployee);
		if(result == null)
			throw new PkNotFoundException(grpNo + "-" + empNo);
		return result;
	}

	@Override
	public List<GroupEmployeeVO> retrieveGroupEmployeeList(Integer grpNo) {
		return mapper.selectGroupEmployeeList(grpNo);
	}

	@Override
    public void createGroupEmployee(int grpNo, List<Integer> empNos) {
        for (int empNo : empNos) {
            GroupEmployeeVO groupEmployee = new GroupEmployeeVO();
            groupEmployee.setGrpNo(grpNo);
            groupEmployee.setEmpNo(empNo);
            mapper.insertGroupEmployee(groupEmployee);
            
            
            AdrGroupVO group =  grmapper.selectGroup(grpNo);
            String groupNm = group.getGrpNm();
            String empNm = group.getEmployee().getEmpNm();
            
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
    	    EmployeeVO emp = empAuth.getRealUser();
    	    int comNo = emp.getComNo();
    	    
            AlarmVO alarm = new AlarmVO();
            alarm.setEmpNo(empNo);
            alarm.setComNo(comNo);
            alarm.setAlarmComncode(empNm+"님의 ["+groupNm+"] 그룹에 초대되었습니다.");
            alarm.setAlarmChk("N");
            alarm.setAlarmDate(LocalDateTime.now());
            alarm.setAlarmHeader("주소록- 그룹");
            alarm.setAlarmCode(3);
            alarm.setAlarmLink("gw/address/addressgroupList.do");
            
            alarmService.createAlarm(alarm);

            String notificationMessage = alarm.getAlarmComncode();
            notificationWebSocketHandler.sendNotification(empNo, notificationMessage);
        }
    }

	@Override
	public void modifyGroupEmployee(GroupEmployeeVO groupemployee) {
		mapper.updateGroupEmployee(groupemployee);
		
	}

	@Override
	public void removeGroupEmployee(Integer grpNo) {
		mapper.deleteGroupEmployee(grpNo);
	}

	@Override
	public GroupEmployeeVO retrieveGroupEmployee(Integer empNo, int grpNo) throws PkNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	
}
