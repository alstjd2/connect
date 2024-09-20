package kr.or.ddit.groupware.attendance.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.groupware.attendance.service.AttendanceService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("/gw/department")
public class AttendanceDepRetrieveController {

	@Autowired
	public AttendanceService service;

	@Autowired
	public EmployeeService empService;

	@GetMapping("attendance.do")
	public String vacation(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    int empDep = emp.getEmpDep();
	    int comNo = emp.getComNo();
	    EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);
	    String orgDep = empDetail.getEmpDepName();
	    List<EmployeeVO> empDepList = empService.selectEmpVacDepList(orgDep,comNo);

	    List<AttendanceVO> attWorkStatus = service.depAttWorkStatusRetrive(empDep);
	    List<EmployeeVO> attDepWorkStatusList = service.depAttWorkStatusRetriveList(empDep);
	    List<EmployeeVO> dfVacList = empService.retrieveDfVacList(comNo);

	    model.addAttribute("attWorkStatus", attWorkStatus);
	    model.addAttribute("attDepWorkStatusList", attDepWorkStatusList);
	    model.addAttribute("dfVacList", dfVacList);
	    model.addAttribute("empDepList", empDepList);
	    model.addAttribute("empDetail", empDetail);
	    System.out.println(""+attWorkStatus);
		return "tiles:groupware-member/department/department-attendance";
	}

	@GetMapping("attendanceDetail.do")
	public String attendDetail(@RequestParam("what") int what ,
	@RequestParam(required = false) String searchDate, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();
		int empDep = emp.getEmpDep();
		EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);
		String orgDep = empDetail.getEmpDepName();
		List<EmployeeVO> empDepList = empService.selectEmpVacDepList(orgDep,comNo);

		EmployeeVO empList = empService.retrieveEmployee(what);
		List<AttendanceVO> attWorkStatus = service.selectEmpWorkList(what, searchDate);
		List<AttendanceVO> attList = service.empAttSerchList(what, searchDate);
		List<EmployeeVO> dfVacList = empService.retrieveDfVacList(comNo);

		model.addAttribute("empList", empList);
		model.addAttribute("attList", attList);
		model.addAttribute("attWorkStatus", attWorkStatus);
		model.addAttribute("dfVacList", dfVacList);
		return "tiles:groupware-member/department/working-hours-detail";
	}


}
