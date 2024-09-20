package kr.or.ddit.web.subscribe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.ProdListVO;
import kr.or.ddit.web.member.service.MemberService;
import kr.or.ddit.web.prodList.dao.ProdListMapper;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/w")
@Slf4j
public class SubscribeController {

	@Autowired
	ProdListMapper prodListMapper;
	@Autowired
	MemberService memService;

	@GetMapping("/subscribeView.do")
	public String SubscribeView(Model model,@RequestParam(required = false) String msg) {
		prodListMapper.selectProdListAllEnable();
		model.addAttribute("Basic", prodListMapper.selectBasicProdList());
		model.addAttribute("Event", prodListMapper.selectNotBasicProdList());
		if(msg != null) {
			model.addAttribute("msg", msg);
		}
		return "tiles:web-user/subscribe";

	}



}

