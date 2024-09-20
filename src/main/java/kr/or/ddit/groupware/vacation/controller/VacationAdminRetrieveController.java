package kr.or.ddit.groupware.vacation.controller;

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
import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.VacationInfoVO;

@Controller
@RequestMapping("/gw/vacation")
public class VacationAdminRetrieveController {

	@Autowired
	public VacationInfoService service;



//	@GetMapping("vacationList.do")
//	public String adminVacationList() {
//		return "tiles:groupware-admin/vacation/vacationList";
//	}



	@GetMapping("vacationList.do")
	public String vacationCategoryList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

	    int comNo = emp.getComNo();


	    List<VacationInfoVO> comVacationList = service.comVacationList(comNo);
	    List<VacationInfoVO> comAllList = service.comAllVacationList(comNo);

	    model.addAttribute("vacationList", comVacationList);
	    model.addAttribute("vacationAllList", comAllList);
		return "tiles:groupware-admin/vacation/vacation-categoryList";
	}

	@PostMapping("vacationUpdate.do")
	public String vacationFormData(
			@Validated(value = UpdateGroup.class) @ModelAttribute("vacationInfo") VacationInfoVO vacationInfo
			, Errors errors
			, RedirectAttributes redirectAttributes
			) {
		redirectAttributes.addFlashAttribute("vacationInfo", vacationInfo);

		if (errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "todoCate", errors);
			System.out.println("업데이트실패!!");
			return "redirect:/gw/vacation/vacationDetail.do?what=" + vacationInfo.getVaciNo();
		} else {

			service.modifyVacation(vacationInfo);
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			System.out.println("업데이트 성공!");
			return "redirect:/gw/vacation/vacationList.do";

		}

	}

	@PostMapping("vacationDelete.do")
	public String cateDelete(@RequestParam("vaciNo") int what, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		service.removeVacation(what);
		return "redirect:/gw/vacation/vacationList.do";
	}

	@GetMapping("vacationDetail.do")
	public String vacationDetail(int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();

		VacationInfoVO vacationInfo = service.retrieveVacationInfo(what);
		List<VacationInfoVO> comVacationList = service.comVacationList(comNo);
		List<VacationInfoVO> comAllList = service.comAllVacationList(comNo);

		model.addAttribute("vacationList", comVacationList);
		model.addAttribute("vacationAllList", comAllList);
		model.addAttribute("vacationInfo", vacationInfo);

		return "tiles:groupware-admin/vacation/update-vacation";
	}



}
