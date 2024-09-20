package kr.or.ddit.groupware.attendance.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.attendance.dao.AttendanceMapper;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {

	private final AttendanceMapper mapper;



	/**
	 *출퇴근 기록 insert, update merge문
	 */
	@Override
	public void attendanceCreate(AttendanceVO att) {
		mapper.insertAttendance(att);
	}



	/**
	 * 한 직원의 출퇴근 목록 조회
	 */
	@Override
	public List<AttendanceVO> empAttRetriveList(PaginationInfo paging) {

		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);

		return mapper.selectAttendanceList(paging);
	}



	@Override
	public List<AttendanceVO> empAttWorkStatusRetriveList(PaginationInfo paging) {

		return mapper.selectAttendanceWorkStatusList(paging);
	}



	@Override
	public List<AttendanceVO> depAttWorkStatusRetrive(int empDep) {

		return mapper.selectAttendanceDepWorkStatus(empDep);
	}



	/**
	 * 한 부서의 출퇴근 상태 조회 (월별 통계)
	 */
	@Override
	public List<EmployeeVO> depAttWorkStatusRetriveList(int empDep) {
		return mapper.selectAttDepWorkStatusList(empDep);
	}



	@Override
	public List<EmployeeVO> comAttRetriveList(PaginationInfo paging) {
		return mapper.selectComAttendanceList(paging);
	}



	@Override
	public List<EmployeeVO> comAttRetriveList2(int comNo) {
		return mapper.selectComAttendanceList2(comNo);
	}



	@Override
	public List<EmployeeVO> comAttWorkStatusRetriveList(int comNo) {
		return mapper.selectAttendanceComWorkStatus(comNo);
	}



	@Override
	public List<EmployeeVO> searchAttendance( int comNo,String empNm, String searchDate) {
		return mapper.searchAttendance(comNo,empNm, searchDate);
	}



	@Override
	public List<AttendanceVO> empAttSerchList(int empNo, String searchDate) {
		return mapper.searchempAttendance(empNo, searchDate);
	}



	@Override
	public AttendanceVO selectTodayAtt(int empNo) {
		return mapper.selectTodayAttendance(empNo);
	}



	@Override
	public List<AttendanceVO> selectEmpAttList(int empNo) {
		return mapper.empAttendanceList(empNo);
	}



	@Override
	public List<AttendanceVO> selectEmpWorkList(int empNo, String searchDate) {
		return mapper.empWorkList(empNo, searchDate);
	}

}
