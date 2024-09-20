package kr.or.ddit.groupware.company.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;

/**
 * 회사브랜드수정 - 색상 추가기능 기능
 * @author 이희진
 *
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("/gw/company")
public class CompanyColorController {
	
	@Autowired
	CompanyService comservice;
	
	 	@GetMapping("/color.do")
	    @ResponseBody
	    public Map<String, Object> getColor() {
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	        EmployeeVO emp = empAuth.getRealUser();

	        int comNo = emp.getComNo();
	        CompanyVO companyInfo = comservice.retrieveCompany(comNo);

	        int colorValue = companyInfo.getComCorno();

	        // JSON으로 반환할 데이터 구성
	        Map<String, Object> response = new HashMap<>();
	        response.put("colorValue", colorValue);

	        return response;
	    }
	
	

}
