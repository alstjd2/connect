package kr.or.ddit.web.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/w/support")
public class SupportProviderController {




	@GetMapping("guideService.do")
	public String guideService() {
		return "tiles:web-provider/support/guide-service";
	}

	@GetMapping("guideAdmin.do")
	public String guideAdmin() {
		return "tiles:web-provider/support/guide-admin";
	}

	@GetMapping("guideRefund.do")
	public String guideRefund() {
		return "tiles:web-provider/support/guide-refund";
	}

	@GetMapping("faq.do")
	public String faq() {
		return "tiles:web-provider/support/faq";
	}

	@GetMapping("supportPolicyPersonal.do")
	public String guidePolicyPersonal() {
		return "tiles:web-provider/support/policy-personal";
	}

	@GetMapping("supportPolicyUse.do")
	public String guidePolicyUse() {
		return "tiles:web-provider/support/policy-use";
	}
	
	@GetMapping("guideWrite.do")
	public String guideWrite() {
		return "tiles:web-provider/support/guide-write";
	}
	
	@GetMapping("faqWrite.do")
	public String faqWrite() {
		return "tiles:web-provider/support/faq-write";
	}

}