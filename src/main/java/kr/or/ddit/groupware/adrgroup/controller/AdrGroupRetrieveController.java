package kr.or.ddit.groupware.adrgroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.groupware.adrgroup.service.AdrGroupService;
import kr.or.ddit.groupware.bookmark.service.BookMarkService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.groupemployee.service.GroupEmployeeService;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.AdrGroupVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GroupEmployeeVO;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 그룹 조회 기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("gw/address")
@RequiredArgsConstructor
public class AdrGroupRetrieveController {
	@Autowired
	AdrGroupService service;
	@Autowired
	GroupEmployeeService empservice;
	
	@GetMapping("addressgroupList.do")
	public String groupList(
			@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
			) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
		PaginationInfo<AdrGroupVO> paging = new PaginationInfo<AdrGroupVO>();
		AdrGroupVO gr = new AdrGroupVO();
		gr.setEmpNo(emp.getEmpNo());
		paging.setSearchVO(gr);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<AdrGroupVO> groupList = service.retrieveGroupList(paging);

		model.addAttribute("groupList", groupList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:groupware-member/addressBook/addressBook-group";
		
		
	}
	
	@GetMapping("addressgroupDetail.do")
	public String groupDetail(
			@RequestParam("what") Integer grpNo, Model model
	) {
		model.addAttribute("groupempList",empservice.retrieveGroupEmployeeList(grpNo));
		model.addAttribute("group",service.retrieveGroup(grpNo));
		return "groupware-member/addressBook/groupDetail";
	}

}
