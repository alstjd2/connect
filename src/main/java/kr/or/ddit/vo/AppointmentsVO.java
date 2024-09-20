package kr.or.ddit.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AppointmentsVO {

	/**
	 * 인사발령번호
	 */
	private int apmNo;

	/**
	 * 직원번호
	 */
	private int empNo;

	/**
	 * 기업번호
	 */
	private int comNo;

	/**
	 * 인사발령작성자
	 */
	private int apmWriter;

	/**
	 * 인사발령일
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate apmDate;

	/**
	 * 등록일
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate apmEndate;

	/**
	 * 발령구분
	 */
	private String apmType;    // 발령종류 공통코드 ex)EB01110

	/**
	 * 발령내용
	 */
	private String apmContent;

	/**
	 * 발령취소여부
	 */
	private String apmDelyn;

	private String empState;


	private EmployeeVO employee;

	private CompanyVO company;

	private OrganizationVO organization;



	private String apmTypeName;  // 발령종류명

	private String employeeName; // 직원명

	private String departmentName;  // 부서명

	private String positionName; // 직급명

	private String onePositionName; // 직책명

	private String newState;  // 새로운 상태를 저장할 필드

	private int newOrgDep; // 부서 변경시 새로운 부서 필드




}
