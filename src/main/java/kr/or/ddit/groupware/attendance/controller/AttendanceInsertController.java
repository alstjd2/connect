package kr.or.ddit.groupware.attendance.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.attendance.service.AttendanceService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("/gw/attendance")
public class AttendanceInsertController {

	@Autowired
	private AttendanceService service;



	@PostMapping("attendanceInsert.do")
	public String attendanceForm(@Validated(InsertGroup.class) @ModelAttribute("att") AttendanceVO att
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    att.setEmpNo(empNo);

	    String logicalViewName = null;
			service.attendanceCreate(att);
			logicalViewName = "tiles:groupware-member/index";

		redirectAttributes.addFlashAttribute("att", att);





	    return logicalViewName;
	}
}
