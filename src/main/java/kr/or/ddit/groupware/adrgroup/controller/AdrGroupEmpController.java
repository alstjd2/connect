package kr.or.ddit.groupware.adrgroup.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.groupemployee.service.GroupEmployeeService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GroupEmployeeVO;
/**
 * 주소록 - 회사조직원 가져오기 JSON
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address")
public class AdrGroupEmpController {
	
	@Autowired
	EmployeeService service;
	@Autowired
	GroupEmployeeService empservice;
	
	
	@GetMapping("jsongroupemployee.do")
	@ResponseBody
	public List<EmployeeVO> getEmp(){
		// 현재 로그인한 사용자 정보 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
	    int comNo = emp.getComNo();
	    List<EmployeeVO> allEmployees = service.retrieveEmployeeComEmpList(comNo);
	    
	    // 현재 사용자 정보를 제외한 직원 목록 필터링
	    List<EmployeeVO> filteredEmployees = allEmployees.stream()
	        .filter(employee -> !employee.getEmpNo().equals(emp.getEmpNo()))
	        .collect(Collectors.toList());
	    
	    return filteredEmployees;
	}
	
	@GetMapping("jsongroupemployeeUd.do")
	@ResponseBody
	public String getEmployeeList(@RequestParam("grpNo") int grpNo) throws JsonProcessingException {
	    // 그룹의 직원 목록 가져오기
	    List<GroupEmployeeVO> employees = empservice.retrieveGroupEmployeeList(grpNo);

	    // 직원 정보를 Map으로 변환
	    List<Map<String, String>> employeeTags = employees.stream()
	        .map(emp -> {
	            Map<String, String> map = new HashMap<>();
	            map.put("value", String.valueOf(emp.getEmpNo())); // 직원 번호
	            map.put("label", emp.getEmpNm()); // 직원 이름
	            return map;
	        })
	        .collect(Collectors.toList());

	    // 결과를 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    return objectMapper.writeValueAsString(employeeTags);
	}

}
