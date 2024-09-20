package kr.or.ddit.web.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.MemberVOWrapper;

@Controller
@RequestMapping("/w/member")
public class CompanyInsertController {
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("companyJoinForm.do")
	public String companyJoinForm() {
		return "tiles:web-user/member/companyJoinForm";
	}
	
	@PostMapping("companyJoinFormData.do")
	public String webJoinFormData(
			@Validated(InsertGroup.class) @ModelAttribute("company") CompanyVO company
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		String lvn = "";
		if(!errors.hasErrors()) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			MemberVOWrapper memAuth = (MemberVOWrapper) auth.getPrincipal();
			company.setMemNo(memAuth.getRealUser().getMemNo());
			
			ServiceResult result = companyService.createCompany(company);
			if(ServiceResult.OK.equals(result)) {
				redirectAttributes.addFlashAttribute("message", "기업등록에 성공했습니다.");
				lvn = "redirect:/w/mypage/mypageForm.do";
			}else {
				redirectAttributes.addFlashAttribute("company", company);
				redirectAttributes.addFlashAttribute("message", "기업등록 실패, 관리자에게 문의해주세요.");
				lvn = "redirect:/w/member/companyJoinForm.do";
			}
		}else {
			 redirectAttributes.addFlashAttribute("company", company);
			 String attrName = BindingResult.MODEL_KEY_PREFIX+"company";
			 redirectAttributes.addFlashAttribute(attrName, errors);
			 lvn = "redirect:/w/member/companyJoinForm.do";
		 }
		return lvn;
	}
	
}
