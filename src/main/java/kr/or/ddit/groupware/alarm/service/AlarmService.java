package kr.or.ddit.groupware.alarm.service;

import java.util.List;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.AlarmVO;

public interface AlarmService {
	public AlarmVO retrieveAlarm(Integer alarmNo) throws PkNotFoundException;
	public List<AlarmVO> retrieveAlarmList(Integer empNo);
	public void createAlarm(AlarmVO alarm);
	public boolean modifyAlarm(Integer alarmNo);
	public boolean removeAlarm(Integer alarmNo);
	
}
