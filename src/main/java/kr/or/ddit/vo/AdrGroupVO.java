package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class AdrGroupVO implements Serializable {
	private Integer grpNo;
	private Integer empNo;
	private String grpNm;
	private String grpCm;
	private LocalDate grpDate;
	private String grpDelyn;
	
	private EmployeeVO employee;
	private List<GroupEmployeeVO> groupEmployeeList;
	
	private int rnum;
	private int empcount;
	
	

}
