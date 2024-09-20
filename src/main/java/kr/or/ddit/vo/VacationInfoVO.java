package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class VacationInfoVO {

	private int rnum;

	private int vaciNo;

	private Integer comNo;
	private String vaciNm;
	private String vaciDate;
	private Integer vaciDay;
	private String vaciType;
	private String vaciTypeNm;
	private String vaciDelyn;
	private String empYear;
	private List<VacationInfoVO> vacationList;
	private List<ApplicationVO> application; // has many

	// company has a 관계
	private CompanyVO company;

}
