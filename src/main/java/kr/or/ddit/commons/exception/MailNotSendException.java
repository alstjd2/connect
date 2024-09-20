package kr.or.ddit.commons.exception;

public class MailNotSendException extends RuntimeException {
	
	public MailNotSendException() {
		super(String.format("메일 전송 실패"));
	}
}
