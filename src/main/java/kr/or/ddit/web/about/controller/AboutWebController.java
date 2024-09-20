package kr.or.ddit.web.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/w/about")
@RequiredArgsConstructor
public class AboutWebController {
	@GetMapping("us.do")
	public String aboutUs(Model model) {
		return "tiles:web-user/about/about-us";	
	}
	@GetMapping("message.do")
	public String aboutMessage(Model model) {
		return "tiles:web-user/about/about-message";	
	}
	@GetMapping("mail.do")
	public String aboutMail(Model model) {
		return "tiles:web-user/about/about-mail";	
	}
	@GetMapping("calender.do")
	public String aboutCalender(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}

	@GetMapping("todo.do")
	public String aboutTodo(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}
	
	@GetMapping("board.do")
	public String aboutBoard(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}
	
	@GetMapping("survey.do")
	public String aboutSurvey(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}

	@GetMapping("conference.do")
	public String aboutConference(Model model) {	
		return "tiles:web-user/about/about-conference";	
	}

	@GetMapping("address.do")
	public String aboutAddress(Model model) {	
		return "tiles:web-user/about/about-address";	
	}

	@GetMapping("drive.do")
	public String aboutDrive(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}

	@GetMapping("approval.do")
	public String aboutApproval(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}

	@GetMapping("personnel.do")
	public String aboutPersonnel(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}

	@GetMapping("attendance.do")
	public String aboutAttendance(Model model) {	
		return "tiles:web-user/about/about-calendar";	
	}
	
	
	
	
	@GetMapping("startGuide.do")
	public String aboutStart(Model model) {	
		return "tiles:web-user/guide/guide-start";	
	}
	@GetMapping("guideRefund.do")
	public String aboutRefund(Model model) {	
		return "tiles:web-user/guide/guide-refund";	
	}
	@GetMapping("policyPersonal.do")
	public String aboutPolicyPersonal(Model model) {	
		return "tiles:web-user/policy/policy-personal";	
	}
	@GetMapping("policyUse.do")
	public String aboutPolicyUse(Model model) {	
		return "tiles:web-user/policy/policy-use";	
	}
}
