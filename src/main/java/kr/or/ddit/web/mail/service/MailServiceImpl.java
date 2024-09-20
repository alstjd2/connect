package kr.or.ddit.web.mail.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.MailNotSendException;
import kr.or.ddit.vo.MailVO;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public void sendMail(MailVO mail) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");

			//메일 수신 시 표시될 이름 설정
			messageHelper.setFrom("connect@ddit.or.kr","connect");
			messageHelper.setTo(mail.getEMail());
			messageHelper.setSubject(mail.getTitle());
			messageHelper.setText(mail.getContent());
			mailSender.send(message);

		} catch (Exception e)
		{
			throw new MailNotSendException();
		}
	}

}
