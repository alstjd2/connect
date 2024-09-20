package kr.or.ddit.groupware.alarm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.AlarmVO;

@Mapper
public interface AlarmMapper {
	public AlarmVO selectAlarm(Integer alarmNo);
	public List<AlarmVO> selectAlarmList(Integer empNo);
	public int insertAlarm(AlarmVO alarm);
	public boolean updateAlarm(Integer alarmNo);
	public boolean deleteAlarm(Integer alarmNo);
	
	public List<AlarmVO> selectRecentAlarms(Integer empNo);
}
