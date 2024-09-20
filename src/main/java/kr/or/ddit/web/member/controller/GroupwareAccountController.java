package kr.or.ddit.web.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/w/member")
public class GroupwareAccountController {
	
	@Autowired
	private EmployeeService empService;
	
	@GetMapping("groupwareJoinForm.do")
	public String groupwareJoinPage() {
		return "tiles:web-user/member/groupwareJoinForm";
	}
	
	@PostMapping("groupwareInsert.do")
	public String groupwareInsertProcess(
			@Validated(InsertGroup.class) @ModelAttribute EmployeeVO employee
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		String lvn = "";
		if(!errors.hasErrors()) {
			ServiceResult result = empService.createEmployeeByAdmin(employee);
			if(ServiceResult.OK.equals(result)) {
				lvn = "redirect:/w/mypage/mypageForm.do";
			}else {
				redirectAttributes.addFlashAttribute("message", "그룹웨어 계정등록 실패, 관리자에게 문의해주세요.");
				redirectAttributes.addFlashAttribute("employee", employee);
				lvn = "redirect:/w/member/groupwareJoinForm.do";
			}
		}else {
			redirectAttributes.addFlashAttribute("employee", employee);
			String attrName = BindingResult.MODEL_KEY_PREFIX+"employee";
			redirectAttributes.addFlashAttribute(attrName, errors);
			lvn = "redirect:/w/member/groupwareJoinForm.do";
		}
		return lvn;
	}

}
