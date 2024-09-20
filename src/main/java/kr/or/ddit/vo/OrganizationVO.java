package kr.or.ddit.vo;

import lombok.Data;

@Data
public class OrganizationVO {
	/**
	 * 조직도번호
	 */
	private int orgNo;
	/**
	 * 기업번호
	 */
	private int comNo;
	/**
	 * 조직부서
	 */
	private String orgDep;
	/**
	 * 조직상위부서
	 */
	private String orgUpdep;
	/**
	 * 조직도레벨
	 */
	private String orgLevel;
	/**
	 * 부서장
	 */
	private String orgDf;
	/**
	 * 삭제여부
	 */
	private String orgDelyn;

	/**
	 * 조직도아이디
	 */
	private int orgId;

	private CompanyVO company;

	private int orgChildCnt;
}
