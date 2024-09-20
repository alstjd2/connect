package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

/**
 * 문서번호 테이블
 */
@Data
public class ComdcmNumVO {
	/**
	 * 기업 문서 번호 번호
	 */
	private int comdcmNumNo;
	/**
	 * 기업 번호
	 */
	private int comNo;
	/**
	 * 문서 번호 구성 번호
	 */
	private String dcmNumCnfNo;
	/**
	 * 년월일 구성 번호
	 */
	private String dateCnfNo;
	/**
	 * 문서 구분자 구성 번호
	 */
	private String dcmDisCnfNo;
	/**
	 * 문서 일년 번호 길이
	 */
	private String dcmNumLen;
	/**
	 * 결제문서번호VO
	 */
	private List<ComdcmNumVO> comdcmNumList;
	
	private int dcmNum;
}
