package kr.or.ddit.groupware.mail.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JacksonInject;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.http.HttpResponseException;
import com.google.api.services.gmail.GmailScopes;

import kr.or.ddit.groupware.address.dao.AddressMapper;
import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.mail.service.CredentialManager;
import kr.or.ddit.groupware.mail.service.GmailService;
import kr.or.ddit.groupware.mail.service.OAuthService;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.MailVO;
import lombok.extern.slf4j.Slf4j;

/**
 * Google Gmail API 를 이용한 메일 목록 조회
 * <a href="https://developers.google.com/gmail/api/quickstart/java">참고 사이트</a>
 */
@Slf4j
@Controller
@RequestMapping("/gw")
public class GmailController {
	@Autowired
	private OAuthService oAuthService;
	@Autowired
	private GmailService gmailService;
	@Autowired
	private CredentialManager credentialManager;
	@Autowired
	EmployeeService empservice;
	@Autowired
	AddressMapper addMapper;


	//스코프
	private static final List<String> SCOPES = Arrays.asList(GmailScopes.MAIL_GOOGLE_COM);

	@RequestMapping("/gmail")
	public String mailIndex(HttpSession session, Model model) throws IOException {
		String goPage = null;
		// 1. 저장된 Credential(자격증명) 로딩
		Credential credential = credentialManager.loadCredential(session.getId());
		if (credential == null) {
			// 2. 저장된 credential이 없는 경우. access_token/refresh_token 발급 절차 진행
			goPage = "redirect:" + credentialManager.sendAuthorizationCodeRequest();
		} else {
			boolean valid = credentialManager.validateCredential(credential);
			model.addAttribute("credential", credential);
			String userMailAddress = oAuthService.getUserEmail(credential);
			model.addAttribute("userMailAddress", userMailAddress);

			List<Map<String, String>> mailList = gmailService.mailList(credential, userMailAddress);
			model.addAttribute("mailList", mailList);
			goPage = "tiles:groupware-member/mail/mail";
		}

		//메일전송을 위한 주소록
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    int comNo = empAuth.getRealUser().getComNo();
	    int empNo = empAuth.getRealUser().getEmpNo();

	    EmployeeVO emp = new EmployeeVO();
	    emp.setComNo(comNo);
	    emp.setEmpNo(empNo);

	    List<AddressVO> mailAddList = addMapper.mailAddressList(emp);
	    log.info("{}", mailAddList);
		model.addAttribute("mailAddList", mailAddList);

		return goPage;
	}


	/**
	 * 메일 보내기
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/sendMail.do")
	public String sendSimpleMail(HttpSession session, @RequestBody MailVO mail) throws Exception {

//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
//	    String comNm = empAuth.getRealUser().getCompany().getComNm();
//	    String empNo = empAuth.getRealUser().getEmpNm();
//
		String goPage = null;

//		// 1. 저장된 Credential(자격증명) 로딩
		Credential credential = credentialManager.loadCredential(session.getId());
		goPage = "redirect:" + credentialManager.sendAuthorizationCodeRequest();

		String userMailAddress = oAuthService.getUserEmail(credential);

		Map<String, String> mailInfo = new HashMap<String, String>();
		mailInfo.put("d", userMailAddress);

		gmailService.sendEmail(mail, credential);

		return "redirect:/gw/gmail";
	}


	@GetMapping("/deleteMail.do")
	public void deleteMail(HttpSession session, Model model , @RequestParam("msg") String messageId) throws Exception {

		String goPage = null;

//		// 1. 저장된 Credential(자격증명) 로딩
		Credential credential = credentialManager.loadCredential(session.getId());

		goPage = "redirect:" + credentialManager.sendAuthorizationCodeRequest();
		String userMailAddress = oAuthService.getUserEmail(credential);

		Map<String, String> mailInfo = new HashMap<String, String>();
		mailInfo.put("d", userMailAddress);

//		messageId = model.getAttribute("messageId");
		gmailService.delteEmail(userMailAddress, credential, messageId);

//		return goPage;
	}

	/**
	 * <pre>
	* 저장된 credential이 없는 경우. access_token/refresh_token 발급받아야 하며,
	* 그 사전 단계로 Authorization code 가 발급되면, Google Cloud project 에 등록한 redirect url 로 받을 수 있음.
	 * </pre>
	 *
	 * @param session
	 * @param authorizationCode
	 * @param model
	 * @return Token 을 발급받거나 갱신하고난후 해당 토큰이 사용될 business 로 redirection
	 * @throws IOException
	 */
	@GetMapping("callback")
	public String getAuthorizationCode(HttpSession session, @RequestParam("code") String authorizationCode,
			@RequestParam Map<String, Object> paramMap, Model model) throws IOException {
		credentialManager.createAndStoreCredential(authorizationCode, session.getId());
		return "redirect:/gw/gmail";
	}

	@ExceptionHandler(HttpResponseException.class)
	public String exceptionHandler(HttpResponseException e, HttpSession session) throws IOException {
		int statusCode = e.getStatusCode();
		if ((statusCode / 100) == 4) {
			credentialManager.deleteCredential(session.getId());
		}
		return "error";
	}

}