package kr.or.ddit.web.promotion.controller;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.BuyListVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.OffeduVO;
import kr.or.ddit.vo.ProdListVO;
import kr.or.ddit.vo.PromotionVO;
import kr.or.ddit.web.board.dao.BoardMapper;
import kr.or.ddit.web.buyList.dao.BuyListMapper;
import kr.or.ddit.web.offedu.dao.OffeduMapper;
import kr.or.ddit.web.offedu.service.OffEduService;
import kr.or.ddit.web.prodList.dao.ProdListMapper;
import kr.or.ddit.web.promotion.dao.PromotionMapper;
import kr.or.ddit.web.promotion.service.PromotionService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/w/promotion")
public class WebUserPromotionController {

	@Autowired
	PromotionMapper promotion;
	@Autowired
	OffeduMapper offedu;
	@Autowired
	OffEduService offeduservice;
	@Autowired
	PromotionService service;
	@Autowired
	BuyListMapper buyMapper;
	@Autowired
	ProdListMapper prodMapper;

	@ModelAttribute("role")
	public String role() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String role="";
		try {
			//로그인 정보가 있을 경우 user role 등록
			MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
			role=memberAuth.getRealUser().getMemRole();
		} catch (Exception e) {
			//로그인 정보가 없을 경우 임시 role등록
			role="NOT";
		}
		return role;
	}

	@ModelAttribute("offEduForm")
	public OffeduVO offBoard() {
		return new OffeduVO();
	}
	@ModelAttribute("massage")
	public String msg() {
		return "";
	}

	@GetMapping("/list.do")
	public String PromotionList(Model model,@ModelAttribute("role") String role) throws Exception {
		model.addAttribute("role",role);
		model.addAttribute("tabs","all");

		if("ROLE_PROVIDER".equals(role.toUpperCase())) {
			List<PromotionVO> promo = promotion.selectPromotionList();
			promo = promotion.selectPromotionList();
			//ag-grid 데이터
			ObjectMapper jsMapper = new ObjectMapper();
			jsMapper.registerModule(new JavaTimeModule());
			String pro = jsMapper.writeValueAsString(promo);
			model.addAttribute("promotionJsonStr",pro);
			//헤더에 추가할 통계 데이터
			model.addAttribute("cnt",promotion.selectPromotionCnt());
			model.addAttribute("cntA",promotion.selectPromotionCntAble());
			model.addAttribute("notInsertPromotion",promotion.selectNotInsertPromotion());
			return "tiles:web-provider/reference/event";
		}else {
			List<PromotionVO> promo = promotion.selectPromotionListEnable();
			model.addAttribute("promotion",promo);
			return "tiles:web-user/board/board-event";
		}
	}

	@GetMapping("/typeList.do")
	public String PromotionTypeList(
			Model model
			, @RequestParam("promotion") String tabs
			,@ModelAttribute("role") String role
			) {
		model.addAttribute("promotion",service.PromotionTypeList(tabs));
		model.addAttribute("tabs",tabs);
		return "tiles:web-user/board/board-event";
	}


	/**
	 * 이벤트 게시글 상세페이지 이동
	 * @param model
	 * @param no
	 * @return
	 * @throws JsonProcessingException
	 */
	@GetMapping("/detailPage.do")
	public String detail(
			Model model
			, @ModelAttribute("massage") String msg
			, @RequestParam("promotion") String no
			, @ModelAttribute("role") String role
			, @ModelAttribute OffeduVO offEduForm
			) throws JsonProcessingException {
		int cnt=0;
		int boNo = Integer.parseInt(no);

		try {
			cnt = offedu.selectOffeduNum(boNo);
		} catch (Exception e) {
		}

		model.addAttribute("peopleCnt",cnt);

		if("ROLE_PROVIDER".equals(role)) {
			PromotionVO promo = promotion.selectPromotionDetailPro(boNo);
			model.addAttribute("promotion",promo);
			ObjectMapper list = new ObjectMapper();
			String type =  promo.getBoard().getBoardType();

			if(type.equals("EB06120")) {
				//off일때 event-view-off
				List<OffeduVO> offEduList = offedu.selectOffeduListDetail(boNo);
				log.info("boNo : 게시판 번호 : {}", boNo);
				model.addAttribute("salePromoBuyList",list.writeValueAsString(offEduList)); // java객체 => json문자열
				return "tiles:web-provider/reference/event-view-off";

			}else if(type.equals("EB06110")) {
				//sale일때 event-view-sale
				//보드 넘버 = prodEventNm
				try {
					int prodNo = prodMapper.selectProdNo(no);
					//파라미터가 prod 상품번호
					List<BuyListVO> salePromoBuyList = buyMapper.selectBuyPromotionSaleDetail(prodNo);
					model.addAttribute("salePromoBuyList",list.writeValueAsString(salePromoBuyList)); // java객체 => json문자열
				}catch (Exception e) {
					//등록한 상품이 없을 경우
					model.addAttribute("salePromoBuyList",0);
				}
				return "tiles:web-provider/reference/event-view-sale";
			}else {
				//on일때 event-view-on
				return "tiles:web-provider/reference/event-view-on";
			}
		}else {
			//회원/비회원일 경우
			PromotionVO promo = promotion.selectPromotionDetailPro(boNo);
			model.addAttribute("promotion",promo);
			model.addAttribute("massage",msg);

			return "tiles:web-user/board/event-view";
		}
	}

	@PostMapping("/detailPage.do")
	public String offEduForm(@Validated @ModelAttribute("offEduForm") OffeduVO offEduForm
			,Model model
			) {
		PromotionVO promo = promotion.selectPromotionDetailPro(offEduForm.getPromoNo());
		offeduservice.insertOffEdu(offEduForm);
		model.addAttribute("massage","success");
		int boardNo = promotion.selectBoardNo(offEduForm.getPromoNo());

		return "redirect:/w/promotion/detailPage.do?promotion="+boardNo;
	}


}
