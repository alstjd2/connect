package kr.or.ddit.groupware.cerificate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.cerificate.service.CerificateService;
import kr.or.ddit.vo.CerificateVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("/gw")
public class CerificateController {

	@Autowired
	private CerificateService service;

	@GetMapping("cerificate.do")
	public String listCerificate(Model model) {
		 // 현재 인증된 사용자의 정보를 가져옴
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        int comNo = emp.getComNo();


     // 서비스에서 증명서 목록을 가져옴
        List<CerificateVO> certificateList = service.retrieveCerificateList(comNo);
        // 모델에 데이터 추가
        model.addAttribute("certificateList", certificateList);
		return "tiles:groupware-admin/personnel/personnel-certificate";
	}


	@GetMapping("cerificateList")
	@ResponseBody
	public Map<String, Object> getCerificateList(){
		 // 현재 인증된 사용자의 정보를 가져옴
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        int comNo = emp.getComNo();

     // 서비스에서 증명서 목록을 가져옴
        List<CerificateVO> certificateList = service.retrieveCerificateList(comNo);

        // DataTables에 맞는 형태로 반환
        Map<String, Object> result = new HashMap<>();
        result.put("data", certificateList);

        return result;


		}


	}

