package kr.or.ddit.groupware.room.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.room.service.RoomService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.RoomReservationVO;
import kr.or.ddit.vo.RoomReservationViewVO;
import kr.or.ddit.vo.RoomVO;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/gw/room")
@Log4j2
public class RoomRetriveController {

	@Autowired
	public RoomService service;

	@Autowired
	private EmployeeService empService;



	@GetMapping("roomList.do")
	public String roomList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

	    int comNo = emp.getComNo();

	    List<RoomVO> roomList = service.roomList(comNo);
	    model.addAttribute("roomList", roomList);

	    return "tiles:groupware-admin/schedule/roomList";
	}

	@GetMapping("comRoomList.do")
	public String comRoomList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();

//		List<RoomVO> roomList = service.comRoomList(comNo);
		List<RoomReservationViewVO> roomList= service.comRoomReservation(comNo);
		model.addAttribute("roomList", roomList);

		return "tiles:groupware-admin/schedule/comRoomList";
	}

	@GetMapping("roomReservation.do")
	public String RoomReservation(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();

		 List<RoomVO> roomList = service.roomList(comNo); // 기업별 회의실 리스트
		model.addAttribute("roomList", roomList);

		EmployeeVO empDetail = empService.selectEmpVacDetail(empNo); // 직원 상세
		String orgDep = empDetail.getEmpDepName();
		List<EmployeeVO> empDepList = empService.selectEmpVacDepList(orgDep,comNo);
		model.addAttribute("empDepList", empDepList);

		List<RoomReservationVO> roomReserList = service.roomReservationList(comNo); // 회의실 당일 예약 조회
		model.addAttribute("empDetail", empDetail);
		model.addAttribute("reservationList", roomReserList);
		return "tiles:groupware-member/schedule/roomReservation";
	}

	@ResponseBody
	@GetMapping("roomReservationData")
	public List<RoomReservationVO> getRoomReservationData() {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    int comNo = emp.getComNo();

	    return service.roomReservationList(comNo); // 회의실 당일 예약 조회
	}


	@ResponseBody
	@GetMapping("roomReservationDetails")
	public RoomReservationVO getRoomReservation(int what) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    int comNo = emp.getComNo();

	    return service.retrieveRoom(what); // 회의실 당일 예약 조회
	}

	@PostMapping("roomReservation.do")
	public String formDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("roomList") RoomReservationVO room
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
	    int empNo = emp.getEmpNo();
	    room.setEmpNo(empNo);
		String logicalViewName = null;

		redirectAttributes.addFlashAttribute("roomList", room);
		if(!errors.hasErrors()) {
			// 에러 없으면
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createRoomReservation(room);
			logicalViewName = "redirect:/gw/room/roomReservation.do";
		}else {
			// 에러 있으면
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"roomList", errors);
			log.info("에러",errors);
			logicalViewName = "redirect:/gw/room/roomReservation.do";
		}


		return logicalViewName;
	}
	@PostMapping("adminroomReservation.do")
	public String adminformDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("roomList") RoomReservationVO room
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();
		int empNo = emp.getEmpNo();
		room.setEmpNo(empNo);
		String logicalViewName = null;

		redirectAttributes.addFlashAttribute("roomList", room);
		if(!errors.hasErrors()) {
			// 에러 없으면
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createRoomReservation(room);
			logicalViewName = "redirect:/gw/room/adminRoomReservation.do";
		}else {
			// 에러 있으면
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"roomList", errors);
			log.info("에러",errors);
			logicalViewName = "redirect:/gw/room/adminRoomReservation.do";
		}


		return logicalViewName;
	}

	@GetMapping("detailRoom.do")
	public String comdetailRoomList(int what,Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();
		RoomVO roomList =  service.retriveRoom(what, comNo);
		model.addAttribute("roomList", roomList);
		return "groupware-admin/schedule/roomDetail";
	}


	@GetMapping("adminRoomReservation.do")
	public String comRoomReservationAdmin(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();

		 List<RoomVO> roomList = service.roomList(comNo); // 기업별 회의실 리스트
		model.addAttribute("roomList", roomList);

		EmployeeVO empDetail = empService.selectEmpVacDetail(empNo); // 직원 상세
		String orgDep = empDetail.getEmpDepName();
		List<EmployeeVO> empDepList = empService.selectEmpVacDepList(orgDep,comNo);
		model.addAttribute("empDepList", empDepList);

		List<RoomReservationVO> roomReserList = service.roomReservationList(comNo); // 회의실 당일 예약 조회
		model.addAttribute("empDetail", empDetail);
		model.addAttribute("reservationList", roomReserList);
		return "tiles:groupware-admin/schedule/adminRoomReservation";
	}
	@GetMapping("comRoomReservationList.do")
	public String comRoomReservationList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();
		List<RoomReservationVO> reservationList = service.roomComReservationList(comNo);
		List<RoomReservationVO> todayList = service.roomReservationList(comNo);
		List<RoomReservationVO> deleteList = service.roomreservationDeleteList(comNo);
		List<RoomReservationVO> monthAllList = service.roomMonthAllReservationList(comNo);
		model.addAttribute("monthAllList", monthAllList);
		model.addAttribute("deleteList", deleteList);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("todayList", todayList);
		return "tiles:groupware-admin/schedule/roomReservation";
	}

	@GetMapping("comRoomReservationList")
	public @ResponseBody List<RoomReservationVO> appComList() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();
		List<RoomReservationVO> reservationList = service.roomComReservationList(comNo);

		return reservationList;
	}

}
