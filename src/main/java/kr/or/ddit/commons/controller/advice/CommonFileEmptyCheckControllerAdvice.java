package kr.or.ddit.commons.controller.advice;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class CommonFileEmptyCheckControllerAdvice {
	
	@InitBinder
	public void fileEmptyCheck(WebDataBinder binder) {
		binder.setBindEmptyMultipartFiles(false);
	}
	
}
