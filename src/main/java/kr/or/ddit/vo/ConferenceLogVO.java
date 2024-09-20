package kr.or.ddit.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ConferenceLogVO {
	private Integer conlogNo;
	private Integer conparNo;
	private Integer conlogConid;
	private String conlogType;
	private String conlogMsg;
	private LocalDate conlogAt;

}
