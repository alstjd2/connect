package kr.or.ddit.groupware.attendance.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;

@Mapper
public interface AttendanceMapper {

	/**
	 * 출퇴근 삭제
	 * @param attNo
	 * @param empNo
	 * @return
	 */
	public int deleteAttendance(int attNo, int empNo);

	/**
	 * 출퇴근 입력
	 * @param attendace
	 * @return
	 */
	public int insertAttendance(AttendanceVO attendace);

	/**
	 * 하나의 출퇴근 조회
	 * @param attNo
	 * @param empNo
	 * @return
	 */
	public AttendanceVO selectAttendance(int attNo, int empNo);


	/**
	 * 한 직원의 출퇴근 목록 조회
	 * Map<String, Object> pMap -> 구체적인 검색조건 (필요없으면 null넣어도됨)
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> selectAttendanceList(PaginationInfo paging);

	/**
	 * 한 직원의 출퇴근 상태 시간 조회
	 * @param empNo
	 * @return
	 */
	public List<AttendanceVO> selectAttendanceWorkStatusList(PaginationInfo paging);


	/**
	 * 한 부서의 출퇴근 상태 조회 (월별 통계 및 출퇴근 상태)
	 * @param empNo
	 * @return
	 */
	public List<EmployeeVO> selectAttDepWorkStatusList(int empDep);

	/**
	 * 부서의 출퇴근 상태 -> 퍼센테이지 나옴/몇명인지 나옴 ,ㅠㅠ
	 * @param empNo
	 * @param pMap
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> selectAttendanceDepWorkStatus( int empDep);


	/**
	 * 부서의 출퇴근 상태 시간 조회 -> d
	 * @param empDep
	 * @param pMap
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> selectDepAttendanceList(int empDep);


	/**
	 * 검색 조건
	 * @param empName
	 * @param searchMonth
	 * @return
	 */
	public List<EmployeeVO> searchAttendance(@Param("comNo") int comNo,@Param("empNm") String empNm,@Param("searchDate") String searchDate);
	/**
	 * 검색 조건
	 * @param empNo
	 * @param searchMonth
	 * @return
	 */
	public List<AttendanceVO> searchempAttendance(@Param("empNo") int empNo,@Param("searchDate") String searchDate);
	
	/**
	 * 검색 안하고 그냥 리스트 
	 * @param empNo
	 * @return
	 */
	public List<AttendanceVO> empAttendanceList(int empNo);
	
	/**
	 * 검색  통계
	 * @param empNo
	 * @return
	 */
	public List<AttendanceVO> empWorkList(@Param("empNo") int empNo,@Param("searchDate") String searchDate); 
	
	/**
	 * 출퇴근 수정
	 * @param attendace
	 * @return
	 */
	public int updateAttendance(AttendanceVO attendace);

	/**
	 * 한직원의 출퇴근 목록 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);


	/**
	 * 한기업의 출퇴근 목록 페이징 -> 년도, 월, 일
	 * @param paging
	 * @return
	 */
	public int selectTotalRecordCom(PaginationInfo paging);


	/**
	 * 한 기업의 출퇴근 목록 페이지 (페이징할거임. 10건씩 5개)
	 * @param comNo
	 * @return
	 */
	public List<EmployeeVO> selectComAttendanceList(PaginationInfo paging);
	public List<EmployeeVO> selectComAttendanceList2(int comNo);


	public List<EmployeeVO> selectAttendanceComWorkStatus(int comNo);

	/**
	 * index페이지에 들어갈 오늘 출퇴근 현황
	 * @param empNo
	 * @return
	 */
	public AttendanceVO selectTodayAttendance(int empNo);

}
