package kr.or.ddit.vo;

import lombok.Data;

/**
 * 결재선 테이블
 */
@Data
public class PmtLineVO {
	/**
	 * 결재선 번호
	 */
	private int pmtLineNo;
	/**
	 * 직원 번호
	 */
	private int empNo;
	/**
	 * 기업 구분 번호
	 */
	private int comNo;
	/**
	 * 결재선 첫번째 직원
	 */
	private int pmtLineOneId;
	/**
	 * 결재선 두번째 직원
	 */
	private int pmtLineTwoId;
	/**
	 * 결재선 세번째 직원
	 */
	private int pmtLineThreeId;
	/**
	 * 결재선 네번째 직원
	 */
	private int pmtLineFourId;
	/**
	 * 결재선 다섯번째 직원
	 */
	private int pmtLineFiveId;
	/**
	 * 결재선 사용 여부
	 */
	private String pmtLineYn;
}
