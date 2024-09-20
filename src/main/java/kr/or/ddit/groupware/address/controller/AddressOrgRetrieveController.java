package kr.or.ddit.groupware.address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 조직도 조회기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address")
@RequiredArgsConstructor
public class AddressOrgRetrieveController {
	
	@Autowired
	AddressService service;
	
	@Autowired
	EmployeeService empservice;
	
	
	@GetMapping("orgaddressList.do")
	public String addressList(
			@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
	) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		
		PaginationInfo<EmployeeVO> paging = new PaginationInfo<EmployeeVO>();
		EmployeeVO emps = new EmployeeVO();
		emps.setEmpNo(emp.getEmpNo());
		emps.setComNo(emp.getComNo());
		paging.setSearchVO(emps);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<EmployeeVO> employeeList = empservice.retrieveEmployeeComList(paging);

		model.addAttribute("employeeList", employeeList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:groupware-member/addressBook/addressBook";
		
	}
	
	@GetMapping("orgAddressListbu.do")
	public ResponseEntity<Map<String, Object>> addressorgList(
	        @RequestParam(required = false, defaultValue="1") int page,
	        @RequestParam(required = false) String orgDep,
	        @ModelAttribute("condition") SimpleCondition simpleCondition,
	        @RequestParam(required = false, defaultValue="false") boolean ajax
	) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
	    PaginationInfo<EmployeeVO> paging = new PaginationInfo<EmployeeVO>();
	    EmployeeVO emps = new EmployeeVO();
	    emps.setEmpNo(emp.getEmpNo());
	    emps.setComNo(emp.getComNo());
	    emps.setOrgDep(orgDep);
	    
	    paging.setSearchVO(emps);
	    paging.setPage(page);
	    paging.setSimpleCondition(simpleCondition);
	    
	    List<EmployeeVO> employeeList = empservice.retrieveEmployeeComListByDept(paging, orgDep);
	    
	    PaginationRenderer renderer = new DefaultPaginationRenderer();
	    String pagingHTML = renderer.renderPagination(paging);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("employeeList", employeeList);
	    response.put("pagingHTML", pagingHTML);
	    
	    return ResponseEntity.ok(response);
	}

	
	@GetMapping("orgaddressDetail.do")
	public String addressDetail(
			@RequestParam("what") Integer empNo, Model model
	) {
		model.addAttribute("employee",empservice.retrieveEmployeeInfo(empNo));
		return "groupware-member/addressBook/bookmarkDetail";
	}
	
	

}
