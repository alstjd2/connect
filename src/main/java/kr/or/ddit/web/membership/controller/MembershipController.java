package kr.or.ddit.web.membership.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("membership")
public class MembershipController {

	@GetMapping
	public String membershipView() {

		return "tiles:web-provider/membership/membershipList";
	}

}
