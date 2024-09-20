package kr.or.ddit.vo;

import lombok.Data;

/**
 * 오프라인교육 테이블
 */
@Data
public class OffeduVO {

	/**
	 * 오프라인교육 신청번호
	 */
	private int offeduNo;
	/**
	 * 프로모션 번호
	 */
	private int promoNo;
	/**
	 * 회원번호
	 */
	private String memNm;
	/**
	 * 기업명
	 */
	private String offeduComnm;
	/**
	 * 신청인원
	 */
	private int offeduOfferNum;



}
