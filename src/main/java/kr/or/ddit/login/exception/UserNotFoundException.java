package kr.or.ddit.login.exception;


/**
 * username 에 해당하는 사용자가 없음.
 *
 */
public class UserNotFoundException extends AuthenticateException {

	
	public UserNotFoundException(String username) {
		super(String.format("%s 에 해당하는 사용자 없음.", username));
	}
	
	public UserNotFoundException(int userno) {
		super(String.format("%s 에 해당하는 사용자 없음.", userno));
	}

}
