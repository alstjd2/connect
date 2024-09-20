package kr.or.ddit.groupware.pmtDcmRefNo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PmtDcmRefNoVO;

@Mapper
public interface PmtDcmRefNoMapper {

	/**
	 * 결재문서참고 삭제
	 * @param pmtDcmRefNo
	 * @return
	 */
	public int deletePmtDcmRefNo(int pmtDcmRefNo);
	
	/**
	 * 결재문서참고 삽입
	 * @param pmtDcmRefNoVO
	 * @return
	 */
	public int insertPmtDcmRefNo(PmtDcmRefNoVO pmtDcmRefNoVO);
	
	/**
	 * 결재문서참고 수정
	 * @param pmtDcmRefNoVO
	 * @return
	 */
	public int updatePmtDcmRefNo(PmtDcmRefNoVO pmtDcmRefNoVO);
	
	/**
	 * 결재문서참고 상세조회
	 * @param pmtDcmRefNo
	 * @return
	 */
	public PmtDcmRefNoVO selectPmtDcmRefNo(int dcmNo);

	/**
	 * 결재문서참고 전체조회
	 * @return
	 */
	public List<PmtDcmRefNoVO> selectPmtDcmRefNoAll(int dcmNo);

}
