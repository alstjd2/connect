package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MailVO {

	private String eMail;
	private String title;
	private String content;

	private int empNo;
	private int mailNo;

	private String[] add;
}
