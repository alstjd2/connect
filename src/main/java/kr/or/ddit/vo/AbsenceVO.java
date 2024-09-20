package kr.or.ddit.vo;


import lombok.Data;

@Data
public class AbsenceVO  {
	
	private int abNo;
	
	private int comNo;
	
	private String abContent;
	
	private CompanyVO company; 
}
