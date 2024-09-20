package kr.or.ddit.vo;

import java.util.Map;

import lombok.Data;

@Data
public class AttendanceVO {

	private int rnum;


	private Integer attNo;
	private Integer empNo;
	private String attStart;
	private String attEnd;
	private String attStartSte;
	private String attEndSte;
	private String attIp;
	private String attDate;
	private String workTime;
	private String totalMinutes;
	private String totalSecound;
	private String workStatus;
	private String totalWorkTime;
	private String percentage;
	private String empCount;
	private String totalDepCount;
	private String totalEmpCount;
	private String remindEmpcount;


	private String month;
	private String year;


	private Map<String, Object> pMap;


	// has a 관계
	private EmployeeVO employee;
	private PositionVO position;
	private OrganizationVO organization;
}
