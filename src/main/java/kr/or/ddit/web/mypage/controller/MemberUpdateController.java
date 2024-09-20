package kr.or.ddit.web.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.member.service.MemberService;

@Controller
@RequestMapping("/w/mypage")
public class MemberUpdateController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("updateForm.do")
	public String updateForm(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
		MemberVO memberVO = memberService.retrieveMemberDetail(memberAuth.getRealUser().getMemNo());
		model.addAttribute("member" ,memberVO);
		
		return "tiles:web-user/member/updateForm";
	}
	
	@PostMapping("updateProcess.do")
	public String updateProcess(
			@Validated(UpdateGroup.class) @ModelAttribute("member") MemberVO member
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		String lvn = "";
		
		if(!errors.hasErrors()) {
			ServiceResult result = memberService.modifyMember(member);
			if(ServiceResult.OK.equals(result)) {
				redirectAttributes.addFlashAttribute("message", "회원정보 수정에 성공했습니다.");
				lvn = "redirect:/w/mypage/mypageForm.do";
			}else {
				redirectAttributes.addFlashAttribute("member", member);
				redirectAttributes.addFlashAttribute("message", "정보수정 실패, 관리자에게 문의해주세요.");
				lvn = "redirect:/w/member/mypageForm.do";
			}
		}else {
			 redirectAttributes.addFlashAttribute("member", member);
			 String attrName = BindingResult.MODEL_KEY_PREFIX+"member";
			 redirectAttributes.addFlashAttribute(attrName, errors);
			 lvn = "redirect:/w/member/mypageForm.do";
		 }
		return lvn;
	}
}
