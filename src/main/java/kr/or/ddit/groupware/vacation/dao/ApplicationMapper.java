package kr.or.ddit.groupware.vacation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.EmployeeVO;

@Mapper
public interface ApplicationMapper {
// Application -> 휴가 신청
	public int deleteApplication(@Param("appNo") int appNo, @Param("empNo")  int empNo, @Param("vaciNo") int vaciNo);

	public int insertApplication(ApplicationVO application);

	/**
	 * 부서휴가관리에서 - 승인
	 * @param application
	 * @return
	 */
	public int updateApproveApplication(ApplicationVO application);

	/**
	 * 부서휴가관리 - 반려
	 * @param application
	 * @return
	 */
	public int updateCompanionApplication(ApplicationVO application);

	/**
	 * 관리자가 특별휴가 부여
	 * @param Application
	 * @return
	 */
	public int insertSpcApplication(ApplicationVO application);

	public ApplicationVO selectApplication(@Param("appNo") int appNo, @Param("empNo")  int empNo, @Param("vaciNo") int vaciNo);

	public List<ApplicationVO> selectApplicationList();

	public int updateApplication(ApplicationVO application);

	/**
	 * 기업의 부재일정 조회 (승인 완료된 건만)
	 * @param comNo
	 * @return
	 */
	public List<EmployeeVO> selectComApplicationList(int comNo);


	/**
	 * 한 직원의 휴가신청 현황 조회(진행중, 반려, 승인완료)/ (연차, 경조, 특별휴가)
	 * @param empNo
	 * @return
	 */
	public List<EmployeeVO> selectEmpApplicationList(int empNo);


	/**
	 * 결재자로 선택된 경우 휴기 신청 리스트 조회
	 * @param empNo
	 * @return
	 */
	public List<EmployeeVO> selectDepApplicationList(int empNo);

	/**
	 * 휴가 신청서 상세 조회
	 * @param appNo
	 * @return
	 */
	public EmployeeVO selectEmpApplicationDetail(int appNo);

	/**
	 * 한 직원의 특별휴가 부여 개수
	 * @param empNo
	 * @return
	 */
	public ApplicationVO speEmpAllCnt(int empNo);

	/**
	 * 한 직원의 특별휴가 사용 개수
	 * @param empNo
	 * @return
	 */
	public ApplicationVO speEmpUseCnt(int empNo);

	/**
	 * 한 직원의 부여받은 특별휴가 리스트
	 * @param empNo
	 * @return
	 */
	public List<ApplicationVO> speEmpList(int empNo);

	public List<ApplicationVO> speEmpUseList(int empNo);

	/**
	 * 휴가 신청 - 특별휴가인 경우 업데이트 경조나 연차는 인서트
	 * @param app
	 * @return
	 */
	public int empVacApplicationMer(ApplicationVO app);

	/**
	 * 부서 진행중 휴가 개수
	 * @param rovemp
	 * @return
	 */
	public ApplicationVO appDepIngCnt(int rovemp);

	/**
	 * 부서 승인완료 휴가 개수
	 * @param rovemp
	 * @return
	 */
	public ApplicationVO appDepAproveCnt(int rovemp);


	/**
	 *
	 * 부서 반려 휴가 개수
	 * @param rovemp
	 * @return
	 */
	public ApplicationVO appDepCnt(int rovemp);

	/**
	 * 한 회사의 휴가신청 현황 - 진행중
	 * @param comNo
	 * @return
	 */
	public ApplicationVO comVacIngCnt(int comNo);
	/**
	 * 한 회사의 휴가신청 현환 - 승인완료
	 * @param comNo
	 * @return
	 */
	public ApplicationVO comVacApproveCnt(int comNo);
	/**
	 * 한회사의 휴가신청 현황 - 반려
	 * @param comNo
	 * @return
	 */
	public ApplicationVO comVacCnt(int comNo);

	/**
	 * 관리자가 부여한 특별휴가 조회
	 * @param comNo
	 * @return
	 */
	public List<ApplicationVO> comSpeList(int comNo);
}
