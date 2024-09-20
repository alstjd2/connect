package kr.or.ddit.web.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.buyList.dao.BuyListMapper;
import kr.or.ddit.web.member.service.MemberService;
import kr.or.ddit.web.mypage.service.myPageService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/w/mypage")
@Slf4j
public class myPageProcess {

	@Autowired
	private MemberService memberService;
	@Autowired
	private BuyListMapper buyMapper;
	@Autowired
	private myPageService myService;



	@GetMapping("mypageForm.do")
	public String mypageForm(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
		MemberVO memberVO = memberService.selectMemberMypage(memberAuth.getRealUser().getMemNo());
		model.addAttribute("member" ,memberVO);
		int comNo = memberVO.getCompany().getComNo();

		// 결제한 내역 추출
		log.info("comNo 있음? {}",memberAuth.getRealUser());
		model.addAttribute("buyList",buyMapper.selectComBuyList(comNo));
		log.info("몇개여 {}",myService.totalBuyListRetrive(comNo));
		model.addAttribute("buyCnt",myService.totalBuyListRetrive(comNo));

		return "tiles:web-user/mypage";
	}

}
