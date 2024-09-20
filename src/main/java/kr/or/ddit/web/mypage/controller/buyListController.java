package kr.or.ddit.web.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.BuyListVO;
import kr.or.ddit.web.buyList.dao.BuyListMapper;

@Controller
@RequestMapping("/rest/mypage/buyList.do")
public class buyListController {

	@Autowired
	BuyListMapper mapper;
	
//	@GetMapping("{boNo}")
	@GetMapping
	public List<BuyListVO> buyList() {
		return mapper.selectBuyListAll();
	}
}
