package kr.or.ddit.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SendVO {
	private int sendNo;
	private int msglogNo;
	private int msgrmNo;
	private int empNo;
	private LocalDateTime sendDate; // LocalDate -> LocalDateTime 변경

	private MsglogVO msgLog;
	private MsgroomVO msgRoom;
	private EmployeeVO employee;
}
