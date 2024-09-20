package kr.or.ddit.groupware.document.service;

import java.util.List;

import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.vo.ComdcmFormVO;
import kr.or.ddit.vo.ComdcmNumVO;
import kr.or.ddit.vo.PmtDcmAppVO;
import kr.or.ddit.vo.PmtDcmInsertVO;
import kr.or.ddit.vo.PmtDcmRefNoVO;
import kr.or.ddit.vo.PmtDcmVO;
import kr.or.ddit.vo.PositionVO;

public interface DocumentService {
	/**
	 * @param comNo 회사번호
	 * @return List<PmtDcmVO> 회사 기준의 전체 결재문서 리스트
	 * 관리자 페이지에서 전체 문서리스트를 확인하기 위한 리스트
	 */
	public List<PmtDcmVO> retrievePmtDcmList(int comNo);
	/**
	 * @param pmtDcmNo 문서번호
	 * @return PmtDcmVO 결재문서 내용
	 */
	public PmtDcmVO retrievePmtDcmDetail(int pmtDcmNo);
	/**
	 * @param pmtDcmNo 문서번호
	 * @return List<PmtDcmAppVO> 결재문서에 연관된 결재자 리스트
	 */
	public List<PmtDcmAppVO> retrievePmtDcmAppList(int pmtDcmNo);
	/**
	 * @param pmtDcmNo 문서번호
	 * @return List<PmtDcmRefNoVO> 결재문서에 연관된 참고자 리스트
	 */
	public List<PmtDcmRefNoVO> retrievePmtDcmRefNoAll(int pmtDcmNo);
	/**
	 * @param pmtDemAppEmpId 직원번호
	 * @return List<PmtDcmVO> 본인의 결재문서 리스트
	 * 직원 페이지에서 본인의 결재 문서 리스트를 확인하기 위한 리스트
	 */
	public List<PmtDcmVO> retrieveEmpPmtDcmAll(int pmtDemAppEmpId);
	
	/**
	 * @param pmtDemRefEmpNo 직원번호
	 * @return List<PmtDcmVO> 본인의 참조문서 리스트
	 * 직원 페이지에서 본인의 참조 문서 리스트를 확인하기 위한 리스트
	 */
	public List<PmtDcmVO> retrieveRefEmpPmtDcmAll(int pmtDemRefEmpNo);

	/**
	 * @param pmtDemRecEmpno 직원번호
	 * @return List<PmtDcmVO> 본인의 수신문서 리스트
	 * 직원 페이지에서 본인의 수신 문서 리스트를 확인하기 위한 리스트
	 */
	public List<PmtDcmVO> retrieveRecEmpPmtDcmAll(int pmtDemRecEmpno);
	
	
	/**
	 * @param empNo 직원번호
	 * @return List<PmtDcmVO> 본인과 관련있는(결재, 수신, 참조) 문서리스트
	 * 직원페이지에서 문서 생성시 본인과 관련있는 모든 문서 리스트
	 */
	public List<PmtDcmVO> retrieveRelatedDcmAll(int empNo);
	
	
	/**
	 * @param pmtDcmAppNo
	 * @return PmtDcmAppVo 본인의 결재문서의 form 데이터 
	 */
	public PmtDcmAppVO retrievePmtDcmApp(int pmtDcmAppNo);
	
	/**
	 * @param app 승인 반려 전결 처리에 대한 내용과 코멘트
	 */
	public void modifyPmtDcmApp(PmtDcmAppVO app);
	
	/**
	 * @param PmtDcmVO 문서번호와 문서완료상태
	 * 직원페이지에서 해당 문서의 수신자가 문서를 처리 완료했을 때 작업
	 */
	public void modifyPmtDcmRecEnd(int dcmNO);
	
	/**
	 * 모든 서식에 대한 리스트
	 * @return List<ComdcmFormVO>
	 */
	public List<ComdcmFormVO> retrieveComdcmFormAll();
	
	/**
	 * @param dcmFormCode 서식의 코드명 
	 * @return ComdcmFormVO 선택한 서식의 내용
	 */
	public ComdcmFormVO retrieveComdcmForm(String dcmFormCode);
	
	/**
	 * @param comNo 회사 번호
	 * @return List<PositionVO> 해당회사 직급 리스트
	 */
	public List<PositionVO> retrievePosComAll(int comNo);
	
	/**
	 * 결재 문서 생성
	 * @param dcmDetail
	 */
	public int createPmtDcmAll(PmtDcmInsertVO dcmDetail, AtchFileVO files);
	
	/**
	 * @param empNo
	 * @return PmtDcmVO 인덱스에서 필요한 내 문서 정보
	 */
	public PmtDcmVO retrieveMyDcmCount(int empNo);
	
	/**
	 * @param comNo
	 * @return ComdcmNumVO 문서번호 검색
	 */
	public ComdcmNumVO retrieveComdcmNum(int comNo);
	
	public int modifyComdcmNum(ComdcmNumVO comdcm);
}
