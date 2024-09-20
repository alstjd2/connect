package kr.or.ddit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomGroupwareLoginSuccesshandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(obj->{
			log.info("\n로그인 권한 정보 => {}\n", obj.getAuthority());
			roleNames.add(obj.getAuthority());
		});
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
	    int empNo = emp.getEmpNo();
	    HttpSession session = request.getSession();
        session.setAttribute("empNo", empNo);
		
		
		
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath() + "/gw/adminPage.do");
			return;
		}
		
		if(roleNames.contains("ROLE_EMPLOYEE")) {
			response.sendRedirect(request.getContextPath() + "/gw/index.do");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/gw/index.do");
		
	}

}
