package kr.or.ddit.web.salesRefund.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.vo.BuyListVO;
import kr.or.ddit.vo.VRevenueVO;
import kr.or.ddit.web.buyList.dao.BuyListMapper;
import kr.or.ddit.web.buyList.service.BuyListService;
import kr.or.ddit.web.member.dao.MemberMapper;
import kr.or.ddit.web.prodList.dao.ProdListMapper;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/w/saleDetail.do")
public class SalesDetailController {

	@Autowired
	BuyListMapper buyMapper;
	@Autowired
	MemberMapper memMapper;
	@Autowired
	CompanyMapper comMapper;
	@Autowired
	BuyListService buyService;
	@Autowired
	ProdListMapper prodMapper;

	@GetMapping
	public String salesView(){


		return "tiles:web-provider/salesRefund/detailSales";
	}



}
