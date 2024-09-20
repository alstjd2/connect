package kr.or.ddit.vo;

import lombok.Data;

/**
 * 환불신청 테이블
 */
@Data
public class RefnListVO {
	/**
	 * 기업번호
	 */
	private int comNo;
	/**
	 * 구매번호
	 */
	private int buyNo;
	/**
	 * 환불 신청날짜
	 */
	private String refnDate;
	/**
	 * 처리진행 등록날짜
	 */
	private String refnChkDate;
	/**
	 * 환불 신청사유
	 */
	private String refnDetailContent;
	/**
	 * 환불 처리결과
	 */
	private String refnStatus;
	
	/**
	 * 결제내역
	 */
	private BuyListVO buyDetail;
}
