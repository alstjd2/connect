package kr.or.ddit.groupware.vacation.service;

import java.util.List;

import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.EmployeeVO;

public interface ApplicationService {

	/**
	 * 관리자 부재일정조회
	 * @param comNo
	 * @return
	 */
	public List<EmployeeVO> comApplicationList(int comNo);

	/**
	 * 한 직원의 부재 현황 조회 (연차, 경조, 특별휴가) => 진행중/ 승인완료 /반려
	 * @param empNo
	 * @return
	 */
	public List<EmployeeVO> empApplicationList(int empNo);

	/**
	 * 하나의 휴가 신청서 상세 조회
	 * @param appNo
	 * @return
	 */
	public EmployeeVO empAppDetail(int appNo);

	/**
	 * 한 직원의 특별휴가 총 개수
	 * @param empNo
	 * @return
	 */
	public ApplicationVO empAllSpeCnt(int empNo);

	/**
	 * 한직원의 특별휴가 사용개수
	 * @param empNo
	 * @return
	 */
	public ApplicationVO empUseSpeCnt(int empNo);

	/**
	 * 관리자가 직원에게 특별휴가 부여
	 * @param application
	 */
	public void createSpcApplication(ApplicationVO application);


	/**
	 *  한직원의 부여받은 특별휴가 리스트
	 * @param empNo
	 * @return
	 */
	public List<ApplicationVO> empSpeList(int empNo);
	/**
	 * 한직원의 특별휴가 사용한 리스트
	 * @param empNo
	 * @return
	 */
	public List<ApplicationVO> empSpeUseList(int empNo);

	/**
	 * 휴가 신청 - 특별휴가인 경우 업데이트 경조나 연차는 인서트
	 * @param app
	 */
	public void empVacApplicationMer(ApplicationVO app);

	public List<EmployeeVO> depApplicationList(int empNo);

	/**
	 * 부서휴가관리 - 승인
	 * @param application
	 */
	public void empApproveApplication(ApplicationVO application);

	/**
	 * 부서휴가관리 - 반려
	 * @param application
	 */
	public void empCompanionApplication(ApplicationVO application);


	/**
	 * 부서 근태현황 - 진행중 카운트
	 * @param rovemp
	 * @return
	 */
	public ApplicationVO appDepIngCnt(int rovemp);

	/**
	 * 부서 근태현황 - 승인완료 카운트
	 * @param rovemp
	 * @return
	 */
	public ApplicationVO appDepAroveCnt(int rovemp);

	/**
	 * 부서 근태현황 - 반려 카운트
	 * @param rovemp
	 * @return
	 */
	public ApplicationVO appDepCnt(int rovemp);


	public ApplicationVO comVacIngCnt(int comNo);

	public ApplicationVO comVacApproveCnt(int comNo);

	public ApplicationVO comVacCnt(int comNo);

	/**
	 * 관리자가 부여한 특별휴가 리스트 조회
	 * @param comNo
	 * @return
	 */
	public List<ApplicationVO> comSpeList(int comNo);


}
