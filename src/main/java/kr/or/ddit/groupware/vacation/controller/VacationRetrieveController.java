package kr.or.ddit.groupware.vacation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

@Controller
@RequestMapping("/gw/myInfo")
public class VacationRetrieveController {
// 직원의 휴가현황
	@Autowired
	public VacationInfoService service;

	@Autowired
	public ApplicationService appService;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private CompanyService comService;

	@GetMapping("vacation.do")
	public String vacation(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();

	    EmployeeVO vacCnt = service.empAllVacCnt(empNo);
	    EmployeeVO vacUseCnt = service.empUseVacCnt(empNo);



	    // 특별휴가, 경조 카운트
	    ApplicationVO speAllCnt = appService.empAllSpeCnt(empNo);
	    ApplicationVO speUseCnt = appService.empUseSpeCnt(empNo);

	    List<EmployeeVO> applicationList = appService.empApplicationList(empNo);
	    List<ApplicationVO> empSpeList = appService.empSpeList(empNo);
	    List<ApplicationVO> empSpeUseList = appService.empSpeUseList(empNo);




	    model.addAttribute("vacCnt", vacCnt);
	    model.addAttribute("vacUseCnt", vacUseCnt);
	    model.addAttribute("applicationList" ,applicationList);

	    model.addAttribute("speAllCnt", speAllCnt);
	    model.addAttribute("speUseCnt", speUseCnt);
	    model.addAttribute("empSpeList", empSpeList);
	    model.addAttribute("empSpeUseList", empSpeUseList);




		return "tiles:groupware-member/myInfo/myInfo-vacation";
	}

	@GetMapping("applicationList")
	public @ResponseBody List<EmployeeVO> empAppList(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int empNo = emp.getEmpNo();
		List<EmployeeVO> applicationList = appService.empApplicationList(empNo);

		return applicationList;
	}




	@GetMapping("vacationDetail.do")
	public String vacationDetail(@RequestParam("what") int appNo
			, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    int comNo = emp.getComNo();

	    CompanyVO comDetail = comService.retrieveCompany(comNo);

	    EmployeeVO empVacDetail = appService.empAppDetail(appNo);
	    EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);

	    model.addAttribute("empVacDetail", empVacDetail);
	    model.addAttribute("comDetail", comDetail);
	    model.addAttribute("empDetail", empDetail);


		return "tiles:groupware-member/myInfo/myInfo-vacation-detail";
	}



	@PostMapping("applicationPrint.do")
	public String documentPrint( @RequestParam("data") String data,	Model model) {
		model.addAttribute("data", data);

		return "groupware-member/myInfo/application-print";
	}
	@GetMapping("attendance.do")
	public String attendance() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

	    int empNo = emp.getEmpNo();



		return "tiles:groupware-member/myInfo/myInfo-working-hours";
	}
}
