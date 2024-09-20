package kr.or.ddit.groupware.vacation.service;

import java.util.List;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.VacationInfoVO;

public interface VacationInfoService {

	/**
	 * 기업 연차 리스트 조회
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> comVacationList(int comNo);

	/**
	 * 하나의 휴가 상세조회
	 * @param vaciNo
	 * @return
	 */
	public VacationInfoVO retrieveVacationInfo(int vaciNo);

	/**
	 * 기업 특별휴가 리스트 조회
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> comSpeList(int comNo);

	/**
	 * 기업 경조 리스트 조회
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> comRepList(int comNo);

	/**
	 * 기업 모든 휴가 리스트 조회
	 * @param comNo
	 * @return
	 */
	public List<VacationInfoVO> comAllVacationList(int comNo);

	/**
	 * 기업 연차 추가
	 * @param vacationList
	 */
	public void createVacation(List<VacationInfoVO> vacationList);

	/**
	 * 특별휴가 추가
	 * @param vacationInfo
	 */
	public void createSpeVacation(VacationInfoVO vacationInfo);


	/**
	 * 경조 추가
	 * @param vacationInfo
	 */
	public void createRepVacation(VacationInfoVO vacationInfo);


	/**
	 * 기업 연차 업데이트
	 * @param vacationList
	 */
	public void updateComVacation(List<VacationInfoVO> vacationList);

	/**
	 * 한 사람의 총 연차 개수
	 * @param empNo
	 * @return
	 */
	public EmployeeVO empAllVacCnt(int empNo);

	/**
	 * 한 사람의 사용 연차 개수
	 * @param empNo
	 * @return
	 */
	public EmployeeVO empUseVacCnt(int empNo);

	/**
	 * 휴가 수정
	 * @param vacationInfo
	 */
	public void modifyVacation(VacationInfoVO vacationInfo);

	/**
	 * 휴가 삭제
	 * @param vaciNo
	 */
	public void removeVacation(int vaciNo);
}
