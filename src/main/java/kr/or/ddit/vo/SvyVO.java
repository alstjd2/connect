package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"svyNo"})
public class SvyVO {
	private Integer svyNo;
	private Integer comNo;
	private String svyTemYn;
	private String svyImpYn;
	private String svyAnyYn;
	private String svyAllYn;
	private String svyNm;
	@DateTimeFormat(iso = ISO.DATE) 
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDate svyStrDate;
	@DateTimeFormat(iso = ISO.DATE) 
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDate svyEndDate;
	private String svyStatus;
	private Integer svyAllNum;
	private Integer svyAskNum;
	
	private CompanyVO company;
	private EmployeeVO employee;
	
	private List<ChiVO> chiList;
	private List<SvyAnsVO> svyAnsList;
	private SvyAskVO svyAsk;
	
	private String svyAnsListString;
	
	private Integer totalAnswerees;     //응답대상자수
	private Integer actualRespondents;  //실제응답자수

}
