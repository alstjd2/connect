package kr.or.ddit.commons.exception;

public class PkNotFoundException extends RuntimeException{

	public PkNotFoundException(Object pk) {
		super(String.format("%s 해당 데이터 없음.", pk));
	}
	
}
