package kr.or.ddit.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class EdrivelogVO {

	private Integer edrivelogNo;
//	@DateTimeFormat(pattern = "yyyy-MM-dd'a'HH:mm:ss")
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private LocalDateTime edrivelogDate;
	private String edrivelogCon;
	private Integer empNo;
	private String edrivelogState;
	private String edrivelogFileNm;
	private String edrivelogFileExtsn;
	private String edrivelogFileFancysize;
	private String edrivelogViewpath;
	
	// 작업상태명
	private String edrivelogStateNm;
	
}
