package kr.or.ddit.web.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.exception.UserNotFoundException;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.web.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/w/member")
public class MemberInsertController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private PasswordEncoder encoder;
	
	@GetMapping("joinForm.do")
	public String webJoinForm() {
		return "tiles:web-user/login/joinForm";
	}
	
	@PostMapping(path = "memIdChk", produces = MediaType.APPLICATION_JSON_VALUE)
	public void webMemIdChk(@RequestParam String inputId, Model model) {
		
		try {
			memberService.retrieveMemberById(inputId);
			// false 면 아이디 중복이 됐다.
			model.addAttribute("valid", false);
			model.addAttribute("message", "아이디가 중복입니다.");
		} catch (UserNotFoundException e) {
			// true면 아이디써도됨
			model.addAttribute("valid", true);
			model.addAttribute("message", "사용 가능한 아이디입니다.");
		}
		
	}
	
	@PostMapping("joinFormData.do")
	public String webJoinFormData(
			@Validated(InsertGroup.class) @ModelAttribute("member") MemberVO member
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		String lvn = "";
		
		if(!errors.hasErrors()) {
			String hashMemPw = encoder.encode(member.getMemPw());
			member.setMemPw(hashMemPw);
			ServiceResult result = memberService.createMember(member);
			if(ServiceResult.OK.equals(result)) {
				redirectAttributes.addFlashAttribute("message", "회원가입에 성공했습니다.");
				lvn = "redirect:/w/login/loginForm.do";
			}else {
				redirectAttributes.addFlashAttribute("member", member);
				redirectAttributes.addFlashAttribute("message", "회원가입 실패, 관리자에게 문의해주세요.");
				lvn = "redirect:/w/member/joinForm.do";
			}
		}else {
			 redirectAttributes.addFlashAttribute("member", member);
			 String attrName = BindingResult.MODEL_KEY_PREFIX+"member";
			 redirectAttributes.addFlashAttribute(attrName, errors);
			 lvn = "redirect:/w/member/joinForm.do";
		 }
		return lvn;
	}
}
