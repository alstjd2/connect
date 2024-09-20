package kr.or.ddit.vo;

import lombok.Data;


/**
 * 매출액 조회
 * @author PC-06
 *
 */
@Data
public class VRevenueVO {

	/**
	 * 매출액
	 */
	private Integer revenue;
	
	/**
	 * 년월
	 */
	private String dateGroup;
	
	
}
