package kr.or.ddit.security.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.or.ddit.security.CustomGroupwareLoginSuccesshandler;
import kr.or.ddit.security.CustomMemberDetailService;
import kr.or.ddit.security.CustomUserDetailService;
import kr.or.ddit.security.CustomWebLoginSuccesshandler;

@EnableWebSecurity
public class SecurityContextConfig {
	// java config 방식
	// 필터 톰캣에게 알려주기~

	//정적 자원 필터링 안하는 설정
	@Bean
 	public WebSecurityCustomizer webSecurityCustomizer() {
 		return (web) -> web.ignoring()
 				.antMatchers("/resources/**");
 	}

	@Bean
	public UserDetailsService userDetailsService() {
		return new CustomUserDetailService();
	}

	@Bean
	public UserDetailsService memberDetailsService() {
		return new CustomMemberDetailService();
	}

	@Bean
	public AuthenticationProvider userProvider() {
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(userDetailsService());
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
	}
	@Bean
	public AuthenticationProvider memberProvider() {
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(memberDetailsService());
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
	}

	public AuthenticationManager userAuthenticationManager() {
		ProviderManager manager = new ProviderManager(userProvider());
		manager.setEraseCredentialsAfterAuthentication(false);
		return manager;
	}
	
	public AuthenticationManager memberAuthenticationManager() {
		ProviderManager manager = new ProviderManager(memberProvider());
		manager.setEraseCredentialsAfterAuthentication(false);
		return manager;
	}

	@Bean
	public AuthenticationSuccessHandler webSuccessHandler()  {
		return new CustomWebLoginSuccesshandler();
	}

	@Bean
	public AuthenticationSuccessHandler groupwareSuccessHandler()  {
		return new CustomGroupwareLoginSuccesshandler();
	}

	@Bean // 두번 필요 없음
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return encoder;
	}

	@Bean
	@Order(1)
	public SecurityFilterChain userSecurityFilterChain(HttpSecurity http) throws Exception{
		http.authenticationManager(userAuthenticationManager());

		http.antMatcher("/w/**").authorizeRequests()
								.antMatchers("/w/mypage/**").hasRole("MEMBER")
								.antMatchers("/w/membership/**").hasRole("PROVIDER")
								.anyRequest().permitAll()
								.and()
								.formLogin()
								.loginPage("/w/login/loginForm.do")
								.usernameParameter("memId")
								.passwordParameter("memPw")
								.loginProcessingUrl("/w/login/loginForm.do")
								.successHandler(webSuccessHandler())
//								.defaultSuccessUrl("/w/index.do")
								.permitAll();

		http.logout().logoutUrl("/w/login/logout.do")
					 .logoutSuccessUrl("/w/index.do")
//					 .invalidateHttpSession(true).deleteCookies("JSESSIONID")
					 ;

		http.csrf().disable();
		return http.build();
	}


	@Bean
	@Order(2)
	public SecurityFilterChain memberSecurityFilterChain(HttpSecurity http) throws Exception{
		http.authenticationManager(memberAuthenticationManager());

		http.antMatcher("/gw/**").authorizeRequests()
								.antMatchers("/gw/login/**").permitAll()
//								.antMatchers("/gw/index.do").permitAll()
								.anyRequest().hasAnyRole("ADMIN","EMPLOYEE")
								.and()
								.formLogin()
								.loginPage("/gw/login/loginForm.do")
								.usernameParameter("empId")
								.passwordParameter("empPw")
								.loginProcessingUrl("/gw/login/loginForm.do")
								.successHandler(groupwareSuccessHandler())
//								.defaultSuccessUrl("/gw/index.do")
								.permitAll();

		http.logout().logoutUrl("/gw/login/logout.do")
					 .logoutSuccessUrl("/gw/index.do")
//					 .invalidateHttpSession(true).deleteCookies("JSESSIONID")
					 ;

		http.csrf().disable();
		return http.build();
	}

	@Bean
	@Order(3)
	public SecurityFilterChain anySecurityFilterChain(HttpSecurity http) throws Exception{
		http.authorizeRequests()
			.anyRequest().permitAll();

		http.csrf().disable();
		return http.build();
	}


}


