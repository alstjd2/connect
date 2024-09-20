package kr.or.ddit.login.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 	원본요청을 받고, 로그인 여부를 확인한 후,
 *  로그인이 되어 있다면, wrapper request 정의하고,
 *  wrapper request 내부에 Principal 구현체를 넣어줌.
 *
 */
public class GeneratePrinclpalFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.printf("%s 필터 초기화 완료\n", this.getClass().getSimpleName());
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		HttpServletRequest req = (HttpServletRequest)request;
//		HttpSession session = req.getSession();
//		MemberVO authUser = (MemberVO) session.getAttribute("authMember");
//		if(authUser!=null) {
//			HttpServletRequestWrapper wrapper = new HttpServletRequestWrapper(req) {
//				@Override
//				public Principal getUserPrincipal() {
//					Principal principal = new MemberVOWrapper(authUser);
//					return principal;
//				}
//			};
//			chain.doFilter(wrapper, response);
//		}else {
//			chain.doFilter(request, response);			
//		}

	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
}
