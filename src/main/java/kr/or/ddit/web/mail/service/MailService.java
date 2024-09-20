package kr.or.ddit.web.mail.service;

import kr.or.ddit.vo.MailVO;

public interface MailService {
	
	/**
	 * 메일 송신
	 * 발신자는 connect로 나온다
	 * MailVO에 내용을 담아서 파라미터로 넘겨야한다. 오류가 날 경우 Exception 발생
	 * @param 수신자에 대한 eMail주소, 제목, 내용을 담은 MailVO
	 */
	public void sendMail(MailVO mail);

}
