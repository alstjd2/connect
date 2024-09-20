package kr.or.ddit.web.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.vo.MemberVOWrapper;

@Controller
@RequestMapping("/w")
public class SubController {

	@Autowired
	private CompanyMapper comMapper;

	@GetMapping("/findComNo.do")
	public int findComNo() {
		int comNo =0;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	 	MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
		int memNo = memberAuth.getRealUser().getMemNo();
		comNo = comMapper.selectComNo(comNo);

		return comNo;
	}


}
