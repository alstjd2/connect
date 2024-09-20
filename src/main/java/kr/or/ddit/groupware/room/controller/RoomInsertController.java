package kr.or.ddit.groupware.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.room.service.RoomService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.TodoListVO;

@Controller
@RequestMapping("/gw/room")
public class RoomInsertController {

	@Autowired
	private RoomService service;

	@PostMapping("roomInsert.do")
	public String formDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("roomList") RoomVO room
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
	    room.setComNo(comNo);

		String logicalViewName = null;

		redirectAttributes.addFlashAttribute("roomList", room);
		if(!errors.hasErrors()) {
			// 에러 없으면
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createRoom(room);
			logicalViewName = "redirect:/gw/room/roomList.do";
		}else {
			// 에러 있으면
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"roomList", errors);

			logicalViewName = "redirect:/gw/room/roomInsert.do";
		}


		return logicalViewName;
	}
	
	@GetMapping("roomUpdate.do")
	public String comtodoFormUI(@RequestParam int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();
		
		RoomVO roomList = service.retriveRoom(what, comNo);
		model.addAttribute("roomList", roomList);
		return "tiles:groupware-admin/schedule/roomUpdate"; // update페이지로 보내주기
	}
	@PostMapping("roomDelete.do")
	public String delete(@RequestParam("roomNo") int what, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();
		service.removeRoom(what, comNo);
		return "redirect:/gw/room/roomList.do";
	}
	
	@PostMapping("roomReservationDelete.do")
	public String roomReservationDelete( @RequestParam("roomreserNo") int what, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();
		service.removeRoomReservation(what);
		
		return "redirect:/gw/room/roomReservation.do";
	}
	@PostMapping("roomUpdate.do")
	public String comtodoFormData(@Validated(value = UpdateGroup.class) @ModelAttribute("roomList") RoomVO room
			, Errors errors
			, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("roomList", room);
		
		if (errors.hasErrors()) {

			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "roomList", errors);
			System.out.println("업데이트실패!!");
			return "redirect:/gw/room/roomUpdate.do?what=" + room.getRoomNo();
		} else {

			service.modifyRoom(room);
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			System.out.println("업데이트 성공!");
			return "redirect:/gw/room/roomList.do";

		}
		
	}
	
}
