package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ApplicationVO {

	private int rnum;
	private int cnt; // 경조, 특별휴가 카운트
	private int days; // 사용일수


	private int appNo;

	private int empNo;

	private int vaciNo;
	private String appStrdate;
	private String appEnddate;
	private int appTememp;
	private String appDetail;
	private String appDep;
	private String appDate;
	private int appRovemp;
	private String appState;
	private String appStateNm;
	private String vaciType;
	private String vaciTypeNm;
	private String appFinaldate;

	private String temEmpNm; // 대무자 이름
	private String roveNm; // 결재자 이름

	private VacationInfoVO vacationInfo; // 휴가 정보 테이블과 1:1 has a

	private List<VacationInfoVO> vacationList;
//	private employee 테이블과 1:1 has a
	private EmployeeVO employee;


}
