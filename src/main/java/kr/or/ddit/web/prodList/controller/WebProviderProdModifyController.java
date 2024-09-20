package kr.or.ddit.web.prodList.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ProdListVO;
import kr.or.ddit.web.prodList.service.ProdService;
import kr.or.ddit.web.prodList.service.ProdServiceImpl;
import kr.or.ddit.web.promotion.controller.WebProviderSaleWriteController;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/w/modify/prodForm.do")
public class WebProviderProdModifyController {

	@Autowired
	ProdService prodService;

	@PostMapping
	public void modifyProd(ProdListVO prod) {
		String lvn = null;

		log.info("***dff* prod 출력{}",prod);


	}
}
