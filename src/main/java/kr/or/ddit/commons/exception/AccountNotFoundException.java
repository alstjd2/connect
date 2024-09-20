package kr.or.ddit.commons.exception;

public class AccountNotFoundException extends RuntimeException{
	
	public AccountNotFoundException() {
		super(String.format("입력된 정보에 해당하는 계정 없음."));
	}
	
}
