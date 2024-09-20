package kr.or.ddit.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CerificateVO {

	private int certNo;
	private int empNo;
	private int comNo;
	private String certKind;
	private LocalDate certIdate;
	private String certAmt;
	private String certIsscon;
	private String certPorp;
	private String certIssNo;

	private String empNm;

	private EmployeeVO employee;
	private CompanyVO company;
}
