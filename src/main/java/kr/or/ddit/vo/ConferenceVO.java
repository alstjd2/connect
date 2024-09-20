package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class ConferenceVO {
	private int rnum;
	
	private Integer conNo;
	private Integer empNo;
	private String roomTitle;
	private String roomUrlId;
	private String roomType;
	private String callType;
	private String passwd;
	private String maxJoinCount;
	private String startDate;
	private String endDate;
	private Integer comNo;
	
	private EmployeeVO employee;

}
