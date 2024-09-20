package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 상품 테이블
 */
@Data
@NoArgsConstructor
public class ProdListVO {
	//상품 개수 통계
	private int	Total;
	private int prodN;
	private int prodY;
	/**
	 * 상품번호
	 */
	private int prodNo;
	/**
	 * 상품명
	 */
	private String prodNm;
	/**
	 * 상품금액
	 */
	private int prodPrice;
	/**
	 * 상품 사용기간(며칠 사용권인지)
	 */
	private int prodUseDay;
	/**
	 * 이벤트 게시글 번호 (int변환해서 사용할것)
	 */
	private String prodEventNm;
	/**
	 * 상세내용1
	 */
	private String prodDetailContent1;
	/**
	 * 상세내용2
	 */
	private String prodDetailContent2;
	/**
	 * 사용여부
	 */
	private String prodAvail;
	/**
	 * 등록날짜
	 */
	@DateTimeFormat
	private String prodCreDate;
	/**
	 * 이벤트 시작날짜
	 */
	private String prodEvenStart;
	/**
	 * 이벤트 종료날짜
	 */
	private String prodEvnEnd;
	/**
	 * 기업상품 구매내역VO
	 */
	private List<BuyListVO> buyListDetail;
}
