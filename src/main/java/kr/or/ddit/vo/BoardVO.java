package kr.or.ddit.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
 *	통합게시글VO
 */
@Data
public class BoardVO {
	private int rnum;

	/**
	 * 게시판 종류 > 공통코드 상세번호
	 */
	private String boardGuideType;
	/**
	 * 게시판 번호
	 */
	private int boardNo;
	/**
	 * 회원번호
	 */
	private int memNo;
	/**
	 * 게시글 제목
	 */
	@NotBlank(message = "필수 입력 값입니다.")
	private String boardTitle;
	/**
	 * 게시글 내용
	 */
	@NotBlank(message = "필수 입력 값입니다.")
	private String boardContent;
	/**
	 * 첨부파일분류번호
	 */
	private int boardAttachfile;
	/**
	 * 게시판 생성일
	 */
	@DateTimeFormat(iso = ISO.DATE_TIME)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private LocalDate boardDate;
	/**
	 * 게시판 사용여부
	 */
	private String boardDelyn;
	/**
	 * 게시판 가이드 상세 종류
	 */
	private String boardType;

	/**
	 * 프로모션VO
	 */
	private PromotionVO promotion;

	/**
	 * 공통코드 상세
	 */
	private CommoncodeDetailVO commoncodeDetail;


	private ProdListVO prod;


}