package kr.or.ddit.login.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.ResourceBundle;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.web.member.dao.MemberMapper;
import lombok.extern.slf4j.Slf4j;

/**
 * 1. 보호 자원을 요청한 경우
 * 2. 인증 여부를 판단하고(Principal 객체 존재 여부)
 * - 인증된 상태 : 통과
 * - 미인증된 상태 : 로그인 폼으로 이동
 *
 */
@Slf4j
public class AuthenticationFilter implements Filter {
   
   
   @Resource(name = "securedResources")
   private Map<String, String[]> securedResources;
   @Autowired
   private MemberMapper dao;
   
   public void init() {
      ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.SecuredResources");
      for(String key : bundle.keySet()) {
         String value = bundle.getString(key).trim();
         String[] roles = value.split("\\s*,\\s*");
         Arrays.sort(roles);
         securedResources.put(key, roles);
      }
      log.info("주입 된 보호 자원 맵 : {}", securedResources);
   }
   
   @Override
   public void init(FilterConfig filterConfig) throws ServletException {
      
   }
   
   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
         throws IOException, ServletException {
      HttpServletRequest req = (HttpServletRequest) request;
      HttpServletResponse resp = (HttpServletResponse) response;
      // ex) /WebStudy01/09/sessionTimer.jsp
      String uri = req.getRequestURI();
      int cpLength = req.getContextPath().length();
      uri = uri.substring(cpLength);
      boolean pass = false;
      //  * 1. 보호 자원을 요청한 경우
      if(securedResources.containsKey(uri)) {
         //  * 2. 인증 여부를 판단하고(Principal 객체 존재 여부)
         if(req.getUserPrincipal()!=null) {
            //  * - 인증된 상태 : 통과
            pass = true;
         }else {
            //  * - 미인증된 상태 : 로그인 폼으로 이동
            pass = false;
         }
         
      }else {
         pass = true;
      }
      
      if(pass) {
         chain.doFilter(request, response);
      }else {
         String location = req.getContextPath() + "/login/loginForm.jsp";
         resp.sendRedirect(location);
      }
      
   }
   
   @Override
   public void destroy() {
      
   }
}
