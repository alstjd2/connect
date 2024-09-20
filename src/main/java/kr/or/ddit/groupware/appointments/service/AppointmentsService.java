package kr.or.ddit.groupware.appointments.service;

import java.util.List;

import kr.or.ddit.vo.AppointmentsVO;
import kr.or.ddit.vo.CommoncodeDetailVO;

public interface AppointmentsService {


	// 인사발령 수 카운트 메서드
	public int countAppointments(int comNo, String searchName, String searchDate);

	// 필터와 페이지네이션을 지원하는 인사발령 조회 메서드
	public List<AppointmentsVO> getAppointmentsWithFilters(int comNo, String searchName, String searchDate, int page, int pageSize);

	/**
	 * 인사발령세부사항 가져오는 메서드
	 * @param apmNo
	 * @return
	 */
	public AppointmentsVO getAppointmentsDetails(int apmNo);


	// 발령종류를 가져오는 메서드 추가
	public List<CommoncodeDetailVO> getApmTypes();

	public void addAppointment(AppointmentsVO appointment);

}
