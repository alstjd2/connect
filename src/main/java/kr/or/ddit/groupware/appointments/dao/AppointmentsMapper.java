package kr.or.ddit.groupware.appointments.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.AppointmentsVO;
import kr.or.ddit.vo.CommoncodeDetailVO;

@Mapper
public interface AppointmentsMapper {
	public int deleteAppointments(int apmNo);

	public AppointmentsVO selectAppointments(int apmNo);

	public List<AppointmentsVO> selectAll(@Param("comNo") int comNo);

	  // 필터와 페이지네이션을 적용한 인사발령 조회 메서드
	public List<AppointmentsVO> selectAppointmentsWithFilters(
            @Param("comNo") int comNo,
            @Param("searchName") String searchName,
            @Param("searchDate") String searchDate,
            @Param("offset") int offset,
            @Param("pageSize") int pageSize
        );

	// 인사발령 수를 카운트하는 메서드
	public int countAppointments(
        @Param("comNo") int comNo,
        @Param("searchName") String searchName,
        @Param("searchDate") String searchDate
    );

	public int updateAppointments(AppointmentsVO row);

	public AppointmentsVO selectAppointmentsDetails(int apmNo);

	// 발령종류 가져오기
	public List<CommoncodeDetailVO> selectApmTypes();

	public void insertAppointments(AppointmentsVO appointment);

	// 발령일이 오늘인 인사발령 조회
	public List<AppointmentsVO> selectAppointmentsToUpdate(String currentDate);
}