package kr.or.ddit.groupware.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.vo.CompanyVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/gw/company")
@RequiredArgsConstructor
public class CompanyErrorBtnController {
	
	@GetMapping("guide-admin.do")
	public String adminGuideBtn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/w/support/guide-admin.do";
	}
	
	@GetMapping("guide-service.do")
	public String serviceGuideBtn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/w/support/guide-service.do";
	}

}
