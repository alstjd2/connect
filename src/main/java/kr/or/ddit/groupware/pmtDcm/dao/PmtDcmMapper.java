package kr.or.ddit.groupware.pmtDcm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PmtDcmVO;

/**
 * @author PC-04
 *
 */
@Mapper
public interface PmtDcmMapper {
	


	
	/**
	 * 결재 문서 번호 삭제
	 * @param pmtDcmNo
	 * @return
	 */
	public int deletePmtDcm(int pmtDcmNo);
	
	/**
	 * 결재 문서 번호 삽입
	 * @return int
	 */
	public int insertPmtDcm(PmtDcmVO pmtDcmVo);
	
	/**
	 * 결재 문서 번호 수정
	 * @param pmtDcmVo
	 * @return int
	 */
	public int updatePmtDcm(PmtDcmVO pmtDcmVo);
	
	/**
	 * 결재 문서 상세 조회
	 * @param pmtDcmNo
	 * @return PmtDcmVO
	 */
	public PmtDcmVO selectPmtDcmDetail(int pmtDcmNo);
	
	/**
	 * 관리자화면상 결재 문서 전체 조회
	 * @param comNo
	 * @return List<PmtDcmVO>
	 */
	public List<PmtDcmVO> selectPmtDcmAll(int comNo);
	
	/**
	 * 직원화면상 결재 문서 전체 조회
	 * @param empNo
	 * @return List<PmtDcmVO>
	 */
	public List<PmtDcmVO> selectEmpPmtDcmAll(int empNo);
	
	/**
	 * 직원화면상 참조문서 문서 전체 조회
	 * @param empNo
	 * @return List<PmtDcmVO>
	 */
	public List<PmtDcmVO> selectRefEmpPmtDcmAll(int empNo);
	
	/**
	 * 직원화면상 수신문서 전체 조회
	 * @param empNo
	 * @return List<PmtDcmVO> 
	 */
	public List<PmtDcmVO> selectRecEmpPmtDcmAll(int empNo);
	
	/**
	 * 결재가 완료되면 수신자에게 대기문서임을 업데이트
	 * @param pmtDcm (pmtDcmRecStano, pmtDcmEndDate, pmtDcmNo) 
	 */
	public void updatePmtDcmRec(PmtDcmVO pmtDcm);
	
	/**
	 * 수신자가 문서처리를 완료하고 완료문서임을 업데이트
	 * @param dcmNo
	 */
	public void updatePmtDcmRecEnd(int dcmNo);
	
	/**
	 * 문서생성시 관련문서 리스트
	 * @param empNo
	 * @return List<PmtDcmVO> 
	 */
	public List<PmtDcmVO> selectRelatedDcmAll(int empNo);
	
	/**
	 * @param empNo
	 * @return PmtDcmVO 인덱스에서 필요한 내 문서 정보
	 */
	public PmtDcmVO selectMyDcmCount(int empNo);
}
