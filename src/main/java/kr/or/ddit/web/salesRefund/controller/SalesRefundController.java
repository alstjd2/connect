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
import kr.or.ddit.web.RefnList.service.RefnListService;
import kr.or.ddit.web.buyList.dao.BuyListMapper;
import kr.or.ddit.web.buyList.service.BuyListService;
import kr.or.ddit.web.member.dao.MemberMapper;
import kr.or.ddit.web.prodList.dao.ProdListMapper;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/w/salesRefund")
public class SalesRefundController {

	@Autowired
	private BuyListMapper buyMapper;
	@Autowired
	private MemberMapper memMapper;
	@Autowired
	private CompanyMapper comMapper;
	@Autowired
	private BuyListService buyService;
	@Autowired
	private ProdListMapper prodMapper;
	@Autowired
	private RefnListService refnService;

	@GetMapping("sales.do")
	public String salesView(Model model) throws Exception {

		List<VRevenueVO> hwList = buyMapper.selectRevenue();
		ObjectMapper hwMapper = new ObjectMapper();

		model.addAttribute("monthBuyList", hwList);

		// 그래프 - 구매
		String hwStr =  hwMapper.writeValueAsString(hwList); // java객체 => json문자열
		model.addAttribute("hwStr", hwStr);

		// 그래프 - 환불
		List<VRevenueVO> refn = buyMapper.selectRefnCnt();
		String refnList =  hwMapper.writeValueAsString(refn); // java객체 => json문자열
		model.addAttribute("refnList", refnList);

		// ag-grid
		List<BuyListVO> buyList = buyMapper.selectBuyListAll();
		String buyJsonStr =  hwMapper.writeValueAsString(buyList); // java객체 => json문자열
		model.addAttribute("buyJsonStr", buyJsonStr);

		// 그래프 - 환불 이유 통계
		Map<String, Integer> refnTypeList = refnService.RefnListCnt();
		String refnTypeCnt =  hwMapper.writeValueAsString(refnTypeList); // java객체 => json문자열
		model.addAttribute("refnTypeCnt",refnTypeCnt);	//회원수

		model.addAttribute("memTotal",memMapper.selectTotalMember());	//회원수
		model.addAttribute("comTotal",comMapper.selectCntCom());	//기업수
		model.addAttribute("comUse",comMapper.selectCntUseCom());	//기업수 사용
		model.addAttribute("buyTotal",buyMapper.selectBuyTotal());
		model.addAttribute("buyUse",buyMapper.selectBuyCnt());
		model.addAttribute("refn",buyService.refnBuy());
		model.addAttribute("prodCnt",prodMapper.selectProdCnt());

		Map<String, Integer> prod = buyService.cal();
		model.addAttribute("prod",prod);

		return "tiles:web-provider/salesRefund/sales";
	}

	@GetMapping("refund.do")
	public String refundView() {

		return "tiles:web-provider/salesRefund/refund";
	}

}
