package kr.or.ddit.groupware.msgroom.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.msgroom.dao.MsgroomMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.MsglogVO;
import kr.or.ddit.vo.MsgroomVO;

@Service
public class MsgroomServiceImpl implements MsgroomService {

	private final MsgroomMapper msgroomMapper;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private AlarmService alarmService;

	@Autowired
	private NotificationWebSocketHandler notificationWebSocketHandler;


	@Autowired
	public MsgroomServiceImpl(MsgroomMapper msgroomMapper) {
        this.msgroomMapper = msgroomMapper;
    }


	@Override
	public List<MsgroomVO> getAllChatRooms(int empNo) {
		return msgroomMapper.selectAllChatRooms(empNo);
	}

	@Override
	public MsgroomVO getChatRoom(int msgrmNo) {
		return msgroomMapper.selectMsgroom(msgrmNo);
	}


	@Override
	public List<MsglogVO> getChatHistory(int msgrmNo) {
		return msgroomMapper.selectChatHistory(msgrmNo);
	}


	@Override
	@Transactional
	public void sendMessage(MsglogVO msgLog) {
		System.out.println("Sending message: " + msgLog);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		String msgContent = msgLog.getMsglogContent();
		int comNo = emp.getComNo();
		EmployeeVO empDetail = empService.retrieveEmployeeDetail(empNo);
		int empD = empDetail.getEmpDep();
		List<EmployeeVO> empDepList = empService.retrieveEmpDep(empD);
			for(EmployeeVO empDep : empDepList) {
				int recipientEmpNo = empDep.getEmpNo();
				AlarmVO alarm = new AlarmVO();
				alarm.setEmpNo(recipientEmpNo);
				alarm.setComNo(comNo);
				alarm.setAlarmComncode("["+empNm+"]님이 새로운 메세지가 도착했습니다.\n"+ msgContent);
				alarm.setAlarmChk("N");
				alarm.setAlarmDate(LocalDateTime.now());
				alarm.setAlarmHeader("메시지");
				alarm.setAlarmCode(4);
				alarm.setAlarmLink("gw/msg.do");
				alarmService.createAlarm(alarm);
				if(recipientEmpNo != empNo) {
					String notificationMessage = alarm.getAlarmComncode();
					notificationWebSocketHandler.sendNotification(recipientEmpNo, notificationMessage);
				}


		}

		msgroomMapper.insertMsgLog(msgLog);

	}

}
