package kr.or.ddit.web.promotion.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.PromotionVO;
import kr.or.ddit.web.board.service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/w/modify/saleForm.do")
public class WebProviderSaleWriteController {

	@Autowired
	BoardService boardService;


	@PostMapping
	public void insert(BoardVO board) {
		String lvn = null;

		log.info("***dff* board 츨력{}",board);


	}

}
