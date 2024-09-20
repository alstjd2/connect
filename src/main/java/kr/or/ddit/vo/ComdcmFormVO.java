package kr.or.ddit.vo;

import lombok.Data;

/**
 * 문서서식 테이블
 */
@Data
public class ComdcmFormVO {
	/**
	 * 기업 문서 서식 번호
	 */
	private int dcmFormNo;
	/**
	 * 문서 카테고리 번호
	 */
	private String dcmCtgNo;
	/**
	 * 문서 서식명
	 */
	private String dcmFormNm;
	/**
	 *  문서 서식 코드
	 */
	private String dcmFormCode;
	/**
	 * 문서 서식 제목
	 */
	private String dcmFormTitle;
	/**
	 * 문서 서식 내용
	 */
	private String dcmFormCnt;
	/**
	 * 문서 첨부파일 여부
	 */
	private String dcmFormFilesYn;
	
	private DcmCtgVO category;
	
	
}
