package kr.or.ddit.groupware.employee.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
/**
 * 내정보 - 개인정보, 비밀번호 수정기능
 * @author 이희진
 *
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("/gw/employee")
public class EmployeeInfoUpdateController {
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private final EmployeeService service;

	
	
	@PostMapping("/changePassword.do")
    @ResponseBody
    public Map<String, Object> changePassword(@RequestParam int empNo,
                                              @RequestParam String currentPassword,
                                              @RequestParam String newPassword) {
        Map<String, Object> response = new HashMap<>();
        try {
            service.changePassword(empNo, currentPassword, newPassword);
            response.put("success", true);
        } catch (PkNotFoundException e) {
            response.put("success", false);
            response.put("message", "현재 비밀번호가 올바르지 않습니다.");
        }
        return response;
    }
	
	
	@GetMapping("employeeInfoUpdate.do")
	public String FormUI(@RequestParam(value = "what", required = false) Integer what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		if(what == null) {
			what = emp.getEmpNo();
		}
		
		int empNo = emp.getEmpNo();
		if(!model.containsAttribute("employee")) {
			EmployeeVO employee = service.retrieveEmployeeInfo(empNo);
			model.addAttribute("employee", employee);
		}
		return "tiles:groupware-member/myInfo/myInfo-modify";
		
	}
	@PostMapping("employeeInfoUpdate.do")
	public String FormDataProcess(
			@Validated(UpdateGroup.class) EmployeeVO employee
			, Errors errors
			,  HttpSession session
			, RedirectAttributes redirectAttributes
		) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
			if(errors.hasErrors()) {
				session.setAttribute("employee", employee); 
				redirectAttributes.addFlashAttribute("employee", employee);
				redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
				return "redirect:/gw/employee/employeeInfoUpdate.do?what="+ empNo;
			}else {
				service.modifyEmployeeInfo(employee);
				return "redirect:/gw/employee/employeeInfoUpdate.do?what="+ empNo+ "&success=true";
			}
	}

	

}
