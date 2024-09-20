package kr.or.ddit.web;

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
import kr.or.ddit.groupware.employee.dao.EmployeeMapper;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.web.board.dao.BoardMapper;
import kr.or.ddit.web.board.service.BoardService;

@Controller
public class WebIndexController {
	@Autowired
	private BoardService service;
	@Autowired
	private BoardMapper mapper;


	  @RequestMapping("/w/index.do")
	    public String index(
	            @RequestParam(required = false, defaultValue="1") int page,
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
	        System.out.println(boardList);
	        model.addAttribute("boardList", boardList);

	        PaginationRenderer renderer = new DefaultPaginationRenderer();
	        String pagingHTML = renderer.renderPagination(paging);

	        model.addAttribute("pagingHTML", pagingHTML);
	        model.addAttribute("offEdu", mapper.selectIndexOff());
	        model.addAttribute("sale", mapper.selectIndexSale());
	        model.addAttribute("update", mapper.selectIndexUpdate());

	        // JSP 파일 경로 반환 (뷰 리졸버에 의해 처리됨)
	        return "web-user/index";
	    }
	@GetMapping
	public String index() {
		  return "web-user/index";
	  }
	}

