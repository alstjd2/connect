package kr.or.ddit.groupware.vacation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.vacation.service.ApplicationService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListVO;

@Controller
@RequestMapping("/gw/department")
public class DepartmentRetrieveController {

	@Autowired
	public ApplicationService appService;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private CompanyService comService;

	@Autowired
	private NewAlarmController alarmController;

	@GetMapping("vacation.do")
	public String VacationList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    int empDep = emp.getEmpDep();
	    int comNo = emp.getComNo();

	    EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);
	    String orgDep = empDetail.getEmpDepName();
	    List<EmployeeVO> empDepList = empService.selectEmpVacDepList(orgDep,comNo);
	    List<EmployeeVO> dfVacList = empService.retrieveDfVacList(comNo);
	    model.addAttribute("dfVacList", dfVacList); // 부서장 리스트
	    model.addAttribute("empDepList", empDepList); // 부서에 해당하는 직원 리스트
	    model.addAttribute("empDetail", empDetail); // 한 직원의 상세내용

	    ApplicationVO appDepIngCnt = appService.appDepIngCnt(empNo);
	    ApplicationVO appDepAproveCnt = appService.appDepAroveCnt(empNo);
	    ApplicationVO appDepCnt = appService.appDepCnt(empNo);


	    List<EmployeeVO> applicationList = appService.depApplicationList(empNo);
	    model.addAttribute("applicationList", applicationList);
	    model.addAttribute("appDepIngCnt", appDepIngCnt);
	    model.addAttribute("appDepAproveCnt", appDepAproveCnt);
	    model.addAttribute("appDepCnt", appDepCnt);

		return "tiles:groupware-member/department/department-commute";
	}


	@GetMapping("applicationList")
	public @ResponseBody List<EmployeeVO> empAppList(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int empNo = emp.getEmpNo();
		List<EmployeeVO> applicationList = appService.depApplicationList(empNo);

		return applicationList;
	}


	@GetMapping("depVacationDetail.do")
	public String depvacationDetail(@RequestParam("what") int appNo
			, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();

		CompanyVO comDetail = comService.retrieveCompany(comNo);

		EmployeeVO empVacDetail = appService.empAppDetail(appNo);
		EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);
		List<EmployeeVO> empList = empService.retrieveAllEmployees(comNo);

		model.addAttribute("empVacDetail", empVacDetail);
		model.addAttribute("comDetail", comDetail);
		model.addAttribute("empDetail", empDetail);
		model.addAttribute("empList", empList);

		return "tiles:groupware-member/department/vacation-detail";
	}

	@PostMapping("approveApplication.do")
	public String updateApproveApplication(@Validated(value = UpdateGroup.class) @ModelAttribute("application") ApplicationVO application
			, Errors errors
			, RedirectAttributes redirectAttributes) {
		int appNo = application.getAppNo();
		redirectAttributes.addFlashAttribute("application", application);
		int empNo = application.getEmpNo();
		int rovEmp = application.getAppRovemp();
		alarmController.handleNewMessage("휴가신청이 [승인완료]처리 되었습니다.", empNo, "개인정보 - 휴가관리", 8, "gw/myInfo/vacationDetail.do?what="+appNo);
		alarmController.handleNewMessage("휴가신청을 [완료:승인완료]처리 하였습니다.", rovEmp, "부서(조직) 근태 - 부서(조직) 휴가관리", 8, "gw/department/depVacationDetail.do?what="+appNo);
		appService.empAppDetail(appNo);
		appService.empApproveApplication(application);

		return "redirect:/gw/department/depVacationDetail.do?what="+appNo;

	}


	@PostMapping("compaionApplication.do")
	public String updateCompaionApplication(@Validated(value = UpdateGroup.class) @ModelAttribute("application") ApplicationVO application
			, Errors errors
			, RedirectAttributes redirectAttributes) {
		int appNo = application.getAppNo();

		redirectAttributes.addFlashAttribute("application", application);
		int empNo = application.getEmpNo();
		int rovEmp = application.getAppRovemp();
		alarmController.handleNewMessage("휴가신청이 [반려]처리 되었습니다.", empNo, "개인정보 - 휴가관리", 8,  "gw/myInfo/vacationDetail.do?what="+appNo);
		alarmController.handleNewMessage("휴가신청을 [완료:승인완료]처리 하였습니다.", rovEmp, "부서(조직) 근태 - 부서(조직) 휴가관리", 8, "gw/department/depVacationDetail.do?what="+appNo);
		appService.empCompanionApplication(application);

		return "redirect:/gw/department/depVacationDetail.do?what="+appNo;
	}


}
