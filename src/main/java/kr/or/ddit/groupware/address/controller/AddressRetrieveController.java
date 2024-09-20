package kr.or.ddit.groupware.address.controller;

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
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 외부주소록 조회기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address")
@RequiredArgsConstructor
public class AddressRetrieveController {
	
	@Autowired
	AddressService service;
	
	@GetMapping("addressList.do")
	public String addressList(
			@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
	) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		
		PaginationInfo<AddressVO> paging = new PaginationInfo<AddressVO>();
		AddressVO addr = new AddressVO();
		addr.setEmpNo(emp.getEmpNo());
		paging.setSearchVO(addr);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<AddressVO> addressList = service.retrieveAddressList(paging);

		model.addAttribute("addressList", addressList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:groupware-member/addressBook/addressBook-out";
		
	}
	
	@GetMapping("addressDetail.do")
	public String addressDetail(
			@RequestParam("what") Integer adrNo, Model model
	) {
		model.addAttribute("address",service.retrieveAddress(adrNo));
		return "groupware-member/addressBook/addressDetail";
	}
	
	

}
