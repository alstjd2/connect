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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.vacation.service.ApplicationService;
import kr.or.ddit.groupware.vacation.service.VacationInfoService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListVO;
import kr.or.ddit.vo.VacationInfoVO;
import kr.or.ddit.vo.VacationListVO;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/gw/vacation")
@Log4j2
public class VacationInsertController {

	@Autowired
	private VacationInfoService service;

	@Autowired
	private ApplicationService appService;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private CompanyService comService;

	@Autowired
	private NewAlarmController alarmController;

	/**
	 * 관리자 특별휴가 부여
	 * @param application
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("spcAppInsert.do")
	public String speAppInsert(
			@Validated(InsertGroup.class) @ModelAttribute("application") ApplicationVO application
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();
		 String logicalViewName = null;
		 int empNo = application.getEmpNo();

			redirectAttributes.addFlashAttribute("application", application);
			if(!errors.hasErrors()) {
				// 에러 없으면

//				redirectAttributes.addFlashAttribute("redirect", "redirect");
				appService.createSpcApplication(application);
				alarmController.handleNewMessage("새로운 [특별휴가]를 부여받았습니다.", empNo, "개인정보 - 휴가관리", 8, "gw/myInfo/vacation.do");
				logicalViewName = "redirect:/gw/application/vacation.do";
			}else {
				// 에러 있으면
				redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"application", errors);

				logicalViewName = "redirect:/gw/vacation/spcAppInsert.do";
			}

			return logicalViewName;
	}


	/**
	 * 관리자 특별휴가 추가
	 * @param vacationList
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("specialInsert.do")
	public String specialInsert(@Validated(InsertGroup.class) @RequestBody List<VacationInfoVO> vacationList,
			BindingResult errors, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();

		vacationList.forEach(vacationInfo -> {
			vacationInfo.setComNo(comNo);
			service.createSpeVacation(vacationInfo);
		});

		if (!errors.hasErrors()) {
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			log.info("insert 됐는지 확인 -->", vacationList);
			return "redirect:/gw/vacation/vacationList.do";
		} else {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "vacationList", errors);
			return "redirect:/gw/vacation/specialInsert.do";
		}

	}

	/**
	 * 관리자 경조 리스트 추가
	 * @param vacationList
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("repInsert.do")
	public String repInsert(@Validated(InsertGroup.class) @RequestBody List<VacationInfoVO> vacationList,
			BindingResult errors, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();

		vacationList.forEach(vacationInfo -> {
			vacationInfo.setComNo(comNo);
			service.createRepVacation(vacationInfo);
		});

		if (!errors.hasErrors()) {
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			log.info("insert 됐는지 확인 -->", vacationList);
			return "redirect:/gw/vacation/vacationList.do";
		} else {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "vacationList", errors);
			return "redirect:/gw/vacation/specialInsert.do";
		}

	}

	@GetMapping("applicationInsert.do")
	public String appFormUI(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		EmployeeVO emps = new EmployeeVO();
		String empNm = emp.getEmpNm();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();
//		emps.setOrgDep(orgDep);
//		String empOrgDep = emp.getOrgDep();
//		String orgDeps = emps.setOrgDep(orgDep);
//		log.info("empOrgDep : ", empOrgDep,"empNo : " ,empNo , "empNm : ",empNm );


		EmployeeVO empVac = service.empAllVacCnt(empNo); // 연차
		List<ApplicationVO> empSpeList = appService.empSpeList(empNo);
		List<VacationInfoVO> empRepList = service.comRepList(comNo);
		EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);
		String orgDep = empDetail.getEmpDepName();
		CompanyVO comDetail = comService.retrieveCompany(comNo);
		List<EmployeeVO> empDepList = empService.selectEmpVacDepList(orgDep,comNo);
		List<EmployeeVO> dfVacList = empService.retrieveDfVacList(comNo);
		log.info("empDepList -->>", empDepList);

		model.addAttribute("empVac", empVac);
		model.addAttribute("empSpeList", empSpeList);
		model.addAttribute("empRepList", empRepList);
		model.addAttribute("empDetail", empDetail);
		model.addAttribute("comDetail", comDetail);
		model.addAttribute("empDepList", empDepList);
		model.addAttribute("dfVacList", dfVacList);
		return "tiles:groupware-member/myInfo/myInfo-insert";
	}

	 /**
	 * 직원 휴가 신청
	 * @return
	 */
	@PostMapping("applicationInsert.do")
	   public String vacationInsert(
			   @Validated(InsertGroup.class) @ModelAttribute("app") ApplicationVO app
				, BindingResult errors
				, RedirectAttributes redirectAttributes
			   ) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    app.setEmpNo(empNo);
	    List<ApplicationVO> empSpeList = appService.empSpeList(empNo);
	    int empRov = app.getAppRovemp();
	    alarmController.handleNewMessage("새로운 [휴가신청]이 도착하였습니다.", empRov, "부서 근태 - 휴가관리", 7, "gw/department/vacation.do");
	    String logicalViewName = null;
	    appService.empVacApplicationMer(app);

//	    redirectAttributes.addFlashAttribute("app", app);
//		if(!errors.hasErrors()) {
//			// 에러 없으면
//
//			redirectAttributes.addFlashAttribute("redirect", "redirect");
			logicalViewName = "redirect:/gw/myInfo/vacation.do";
//
//		}else {
//			// 에러 있으면
//			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"app", errors);
//			logicalViewName = "redirect:/gw/vacation/applicationInsert.do";
//		}
		   return logicalViewName;
	   }


}
