package kr.or.ddit.login.exception;


/**
 * 비밀번호 오류로 인한 인증 실패
 *
 */
public class BadCredentialException extends AuthenticateException {

	public BadCredentialException() {
		super("비밀번호 오류");
	}
	
}
