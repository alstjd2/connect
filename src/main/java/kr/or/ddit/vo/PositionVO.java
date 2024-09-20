package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PositionVO {
	/**
	 * 기업별직위번호
	 */
	private Integer posNo;
	/**
	 *기업번호
	 */
	private Integer comNo;
	/**
	 * 직위명
	 */
	private String posNm;
	/**
	 * 직위분류
	 */
	private String posType;

	private CompanyVO company;



	/**
	 * 이희진
	 */
	private String ONEPOSNM;
}
