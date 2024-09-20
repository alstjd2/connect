package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class GroupEmployeeVO implements Serializable {
	private Integer grpNo;
	private Integer empNo;
	
	private AdrGroupVO group;
	
	private String empNm;

}
