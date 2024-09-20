package kr.or.ddit.groupware.conference.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.conference.service.ConferenceService;
import kr.or.ddit.vo.ConferenceVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("gw/conference")
@RequiredArgsConstructor
public class ConferenceRetrieveController {
	@Autowired
	ConferenceService service;
	
	@GetMapping("conferenceList.do")
	public String conference() {
		return "tiles:groupware-member/webCam/webCam";
	}
	
	
	@PostMapping("conference.do")
	public String addressList(
			@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
	) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		
		PaginationInfo<ConferenceVO> paging = new PaginationInfo<ConferenceVO>();
		ConferenceVO conf = new ConferenceVO();
		conf.setEmpNo(emp.getComNo());
		paging.setSearchVO(conf);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<ConferenceVO> conferenceList = service.retrieveConferenceList(paging);

		model.addAttribute("conferenceList", conferenceList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:groupware-member/addressBook/addressBook-out";
		
	}

	@GetMapping("conferenceList")
	@ResponseBody
	public Map<String, Object> getConferenceList(
	        @RequestParam(required = false, defaultValue="1") int page) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

	    PaginationInfo<ConferenceVO> paging = new PaginationInfo<>();
	    paging.setRecordCount(5);
	    ConferenceVO conf = new ConferenceVO();
	    conf.setComNo(emp.getComNo());
	    paging.setSearchVO(conf);
	    paging.setPage(page);

	    List<ConferenceVO> conferenceList = service.retrieveConferenceList(paging);

	    Map<String, Object> response = new HashMap<>();
	    response.put("conferenceList", conferenceList);
	    response.put("totalPages", paging.getTotalPage());
	    response.put("totalCount", paging.getTotalRecord());

	    return response;
	}



}