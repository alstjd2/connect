package kr.or.ddit.web.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.exception.AccountNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.web.member.service.MemberService;

@Controller
@RequestMapping("/w/member")
public class MemberAccountFindController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("idFind.do")
	public String idFindForm() {
		return "tiles:web-user/login/findId";
	}
	
	@GetMapping("pwFind.do")
	public String pwFindForm() {
		return "tiles:web-user/login/findPw";
	}
	
	@PostMapping(path = "idFind.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public void idFindProcess(MemberVO member, Model model) {
		try {
			String memId = memberService.MemberIdFind(member);
			model.addAttribute("message", memId);
			model.addAttribute("result", true);
		} catch (AccountNotFoundException e) {
			model.addAttribute("message", e.getMessage());
			model.addAttribute("result", false);
		}
	}
	
	@PostMapping(path = "pwFind.do", produces = MediaType.APPLICATION_JSON_VALUE)
	public void pwFindProcess(MemberVO member, Model model) {
		try {
			ServiceResult result = memberService.memberPwFind(member);
			
			if(ServiceResult.OK.equals(result)) {
				model.addAttribute("result", true);
				model.addAttribute("message", "임시 비밀번호를 메일로 전송했습니다.");
			}
		} catch (AccountNotFoundException e) {
			model.addAttribute("result", false);
			model.addAttribute("message", e.getMessage());
		}
	}
	
	
}
