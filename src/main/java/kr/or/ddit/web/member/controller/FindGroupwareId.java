package kr.or.ddit.web.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.exception.AccountNotFoundException;
import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/w/member")
public class FindGroupwareId {

	@Autowired
	private MemberService memberService;
	@Autowired
	private CompanyMapper companyMapper;
	
	@GetMapping("findGroupwareId")
	@ResponseBody
	public Map<String, Object> findGroupwareIdProcess() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper memAuth = (MemberVOWrapper) auth.getPrincipal();
		int memNo = memAuth.getRealUser().getMemNo();
		int comNo = companyMapper.selectComNo(memNo);
		Map<String, Object> responseMap = new HashMap<>();
		
		try {
			String groupwareId = memberService.retrieveMemberGroupwareId(comNo);
			responseMap.put("groupwareId", groupwareId);
			responseMap.put("result", true);
		}catch(AccountNotFoundException e) {
			responseMap.put("result", false);
		}
		return responseMap;
	}
	
	@PostMapping("groupwareIdChk.do")
	@ResponseBody
	public Map<String, Object> groupwareIdChkProcess(String inputId) {
		Map<String, Object> responseMap = new HashMap<>();
		
		try {
			memberService.retrieveGroupwareIdChk(inputId);
			responseMap.put("result", true);
		}catch(AccountNotFoundException e) {
			responseMap.put("result", false);
		}
		return responseMap;
	}
}










