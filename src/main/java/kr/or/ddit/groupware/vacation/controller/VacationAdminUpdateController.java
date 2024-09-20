package kr.or.ddit.groupware.vacation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.vacation.service.VacationInfoService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.VacationInfoVO;
import kr.or.ddit.vo.VacationListVO;

@Controller
@RequestMapping("/gw/vacation")
public class VacationAdminUpdateController {

	@Autowired
	private VacationInfoService service;


	@GetMapping("categoryUpdate.do")
	public String categoryFormUI( @ModelAttribute("vacationList") VacationInfoVO vacationInfo, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();
		vacationInfo.setComNo(comNo);

		List<VacationInfoVO> vacationList = service.comVacationList(comNo);
		model.addAttribute("vacationList", vacationList);

		return "tiles:groupware-admin/vacation/vacationcategoryUpdate";
	}

	@PostMapping("categoryUpdate.do")
	public String categoryFormData(@Validated(value = UpdateGroup.class)
	@ModelAttribute("vacationList") VacationListVO vacationListVO
	, Errors errors
	, RedirectAttributes redirectAttributes
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();

		 List<VacationInfoVO> vacationList = vacationListVO.getVacationList(); // Assuming a getter for the list
		    service.updateComVacation(vacationList);
		redirectAttributes.addFlashAttribute("vacationList", vacationListVO);
		if (errors.hasErrors()) {

			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "todoList", errors);
			System.out.println("업데이트실패!!");
			return "redirect:/gw/vacation/categoryUpdate.do";
		} else {
			service.updateComVacation(vacationList);
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			System.out.println("업데이트 성공!");
			return "redirect:/gw/vacation/vacationList.do";
		}
	}

}
