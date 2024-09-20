package kr.or.ddit.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
 * 프로모션 테이블
 */
@Data
public class PromotionVO {
	/**
	 * 프로모션 번호
	 */
	private int promoNo;
	/**
	 * 게시판 번호
	 */
	private int boardNo;
	/**
	 * 이벤트 시작일시
	 */
	@DateTimeFormat(iso = ISO.DATE_TIME)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@NotNull
	private LocalDate promoStdate;
	/**
	 * 이벤트 종료일시
	 */
	@DateTimeFormat(iso = ISO.DATE_TIME)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@NotNull
	private LocalDate promoEnddate;
	/**
	 * 진행방식
	 */
	private String promoProgdmet;
	/**
	 * 진행여부
	 */
	private String promoProgcheck;
	/**
	 * 수용인원
	 */
	private int promoNum;
	/**
	 * 통합게시글VO
	 */
	private BoardVO board;
	/**
	 * 오프라인교육
	 */
	private OffeduVO offEdu;
	/**
	 * 공통코드-프로모션방식
	 */
	private CommoncodeDetailVO common;

	/**
	 * 상품
	 */
	private ProdListVO prod;

	//등록된 이벤트 개수 조회를 위한 객체
	private int total;
	private int sale;
	private int offe;
	private int one;


}
