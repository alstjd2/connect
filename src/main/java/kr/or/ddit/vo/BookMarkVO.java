package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class BookMarkVO implements Serializable {
	private int rnum;
	private Integer markNo;
	private Integer empNo;
	private Integer markTarget;
	
	private EmployeeVO employee;
	
}
