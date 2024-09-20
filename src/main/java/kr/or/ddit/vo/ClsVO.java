package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class ClsVO {
	private Integer clsNo;
	private Integer chiNo;
	private String clsCnt;
	private Integer clsImg;
	
	private ChiVO chi;
	/**
	 * 현재 문항에 대한 응답한사람
	 */
	private List<SvyAnsListVO> svyAnsListList;


}
