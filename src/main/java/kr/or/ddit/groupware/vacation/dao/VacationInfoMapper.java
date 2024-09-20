package kr.or.ddit.groupware.vacation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.VacationInfoVO;

@Mapper
public interface VacationInfoMapper {
//	VacationInfo -> 휴가 정보
	/**
	 * 연차 추가
	 * @param vacationList
	 * @return
	 */
	public int insertVacationInfo(List<VacationInfoVO> vacationList);

	/**
	 * 특별휴가 추가
	 * @param vacationInfo
	 * @return
	 */
	public int insertSpectialVacation(VacationInfoVO vacationInfo);


	/**
	 * 경조 추가
	 * @param vacationInfo
	 * @return
	 */
	public int insertRepeaterVacation(VacationInfoVO vacationInfo);

	/**
	 * 특정 휴가 상세조회
	 * @param vaciNo
	 * @return
	 */
	public VacationInfoVO selectVacationInfo(int vaciNo);

	/**
	 * 기업별 연차 리스트
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> selectVacationInfoList(int comNo);



	/**
	 * 기업별 모든 연차 리스트
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> selectAllVacationList(int comNo);

	public int updateVacationInfo(VacationInfoVO vacationInfo);

	public int deleteVacationInfo(int vaciNo);

	/**
	 * 연차 업데이트
	 * @param vacationInfo
	 * @return
	 */
	public int updateComVacation(List<VacationInfoVO> vacationList);

	public EmployeeVO selectVacCnt(int empNo);
	public EmployeeVO selectUseVacCnt(int empNo);



	/**
	 * 한 회사의 특별휴가 리스트
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> selectSpeList(int comNo);

	/**
	 * 한 회사의 경조 리스트
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> selectRepList(int comNo);


}
