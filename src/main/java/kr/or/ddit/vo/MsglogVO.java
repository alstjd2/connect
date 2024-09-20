package kr.or.ddit.vo;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MsglogVO {
	private int msglogNo;
	private int msgrmNo;
	private String msglogContent;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime msglogWtdate;   // LocalDate -> LocalDateTime 변경
	private Integer atchFileId;
	private String empNm;
	private int empNo;


	private MsgroomVO msgRoom;
	private RecieveVO recieve;
	private AtchFileVO atchFile;
	private EmployeeVO employee;
}
