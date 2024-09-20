package kr.or.ddit.web.RefnList.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.buyList.service.BuyListService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/w/refn")
public class RefnController {

	@Autowired
	private BuyListService buyService;

	/**
	 * 환불가능한 구매목록 조회
	 * @return
	 */
	@GetMapping("buyList")
	public List<Map<String, Object>> buyList() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
		int comNo = memberAuth.getRealUser().getCompany().getComNo();

		return buyService.selectAbleRefn(comNo);
	}

	/**
	 * 선택한 환불 리스트 requestBody로 들어옴
	 * @param buyNo
	 */
	@PostMapping("refnList")
	public void refnList(@RequestBody  String[] buyNo) {
		 for(String v : buyNo) {
			 log.info("buyNo : {}",v);
//			 if(v != null)
		 }
	}

	@GetMapping("")
	public void renfListInsert() {

	}

}
