package kr.or.ddit.groupware.vacation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.vacation.service.ApplicationService;
import kr.or.ddit.groupware.vacation.service.VacationInfoService;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.VacationInfoVO;

@Controller
@RequestMapping("/gw/application")
public class ApplicationAdminRetrieveController {
// 관리자 부재일정 조회
	@Autowired
	public ApplicationService service;

	@Autowired
	public VacationInfoService vacService;

	@Autowired
	public EmployeeService empService;

	@Autowired
	private CompanyService comService;

	@GetMapping("vacation.do")
	public String adminApplicationList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();
		List<VacationInfoVO> speList = vacService.comSpeList(comNo);
		List<EmployeeVO> empList = empService.retrieveAllEmployees(comNo);
		List<EmployeeVO> applicationList = service.comApplicationList(comNo);
		ApplicationVO comVacIngCnt = service.comVacIngCnt(comNo);
		ApplicationVO comApproveCnt = service.comVacApproveCnt(comNo);
		ApplicationVO comCnt = service.comVacCnt(comNo);
		List<ApplicationVO> comSpeList = service.comSpeList(comNo);

		model.addAttribute("speList", speList);
		model.addAttribute("empList", empList);
		model.addAttribute("applicationList", applicationList);
		model.addAttribute("comVacIngCnt", comVacIngCnt);
		model.addAttribute("comApproveCnt", comApproveCnt);
		model.addAttribute("comCnt", comCnt);
		model.addAttribute("comSpeList", comSpeList);


		return "tiles:groupware-admin/vacation/vacationList";
	}
	@GetMapping("applicationList")
	public @ResponseBody List<EmployeeVO> appComList() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();
		List<EmployeeVO> applicationList = service.comApplicationList(comNo);

		return applicationList;
	}

	@GetMapping("comVacationDetail.do")
	public String depvacationDetail(@RequestParam("what") int appNo
			, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();

		CompanyVO comDetail = comService.retrieveCompany(comNo);

		EmployeeVO empVacDetail = service.empAppDetail(appNo);
		EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);
		List<EmployeeVO> empList = empService.retrieveAllEmployees(comNo);


		model.addAttribute("empVacDetail", empVacDetail);
		model.addAttribute("comDetail", comDetail);
		model.addAttribute("empDetail", empDetail);
		model.addAttribute("empList", empList);

		return "tiles:groupware-admin/vacation/vacation-detail";
	}


}
