package kr.or.ddit.vo;


import lombok.Data;

/**
 * 구매리스트 테이블
 */
@Data
public class BuyListVO {

	/**
	 * 번호
	 */
	private int cnt;
	/**
	 * 구매식별번호
	 */
	private int buyNo;
	private int buyAmount;
	/**
	 * 결제 고유번호
	 */
	private String buyTid;
	private String buyTgToken;
	/**
	 * 결제 완료상태
	 */
	private String buyStatus;
	/**
	 * 기업번호
	 */
	private int comNo;
	/**
	 * 구매상품번호
	 */
	private int prodNo;
	/**
	 * 구매날짜
	 */
	private String buyDate;
	/**
	 * 사용 시작날짜
	 */
	private String buyUseStartDate;
	/**
	 * 사용 만료날짜
	 */
	private String buyUseEndDate;
	/**
	 * 환불여부
	 */
	private String buyRefn;
	/**
	 * 결제 카드번호
	 */
	private String buyCardNo;
	/**
	 * 결제 카드은행명
	 */
	private String buyBankNm;
	/**
	 * 결제 카드소유자명
	 */
	private String buyCardNm;
	/**
	 * 기업상품 환불신청VO
	 */
	private RefnListVO refnDetail;
	/**
	 * 구매한 상품상세VO
	 */
	private ProdListVO prod;
	/**
	 * 회사 상세VO
	 */
	private CompanyVO company;

	/**
	 * 매출/환불 <select> 조회
	 */
	private String dateStr;

}
