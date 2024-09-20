package kr.or.ddit.groupware.grboard.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.groupware.grboard.service.GrbGubunService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/gw/board")
public class GrbGubunInsertController {
	@Autowired
	private GrbGubunService service;
	
	@PostMapping("insertGubunmark.do")
	public String insertGubunmark(@RequestParam Map<String, Object> requestData, Model model) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();

	    requestData.put("comNo",comNo);
	    try {
	        service.insertGrbGubun(requestData);
	        return "redirect:/gw/board/gubun.do"; // 성공 시 리디렉션할 페이지
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "게시판 추가에 실패했습니다.");
	        return "redirect:/gw/board/errorPage"; // 실패 시 리디렉션할 페이지
	    }	
}
}
