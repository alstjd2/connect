package kr.or.ddit.groupware.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
/**
 * 기업정보수정 - 기업정보수정, 브랜드 수정 기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/company")
@RequiredArgsConstructor
public class CompanyInfoUpdateController {
	private final CompanyService service;
	
	@GetMapping("/companyInfoUpdate.do")
	public String formUI(@RequestParam(value = "what", required = false) Integer what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    if(what == null) {
			what = emp.getComNo();
		}
	    int comNo = emp.getComNo();
		if(!model.containsAttribute("company")) {
			CompanyVO company = service.retrieveCompanyInfo(comNo);
			model.addAttribute("company", company);
		}
		return "tiles:groupware-admin/company/company";
	}
	
	@PostMapping("/companyInfoUpdate.do")
	public String formDataProcess(
			@Validated(UpdateGroup.class) CompanyVO company
			, Errors errors
			, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
		
		
			if(errors.hasErrors()) {
				redirectAttributes.addFlashAttribute("company", company);
				redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "company", errors);
				return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo;
			}else {
				service.modifyCompanyInfo(company);
				return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo+ "&success=true";
			} 
	}
	
	@PostMapping("/companybrandInfo.do")
	public String brandProcess(
			@Validated(UpdateGroup.class) CompanyVO company
			, Errors errors
			,  HttpSession session
			, RedirectAttributes redirectAttributes) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		
		int comNo = emp.getComNo();
		if (company.getComNo() == 0) {
			company.setComNo(comNo);
		}
		
		
		if(errors.hasErrors()) {
//			service.modifyCompanyBrand(company);
			session.setAttribute("company", company); 
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "company", errors);

			System.out.println(errors);
			return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo;
		}else {
			service.modifyCompanyBrand(company);
			
			return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo+ "&success=true";
		}
	}
	
	@PostMapping("/companyLayoutInfo.do")
	public String layoutProcess(
			@Validated(UpdateGroup.class) CompanyVO company
			, Errors errors
			,  HttpSession session
			, RedirectAttributes redirectAttributes) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		
		int comNo = emp.getComNo();
		if (company.getComNo() == 0) {
			company.setComNo(comNo);
		}
		
		if(errors.hasErrors()) {
			session.setAttribute("company", company); 
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "company", errors);
			
			System.out.println(errors);
			return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo;
		}else {
			service.modifyCompanyLayout(company);
			
			return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo+ "&success=true";
		}
	}
	@PostMapping("/companyThemeInfo.do")
	public String themeProcess(
			@Validated(UpdateGroup.class) CompanyVO company
			, Errors errors
			,  HttpSession session
			, RedirectAttributes redirectAttributes) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		
		int comNo = emp.getComNo();
		if (company.getComNo() == 0) {
			company.setComNo(comNo);
		}
		
		
		if(errors.hasErrors()) {
			session.setAttribute("company", company); 
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "company", errors);
			
			System.out.println(errors);
			return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo;
		}else {
			service.modifyCompanyTheme(company);
			
			return "redirect:/gw/company/companyInfoUpdate.do?what="+comNo+ "&success=true";
		}
	}

}
