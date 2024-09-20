package kr.or.ddit.web.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.web.board.service.BoardService;


@Controller
@RequestMapping("/w/faq.do")
public class FaqController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping
	public String Boardlist(@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
			) {
		PaginationInfo<BoardVO> paging = new PaginationInfo<BoardVO>();
		BoardVO board = new BoardVO();
		board.setBoardType("DA01140");
		paging.setSearchVO(board);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<BoardVO> boardList = service.retrieveBoardListPaging(paging);
		
		model.addAttribute("boardList", boardList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
	return "tiles:web-user/inquiry/faq";
	}
	
//	@GetMapping()
//    public String faq(Model model) {
//		List<BoardVO> boardList = 
//				service.retrieveBoardListByType("DA01140");
//		System.out.println(boardList);
//		model.addAttribute("boardList", boardList);
//        return "tiles:web-user/inquiry/faq";
//    }
}
