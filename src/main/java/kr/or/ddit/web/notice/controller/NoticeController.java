package kr.or.ddit.web.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.board.dao.BoardMapper;
import kr.or.ddit.web.notice.service.NoticeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/w/notice")
@Controller
public class NoticeController {

	@Autowired
	BoardMapper boardMapper;

	@Autowired
	NoticeService noticeService;

	@ModelAttribute("role")
	public String role() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String role="";
		try {
//			로그인 정보가 있을 경우 user role 등록
			MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
			role=memberAuth.getRealUser().getMemRole();
		} catch (Exception e) {
			//로그인 정보가 없을 경우 임시 role등록
			role="NOT";
		}
		return role;
	}

	/**
	 * 업데이트+공지사항 전체 조회
	 * @param model
	 * @return
	 */
	@GetMapping("/list.do")
	public String NoticeList(Model model, @ModelAttribute("role") String role)  throws Exception {
		List<BoardVO> boardList = boardMapper.selectNoticeAllList();
		model.addAttribute("noticeHeader",noticeService.headerInfo());

		if("ROLE_PROVIDER".equals(role.toUpperCase())) {
			ObjectMapper jsMapper = new ObjectMapper();
			jsMapper.registerModule(new JavaTimeModule());
			String pro = jsMapper.writeValueAsString(boardList);
			model.addAttribute("promotionJsonStr",pro);
			return "tiles:web-provider/reference/news";
		}else {
			model.addAttribute("boardList", boardMapper.selectNoticeAllList());
			return "tiles:web-user/board/board-notice";
		}

	}

	/**
	 * 프로모션 타입별 리스트 출력
	 * @param model
	 * @param role
	 * @param tabs
	 * @return
	 */
	@GetMapping("/detailList.do")
	public String PromotionTypeList(Model model
			, @ModelAttribute("role") String role,
			@RequestParam("notice") String tabs) {

		model.addAttribute("boardList", noticeService.NoticeTypeList(tabs));
		model.addAttribute("tabs", tabs);
		System.out.println(tabs);

		if("ROLE_PROVIDER".equals(role.toUpperCase())) {
			return "tiles:web-provider/reference/news-view";
		}
		else {
			return "tiles:web-user/board/board-notice";
		}

	}


	@GetMapping("/detailPage.do")
	public String NoticedetailPage(Model model
			, @RequestParam("board") String boardNo
			, @ModelAttribute("role") String role) {
		int board = Integer.parseInt(boardNo);
		BoardVO boardVo =  boardMapper.selectNoticeDetail(board);
		log.info("출력학==={}",boardVo);
		model.addAttribute("board",boardVo);

		if("ROLE_PROVIDER".equals(role.toUpperCase())) {
			return "tiles:web-provider/reference/news-view";
		}
		else {
			return "tiles:web-user/notice/notice-view";
		}
	}



}
