package kr.or.ddit.web.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.web.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/w/membership")
public class MembershipRetrieveController {
	@Autowired
	private MemberService memService;
	@Autowired
	private CompanyService comService;
	
	@GetMapping("membershipListPage.do")
	public String listPage(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
		PaginationInfo paging = new PaginationInfo(10, 5);
		paging.setSimpleCondition(simpleCondition); 
		paging.setPage(page); 
		List<MemberVO> memberList = memService.selectMemberListByProviderPage(paging);
		
		model.addAttribute("memberList", memberList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		
		String pagingHTML = renderer.renderPagination(paging); // 스크립트 파일에서 만들었던 paging 문자열로
		model.addAttribute("pagingHTML", pagingHTML);
		
		
		return "tiles:web-provider/membership/membershipList";
	}
	
	@GetMapping("membershipDetail.do")
	public String membershipDetail(@RequestParam int what, Model model) {
		try {
			CompanyVO company = comService.retrieveCompany(what);
			
			model.addAttribute("company", company);
		} catch (PkNotFoundException e) {
			model.addAttribute("company", null);
		}
		return "web-provider/membership/membershipDetail";
	}
	
}
