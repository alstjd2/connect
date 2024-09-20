package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class AlarmVO implements Serializable {
	private Integer alarmNo;
	private Integer empNo;
	private Integer comNo;
	private String alarmComncode;
	private String alarmChk;
	
	private LocalDateTime alarmDate;
	private String alarmHeader;
	private Integer alarmCode;
	private String alarmLink;
	
	private Integer newCount;
	
	private EmployeeVO employee;

}
