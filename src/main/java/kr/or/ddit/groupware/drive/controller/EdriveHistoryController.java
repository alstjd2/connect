package kr.or.ddit.groupware.drive.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.groupware.drive.service.EdriveService;
import kr.or.ddit.vo.EdrivelogVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gw/edrive")
public class EdriveHistoryController {

	@Autowired
	private EdriveService edriveService;
	
	@GetMapping("historyPage.do")
	public String edriveHistoryPage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO employee = empAuth.getRealUser();
		
		List<EdrivelogVO> edrivelogList = edriveService.retrieveEdrivelogListByEmpNo(employee.getEmpNo());
		model.addAttribute("edrivelogList", edrivelogList);
		
		edrivelogList.forEach(e->{
			log.info("historyList 내용 => {}", e);
		});
		
		return "tiles:groupware-member/drive/edriveHistory";
	}
	
	
	
	
	
	
}
