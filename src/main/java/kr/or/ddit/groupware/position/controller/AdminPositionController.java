package kr.or.ddit.groupware.position.controller;

import java.util.List;

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

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.PositionVO;

@Controller
@RequestMapping("/gw/adminPosition")
public class AdminPositionController {


		// 직급 및 직책 목록 조회
	    @GetMapping("list.do")
	    public String positionList(Model model) {
	        // 로그인한 직원의 회사 정보 가져오기
//	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//	        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
//	        EmployeeVO emp = empAuth.getRealUser();
//	        int comNo = emp.getComNo();
//
//	        // 직급 및 직책 목록 가져오기
//	        List<PositionVO> posList = positionService.getPositionListByComNo(comNo, "EB04110"); // 직급
//	        List<PositionVO> onePosList = positionService.getPositionListByComNo(comNo, "EB04120"); // 직책
//
//	        model.addAttribute("posList", posList);
//	        model.addAttribute("onePosList", onePosList);
	        return "tiles:groupware-admin/personnel/personnel-position";
	    }



}
