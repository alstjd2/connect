package kr.or.ddit.web.early.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EarlyVO;
import kr.or.ddit.vo.NonVO;
import kr.or.ddit.web.early.service.WebEarlyService;

@Controller
@RequestMapping("/w/early")
public class ProvideSupportRetriveController {
	@Autowired
	private WebEarlyService service;

//	@GetMapping("/inquiry-support")
//	public String nonProInquiryForm(Model model) {
//		List<EarlyVO> earlyList = service.retrieveWebEarlyList(); // 서비스에서 리스트를 가져옵니다.
//		model.addAttribute("earlyList", earlyList);
//		if (earlyList == null) {
//			System.out.println("earlyList가 null입니다."); // 디버깅 로그 추가
//		}
//		return "tiles:web-provider/inquiry/inquiry-support";
//	}
	
	@GetMapping("inquiryEarlyDetail.do")
	public String errDetail(
			@RequestParam("what") Integer earlyNo, Model model
	) {
		
		model.addAttribute("early",service.retrieveWebEarly(earlyNo));
		System.out.println(earlyNo);
		return "tiles:web-provider/inquiry/inquiry-support-view";
	}
	
	@PostMapping("updateEarlyStatus.do")
	public String updateNonStatus(
	        @RequestParam("what") Integer earlyNo,
	        @RequestParam("earlyStatus") String earlyStatus,
	        Model model) {
	    
	    // Map을 생성하여 파라미터를 담습니다.
	    Map<String, Object> params = new HashMap<>();
	    params.put("earlyNo", earlyNo);
	    params.put("earlyStatus", earlyStatus);
	    
	    // 서비스 계층으로 Map을 전달하여 nonStatus 업데이트
	    service.updateEarlyStatus(params);
	    
	    // 업데이트 후 다시 해당 문의의 상세 정보 페이지로 리다이렉트
	    return "redirect:/w/early/inquiryEarlyDetail.do/?what=" + earlyNo;
	}
	
	@GetMapping("/earlyList.do")
	public String Boardlist(@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
			) {
		PaginationInfo<BoardVO> paging = new PaginationInfo<BoardVO>();
		NonVO nonBoard = new NonVO();
		nonBoard.setNonNo(2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<EarlyVO> earlyList = service.retrieveEarlyPagingList(paging);
		
		model.addAttribute("earlyList", earlyList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		return "tiles:web-provider/inquiry/inquiry-support";
}
	

}
