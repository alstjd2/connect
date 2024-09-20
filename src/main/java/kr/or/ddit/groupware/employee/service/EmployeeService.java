package kr.or.ddit.groupware.employee.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;

public interface EmployeeService {
	public EmployeeVO retrieveEmployee(int empNo) throws PkNotFoundException;

	public EmployeeVO retrieveEmployeeInfo(int empNo) throws PkNotFoundException;
	public List<EmployeeVO> retrieveEmployeeComList(PaginationInfo paging);
	List<EmployeeVO> retrieveEmployeeComListByDept(PaginationInfo<EmployeeVO> paging, String orgDep);

	/**
	 * 회사 조직원 조회 (JOSN 데이터를 위한)
	 * @author 이희진
	 * @param comNo
	 * @return
	 */
	public List<EmployeeVO> retrieveEmployeeComEmpList(int comNo);
	public void modifyEmployeeInfo(EmployeeVO employee);
	public void changePassword(int empNo, String currentPassword, String newPassword) throws PkNotFoundException;


//	새로추가한 메서드 (성훈)

	public EmployeeVO retrieveEmployeeDetail(int empNo);

	public void registerEmployee(EmployeeVO employee);

	public void editEmployee(EmployeeVO employee);

	public void uploadEmployeeData(MultipartFile file);

	public List<EmployeeVO> searchEmployees(String empNm, int empDep, int empPos, int empOnepos, String empState);

	// 모든 직원 조회 메서드
	public List<EmployeeVO> retrieveAllEmployees(int comNo);

	// 직원 이름으로 직원 번호를 조회하는 메서드 추가
    public Integer getEmpNoByName(String empNm);
    // 직원 번호로 직원 이름을 조회하는 메서드
    public String getEmployeeNameByEmpNo(int empNo);

	public void updateEmployeeStateByAppointment(int empNo, String empState);

	// 현주 추가 = 직원 상세조회 (부서, 직급명 나옴)
    public EmployeeVO selectEmpVacDetail(int empNo);

	public void updateEmployeeDepartment(int empNo, int newOrgDep);

	public List<EmployeeVO> retrieveEmpDep(int empDep);

    public List<EmployeeVO> selectEmpVacDepList( String orgDep, int comNo);
    // 비밀번호 생성
	public String generatePassword();
	// 아이디 생성
	public String generateUniqueEmployeeId();
	// 직책 가져오기
	public List<EmployeeVO> retrieveAllPositions(int comNo, String posType);

	/**
	 * 직원정보 수정 (관리자용)
	 * @param employee
	 */
	public void changeEmployee(EmployeeVO employee);

	public List<EmployeeVO> retrieveDfVacList(int comNo);

	/**
	 * 웹에서 그룹웨어 어드민 계정 생성
	 * @param empVO
	 * @return
	 */
	public ServiceResult createEmployeeByAdmin(EmployeeVO empVO);

	public List<EmployeeVO> readExcelFile(MultipartFile file, Integer comNo) throws IOException;

	public void saveAll(List<EmployeeVO> employeeList);

}
