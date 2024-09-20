package kr.or.ddit.web.notice.controller;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.board.dao.BoardMapper;
import kr.or.ddit.web.board.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/w/notice")
@Controller
public class NoticeInsertController {

	@Autowired
	BoardService boardService;

	@ModelAttribute("newBoard")
	public BoardVO board() {
		return new BoardVO();
	}

	@GetMapping("/writeform.do")
	public String noticeForm() {
		return "tiles:web-provider/reference/news-write";
	}

	@PostMapping("/writeform.do")
	public String noticeFormWrite(
			@Validated
			@ModelAttribute("newBoard") BoardVO newBoard
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		String lvn = null;

		if(!errors.hasErrors()) {
			//제목,내용,게시글 타입 다 작성하였을 시
			//로그인 멤버 아이디 SET하기
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			//로그인한 memNo vo에 세팅
			MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
			int memNo = memberAuth.getRealUser().getMemNo();
			newBoard.setMemNo(memNo);
			//DB에 내용 작성
			boardService.createBoard(newBoard);

			lvn = "redirect:/w/notice/detailPage.do?board="+newBoard.getBoardNo();
		}else {
			redirectAttributes.addFlashAttribute("newBoard", newBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+newBoard, errors);

			log.info("에리 있얻 newBoard{}",newBoard.getBoardContent());
			lvn = "redirect:/w/notice/writeform.do";
		}
//		newBoard.setAtchFile(null);
		return lvn;
	}

}
