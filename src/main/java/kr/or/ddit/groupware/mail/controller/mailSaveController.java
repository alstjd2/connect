package kr.or.ddit.groupware.mail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.mail.service.MailSaveService;
import kr.or.ddit.vo.MailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gw/mail")
public class mailSaveController {

	@Autowired
	MailSaveService mailService;


	/**
	 * 메일 임시저장(제목, 내용 )
	 * @param model
	 */
	@PostMapping("/save.do")
	public void mailSave(@RequestBody MailVO mail) {
		mailService.insertMail(mail);
	}



}
