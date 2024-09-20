package kr.or.ddit.web.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.web.board.dao.BoardMapper;
import kr.or.ddit.web.board.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/w/notice")
public class NoticeModifyController {

	@Autowired
	BoardService boardService;

	@Autowired
	BoardMapper boardMapper;

	@GetMapping("/board/modify.do")
	public String BoardModify(@RequestParam("board") String boardNo) {
		//boardNo 눌러서 원래 내용 가져와 폼으로 이동

		return "tiles:web-provider/reference/news-write";
	}

	@GetMapping("/delyn/modify.do")
	public String DelYNModify(@RequestParam("board") String boardNo)  {

		//서비스로 감....
		//게시글 번호 받아서 del 조회 select(단일)
		//Y인지 N인지 확인 후 반대로 set해서
		//update

		return "tiles:web-provider/reference/news-write";
	}



}
