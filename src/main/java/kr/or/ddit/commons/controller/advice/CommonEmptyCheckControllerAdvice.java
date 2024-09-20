package kr.or.ddit.commons.controller.advice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice(basePackages = "kr.or.ddit.groupware")
public class CommonEmptyCheckControllerAdvice {	
	
	@Autowired
	private CompanyService service;
	
	
	
	@Autowired
	private AuthenticationProvider memberProvider;
	
	@ModelAttribute("company")
	public CompanyVO com() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		CompanyVO comNowInfo = service.retrieveCompanyInfo(emp.getComNo());
		return comNowInfo;
	}
	
	/*
	 * @InitBinder public void empNowInfo() { Authentication oldAuthentication =
	 * SecurityContextHolder.getContext().getAuthentication(); SecurityContext
	 * newContext = SecurityContextHolder.createEmptyContext();
	 * SecurityContextHolder.setContext(newContext);
	 * UsernamePasswordAuthenticationToken token = new
	 * UsernamePasswordAuthenticationToken(oldAuthentication.getName(),
	 * oldAuthentication.getCredentials()); Authentication newAuthentication =
	 * memberProvider.authenticate(token);
	 * newContext.setAuthentication(newAuthentication); }
	 */
	
}
