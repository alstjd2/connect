package kr.or.ddit.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RecieveVO {
	private int recvNo;
	private int msglogNo;
	private int msgrmNo;
	private int empNo;
	private String recvCheck;
	private LocalDateTime recvDate;  // LocalDate -> LocalDateTime 변경

	private MsglogVO msgLog;
	private MsgroomVO msgRoom;
	private EmployeeVO employee;
}
