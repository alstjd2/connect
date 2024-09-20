package kr.or.ddit.groupware.mail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.mail.dao.mailSaveMapper;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.MailVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailSaveServiceImpl implements MailSaveService{

	@Autowired
	private mailSaveMapper mailMapper;

	/**
	 * 임시저장
	 * @param mail
	 * @return
	 */
	public void insertMail(MailVO mail) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    int empNo = empAuth.getRealUser().getEmpNo();
	    mail.setEmpNo(empNo);

		int i = mailMapper.insertSaveMail(mail);
		log.info("insert : {} ", i);

	}


}
