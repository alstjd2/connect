package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"chiNo"})
public class ChiVO {
	private Integer chiNo;
	private Integer svyNo;
	private String chiNm;
	private String chiOvlYn;
	
	private SvyVO svy;
	
	/**
	 * 선택할수 있는 항목을 가지고 있음 
	 */
	private List<ClsVO> clsList;
	

	


}
