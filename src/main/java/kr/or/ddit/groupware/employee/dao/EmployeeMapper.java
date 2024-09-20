package kr.or.ddit.groupware.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.mailSerchVO;

@Mapper
public interface EmployeeMapper {

	public int insertEmployee(EmployeeVO employee);

	public List<EmployeeVO> selectEmployeeList();

	public EmployeeVO selectEmployee(int empNo);

	public int updateEmployee(EmployeeVO employee);

	/**
	 * 직원정보 조회
	 *
	 * @author 이희진
	 * @param empNo
	 * @return
	 */
	public EmployeeVO selectEmployeeInfo(int empNo);

	/**
	 * 회사 전체 조직원 조회
	 *
	 * @author 이희진
	 * @param paging
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeComList(PaginationInfo paging);

	/**
	 * 회사 부서별 조직원 조회
	 *
	 * @author 이희진
	 * @param paging
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeComListByDept(PaginationInfo paging);

	/**
	 * 회사 전체 조직원 조회 ( JSON 정보조회를 위한 )
	 *
	 * @author 이희진
	 * @param comNo
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeComEmpList(int comNo);

	/**
	 * 개인정보 수정
	 *
	 * @author 이희진
	 * @param employee
	 * @return
	 */
	public int updateEmployeeInfo(EmployeeVO employee);

	/**
	 * 비밀번호 변경
	 *
	 * @author 이희진
	 * @param employee
	 * @return
	 */
	public int updateEmployeePW(EmployeeVO employee);

	/**
	 * 회사 조직원 페이징처리
	 *
	 * @author 이희진
	 * @param paging
	 * @return
	 */
	public int selectTotalRecordCom(PaginationInfo paging);

	/**
	 * 회사 부서별 조직원 페이징 처리
	 *
	 * @author 이희진
	 * @param paging
	 * @return
	 */
	public int selectTotalRecordCombyDept(PaginationInfo paging);

	public int deleteEmployee(int empNo);

	/**
	 * 로그인 인증정보
	 *
	 * @param empId
	 * @return
	 */
	public EmployeeVO selectEmployeeAuth(String empId);

	// 새로 추가된 메서드 (성훈)
	/**
	 * 직원 목록을 전체조회 (관리자용)
	 *
	 * @return
	 */
	public List<EmployeeVO> selectAllEmployees(int comNo);




	/**
	 * 직원등록시 새로생성된 직원번호 생성 (관리자용)
	 *
	 * @return
	 */
	public int getNextEmpNo();

	/**
	 * 직원검색
	 *
	 * @param empNm
	 * @param empDep
	 * @param empPos
	 * @param empOnepos
	 * @param empState
	 * @return
	 */
	public List<EmployeeVO> searchEmployees(String empNm, int empDep, int empPos, int empOnepos, String empState);

	public void uploadEmployeeData(MultipartFile file);

	// 직원 이름으로 직원 번호를 조회하는 메서드 추가
	public Integer selectEmpNoByName(@Param("empNm") String empNm);

	// 직원 번호로 이름을 조회하는 메서드 추가
	public String selectEmployeeNameByEmpNo(@Param("empNo") int empNo);

	/**
	 * 인사발령 부서이동시 재직상태 변경
	 * @param empNo
	 * @param empState
	 */
	public void updateEmployeeState(@Param("empNo") int empNo, @Param("empState") String empState);

	/**
	 * 직원 번호로 직원 상세조회 - 부서, 직급명도 조회되는 쿼리
	 *
	 * @param empNo
	 * @return
	 */
	public EmployeeVO selectEmpDetailVac(int empNo);

	public List<EmployeeVO> selectEmpVacDepList(@Param("orgDep") String orgDep, @Param("comNo") int comNo);

	/**
	 * 인사발령 부서이동시 부서 변경
	 * @param empNo
	 * @param newOrgDep
	 */
	public void updateEmployeeDepartment(@Param("empNo") int empNo, @Param("newOrgDep") int newOrgDep);


	/**
	 * 직원등록시 직급 직책 선택목록 가져오기
	 * @param comNo
	 * @param posType
	 * @return
	 */
	public List<EmployeeVO> selectAllPositions(@Param("comNo") int comNo, @Param("posType") String posType);



	/**
	 * 특정 직원의 상세 정보 조회 (관리자용)
	 *
	 * @param empNo
	 * @return
	 */
	public EmployeeVO selectEmployeeDetail(@Param("empNo") int empNo);

	public List<EmployeeVO> selectEmpDepList(int empDep);

	/**
	 * 직원 정보수정(관리자용)
	 * @param employee
	 * @return
	 */
	public int editEmployee(EmployeeVO employee);



	public List<EmployeeVO> selectDfVacList(int comNo);

	/**
	 * 회사 전체 조직원 조회(관리자 제외) ( JSON 정보조회를 위한 )
	 *
	 * @author 정윤지
	 * @param comNo
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeNoAdminComEmpList(int comNo);

	/**
	 * 웹에서 그룹웨어 어드민 계정 생성
	 * @param empVO
	 * @return
	 */
	public int insertEmployeeByAdmin(EmployeeVO empVO);


	/**
	 * 메일에서 회원번호 조회 (알람)
	 * @param serchVo
	 * @return empNo
	 */
	public int selectEmpNo(mailSerchVO serchVo);

	public Integer selectDepNoByName(@Param("empDepName") String empDepName, @Param("comNo") Integer comNo);

	public Integer selectPosNoByName(@Param("empPosName") String empPosName, @Param("comNo")Integer comNo);

	public Integer selectOneposNoByName(@Param("empOneposName") String empOneposName, @Param("comNo") Integer comNo);

	public void insertNewEmployee(EmployeeVO employee);

}