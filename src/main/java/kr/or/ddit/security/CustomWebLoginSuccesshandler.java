package kr.or.ddit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomWebLoginSuccesshandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(obj->{
			log.info("\n로그인 권한 정보 => {}\n", obj.getAuthority());
			roleNames.add(obj.getAuthority());
		});
		
		if(roleNames.contains("ROLE_PROVIDER")) {
			response.sendRedirect(request.getContextPath() + "/w/membership/membershipListPage.do");
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect(request.getContextPath() + "/w/index.do");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/w/index.do");
		
	}

}
