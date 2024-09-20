package kr.or.ddit.groupware.survey.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.survey.service.SurveyService;
import kr.or.ddit.vo.ChiVO;
import kr.or.ddit.vo.ClsVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.SvyAnsListVO;
import kr.or.ddit.vo.SvyAnsVO;
import kr.or.ddit.vo.SvyAskVO;
import kr.or.ddit.vo.SvyVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gw/survey")
@RequiredArgsConstructor
public class SurveyController {
	private final SurveyService service;
	private final NewAlarmController alarmController;
	
	@GetMapping("list.do")
	public String surveylist(Model model) {
		return "tiles:groupware-admin/surver/survey-list";	
	}
	
	@GetMapping("myList")
	public @ResponseBody List<SvyVO> listJsonData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
		List<SvyVO> svyList = service.retrieveComSvyList(emp.getComNo());
		return svyList;
	}
	
	@GetMapping({"create/myList.do","answer/myList.do"})
	public String surveyMyList(Model model) {
		return "tiles:groupware-member/surver/surver-list";	
	}
	
	@GetMapping("create/myList")
	public @ResponseBody List<SvyVO> createMyListJsonData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		return service.retrieveMySvyList(emp.getEmpNo());
	}
	
	@GetMapping("answer/myList")
	public @ResponseBody List<SvyVO> answerMyListJsonData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		return service.retrieveMyAnsSvyList(emp.getEmpNo());
	}
	
	@GetMapping("detail.do")
	public String surveyDetail(
		@RequestParam("what") int svyNo,
		Model model
	) {		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		//직원정보에 값이 없다면 로그아웃
		String viewString = "redirect:/gw/login/logout.do";
		
		// 기본 설문 상세 정보 조회
	    SvyVO svyDetail = service.retrieveSvyDetail(svyNo);
	    
	    // 설문 결과 내용
	    List<SvyVO> svyResult  = service.retrieveSvyList(svyNo);
	    
	    // 설문 답변자 리스트 조회
	    List<SvyAnsVO> ansList = service.retrieveSvyAnsList(svyNo);

	    model.addAttribute("svyDetail", svyDetail);
	    model.addAttribute("svyResult", svyResult);
	    model.addAttribute("ansList", ansList);
	    
	    if(emp.getEmpRole().equals("ROLE_ADMIN")) {
			viewString = "tiles:groupware-admin/surver/survey-detail";
		}else if(emp.getEmpRole().equals("ROLE_EMPLOYEE")) {
			boolean exists = ansList.stream()
				    .anyMatch(svyAns -> emp.getEmpNo() == svyAns.getEmpNo());
			
			viewString = exists 
						? "tiles:groupware-member/surver/surver-detail" 
						: "tiles:groupware-member/surver/surver-list";
			
			boolean answer = ansList.stream().anyMatch(svyAns -> emp.getEmpNo() == svyAns.getEmpNo() && svyAns.getSvyAnsDate() != null);
			
			
			if(!answer) {
				List<SvyVO> svyInsertCont = service.retrieveSvyInsertContent(svyNo);
				model.addAttribute("svyInsertCont",svyInsertCont);
			}
			
			viewString = answer 
					? "tiles:groupware-member/surver/surver-detail" 
					: "tiles:groupware-member/surver/survey-insert";
			
		}
	    return viewString;
	}
	
	@PostMapping("detail.do")
	@Transactional
	public String formDataProcesss(
	    @ModelAttribute("svy") SvyVO svy,
	    RedirectAttributes redirectAttributes
	) {
		SvyAnsVO svyAns = new SvyAnsVO();
		svyAns.setSvyNo(svy.getSvyNo());
		svyAns.setEmpNo(svy.getSvyAsk().getEmpNo());
		int svyAnsNo = (int) service.retrieveSvyAnsNo(svyAns);
		
		for (ChiVO chi : svy.getChiList()) {
			log.info("{}",svy.getChiList());
			for (ClsVO cls : chi.getClsList()) {
				if (cls != null && cls.getClsNo() != null) {
			        SvyAnsListVO svyAnsList = new SvyAnsListVO();
			        svyAnsList.setSvyAnsNo(svyAnsNo);
			        svyAnsList.setClsNo(cls.getClsNo());
			        service.createSvyAnsList(svyAnsList);
				}
			}
		}
		service.modifySvyAns(svyAnsNo);
		SvyVO svyDetail = service.retrieveSvyDetail(svy.getSvyNo());
		SvyAskVO svyAsk = service.retrieveSvyAsk(svy.getSvyNo());
		
		log.info("ask--{}",svyAsk.getEmpNo());
		
		alarmController.handleNewMessage("작성한 [설문]에 [답변]이 달렸습니다.", svyAsk.getEmpNo(), "설문 - 만든 설문", 5, "gw/survey/detail.do?what="+svyAns.getSvyNo());
		
		if(svyDetail.getActualRespondents()==svyDetail.getTotalAnswerees()) {
			service.modifySvy(svy.getSvyNo());
			alarmController.handleNewMessage("작성한 [설문]이 [완료] 되었습니다.", svyAsk.getEmpNo(), "설문 - 만든 설문", 5, "gw/survey/detail.do?what="+svyAns.getSvyNo());
			
		}
		
		
		return "redirect:/gw/survey/detail.do?what="+svy.getSvyNo();
	}
	
	@GetMapping("create.do")
	public String surveyCreate(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		//직원정보에 값이 없다면 로그아웃
		String viewString = "redirect:/gw/login/logout.do";
	    
	    if(emp.getEmpRole().equals("ROLE_ADMIN")) {
			viewString = "tiles:groupware-admin/surver/survey-create";
		}else if(emp.getEmpRole().equals("ROLE_EMPLOYEE")) {
			viewString ="tiles:groupware-member/surver/surver-create";
		}
		
		
		return viewString;	
	}
	
	@PostMapping("create.do")
	public String surveyCreate(
		@ModelAttribute("svy") SvyVO svy		
	) {
		//log.info("{}",svy.toString());
		int svyNo = service.createSvy(svy);
		return "redirect:/gw/survey/detail.do?what="+svyNo;	
	}
	
	@GetMapping("ansList")
	public @ResponseBody List<SvyAnsVO> ansList(
		@RequestParam("what") int svyNo,
		@RequestParam("what2") int empNo
	){
		SvyAnsVO svyAns = new SvyAnsVO();
		svyAns.setSvyNo(svyNo);
		svyAns.setEmpNo(empNo);
		
		return service.retrieveSvyAnsDetailList(svyAns);
	}
	
	@GetMapping("templateCreate.do")
	public String surveyTemplateCreate(Model model) {
		return "tiles:groupware-admin/surver/survey-template-create";	
	}
}
