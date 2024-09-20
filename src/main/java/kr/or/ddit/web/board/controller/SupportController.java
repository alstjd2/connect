package kr.or.ddit.web.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.web.board.service.BoardService;


@Controller
public class SupportController {
	@Autowired
	private BoardService service;
	
	@GetMapping("/w/support.do")
    public String support(Model model) {
		List<BoardVO> boardList = 
				service.retrieveBoardListByType("DA01140");
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
        return "tiles:web-user/inquiry/support";
    }
	
	@GetMapping("guide-service.do")
    public String guide() {
        return "tiles:web-user/guide/guide-service";
    }
	
}
