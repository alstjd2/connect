package kr.or.ddit.groupware.alarm.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.dao.AlarmMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Service
public class AlarmServiceImple implements AlarmService {
	
	@Autowired
	private AlarmMapper mapper;
	
	@Autowired
    private NotificationWebSocketHandler webSocketHandler;

	@Override
	public AlarmVO retrieveAlarm(Integer alarmNo) throws PkNotFoundException {
		AlarmVO alarm = mapper.selectAlarm(alarmNo);
		if(alarm==null)
			throw new PkNotFoundException(alarmNo);
		return alarm;
	}

	@Override
	public List<AlarmVO> retrieveAlarmList(Integer empNo) {
		return mapper.selectAlarmList(empNo);
		
	}

	@Override
	public void createAlarm(AlarmVO alarm) {
		mapper.insertAlarm(alarm);

	}
	


	@Override
	public boolean modifyAlarm(Integer alarmNo) {
		 try {
	            mapper.updateAlarm(alarmNo);
	            return true;
	        } catch (Exception e) {
	            return false;
	        }
		
	}

	@Override
	public boolean removeAlarm(Integer alarmNo) {
		 try {
	            mapper.deleteAlarm(alarmNo);
	            return true;
	        } catch (Exception e) {
	            return false;
	        }
	}

}
