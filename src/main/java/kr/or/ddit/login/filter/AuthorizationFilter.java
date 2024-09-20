package kr.or.ddit.login.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.vo.MemberVOWrapper;

/**
 * 1. 보호자원을 요청한 경우라면
 * 2. 사용자에게 부여된 역할을 확인하고,
 * 3. 자원에 설정된 허가정보와 사용자의 역할 정보가 일치하는 확인
 *    - 일치 (권한 소유함) - 통과
 *    - 불일치 (권한 없음) - 403 Forbidden
 *
 */
public class AuthorizationFilter implements Filter {
   
//   private Map<String, String> securedResources;
//
//   @Override
//   public void init(FilterConfig filterConfig) throws ServletException {
//      securedResources = new LinkedHashMap<>();
//      ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.SecuredResources");
//      for(String key : bundle.keySet()) {
//         String value = bundle.getString(key);
//         securedResources.put(key, value);
//      }
//   }
   
//   @Autowired
   @Resource(name="securedResources")
   private Map<String, String[]> securedResources;

   @Override
   public void init(FilterConfig filterConfig) throws ServletException {
      
   }

   
   @Override
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
         throws IOException, ServletException {
      
      HttpServletRequest req = (HttpServletRequest) request;
      HttpServletResponse resp = (HttpServletResponse) response;
      
      boolean pass = false;
      
      String uri = req.getRequestURI();
      int cpLength = req.getContextPath().length();
      uri = uri.substring(cpLength);
      
      if(securedResources.containsKey(uri)) {
         MemberVOWrapper wrapper = (MemberVOWrapper) req.getUserPrincipal();

         String userRole = wrapper.getRealUser().getMemRole();
         
         String[] roles = securedResources.get(uri);
         
         int status = Arrays.binarySearch(roles, userRole);
         
         if(status >= 0) {
            pass = true;
         }else {
            pass = false;
         }
      }else {
         pass = true;
      }
      
      if(pass) {
         chain.doFilter(request, response);
      }else {
         resp.sendError(HttpServletResponse.SC_FORBIDDEN, "보호자원에 대한 권한 없음.");
      }
      
   }

   
   @Override
   public void destroy() {
      
   }

}
