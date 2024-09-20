package kr.or.ddit.groupware.attendance.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;

public interface AttendanceService {

	/**
	 * 출퇴근 기록 merge~
	 * @param att
	 */
	public void attendanceCreate(AttendanceVO att);

	/**
	 * 한직원의 출퇴근 목록 페이징 + 상세검색
	 * @param empNo
	 * @return
	 */
	public List<AttendanceVO> empAttRetriveList(PaginationInfo paging);


	/**
	 * 한 직원의 출퇴근 상태 시간 조회 (ex. 정상출근, 지각, 조퇴, 지각 및 조퇴 00:00:00)
	 * @param empNo
	 * @return
	 */
	public List<AttendanceVO> empAttWorkStatusRetriveList(PaginationInfo paging);


	public List<AttendanceVO> empAttSerchList(int empNo, String searchDate);
	/**
	 * 한 부서의 출퇴근 상태 조회
	 * @param empDep
	 * @return
	 */
	public List<EmployeeVO> depAttWorkStatusRetriveList(int empDep);


	/**
	 * 부서별 출퇴근 상태 퍼센테이지 + 몇명인지 나옴
	 * @param empNo
	 * @param pMap
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> depAttWorkStatusRetrive(int empDep);
	public List<EmployeeVO> searchAttendance( int comNo,String empNm, String searchDate);

	public List<EmployeeVO> comAttRetriveList(PaginationInfo paging);
	public List<EmployeeVO> comAttRetriveList2(int comNo);
	public List<EmployeeVO> comAttWorkStatusRetriveList(int comNo);

	public AttendanceVO selectTodayAtt(int empNo);
	
	/**
	 * 검색조건 없는 출퇴근
	 * @param empNo
	 * @return
	 */
	public List<AttendanceVO> selectEmpAttList(int empNo);
	
	/**
	 * 검색 출퇴근 통계
	 * @param empNo
	 * @param searchDate
	 * @return
	 */
	public List<AttendanceVO> selectEmpWorkList(int empNo, String searchDate);
}
