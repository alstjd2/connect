package kr.or.ddit.web.board.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.web.board.service.BoardService;

@Controller
@RequestMapping("/w/support")
public class BoardRetrieveController {

	@Autowired
	private BoardService service;


	@GetMapping("guide-admin.do")
	public String guideAdminConnect(Model model) {
		
		List<BoardVO> guideList = 
				service.retrieveBoardListByType("DA01130");
		System.out.println(guideList);
		model.addAttribute("guideList", guideList);
		return "tiles:web-user/guide/guide-admin";
	}
	
	@GetMapping("guide-start.do")
	public String StartGuide(Model model) {
		
		return "tiles:web-user/guide/guide-start";
	}
	
	@GetMapping("guide-service.do")
	public String AdminGuideService(Model model) {
		
		List<BoardVO> guideList = 
				service.retrieveBoardList();
		System.out.println(guideList);
		model.addAttribute("guideList", guideList);
		return "tiles:web-user/guide/guide-service";
	}



}
