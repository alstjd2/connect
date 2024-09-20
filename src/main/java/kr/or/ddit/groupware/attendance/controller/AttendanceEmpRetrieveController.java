package kr.or.ddit.groupware.attendance.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.attendance.service.AttendanceService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/gw/myInfo")
@RequiredArgsConstructor
@Log4j2
public class AttendanceEmpRetrieveController {

	@Autowired
	public AttendanceService service;

	@Autowired
	public EmployeeService empService;

//	@GetMapping("attendanceList.do")
//	public String empAttList(
//			@RequestParam(required = false, defaultValue="1") int page,
//			@RequestParam Map<String, Object> detailCondition,
//			Model model) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
//	    EmployeeVO emp = empAuth.getRealUser();
//
//	    int empNo = emp.getEmpNo();
//
//	    PaginationInfo<AttendanceVO> paging = new PaginationInfo<AttendanceVO>(5,3);
//	    paging.setDetailCondition(detailCondition); //
//	    AttendanceVO att = new AttendanceVO();
//	    att.setEmpNo(empNo);
//
//	    paging.setSearchVO(att);
//	    paging.setPage(page);
//	    log.info("empNO 있는지 여부 =>" , empNo);
//
//	    paging.addSearchCondition("empNo", empNo);
//	    Calendar cal = Calendar.getInstance();
//	    int currentMonth = cal.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더해줌
//	    log.info("이번달 => ",currentMonth);
//	    model.addAttribute("currentMonth", currentMonth);
//
//	    List<AttendanceVO> attList = service.empAttRetriveList(paging);
//	    List<AttendanceVO> attWorkStatus = service.empAttWorkStatusRetriveList(paging);
//
//	    model.addAttribute("attList", attList);
//	    model.addAttribute("attWorkStatus", attWorkStatus);
//
//		PaginationRenderer renderer = new DefaultPaginationRenderer();
//		String pagingHTML = renderer.renderPagination(paging);
//
//		model.addAttribute("pagingHTML", pagingHTML);
//		model.addAttribute("detailCondition", detailCondition);
//		return "tiles:groupware-member/myInfo/myInfo-working-hours";
//	}

	@GetMapping("empattendanceList.do")
	public String empSerchAttList(
			@RequestParam(required = false) String searchDate,
			Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int empNo = emp.getEmpNo();
		 LocalDate currentDate = LocalDate.now();
	     String formattedDate = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM"));

		Calendar cal = Calendar.getInstance();
		int currentMonth = cal.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더해줌
		log.info("이번달 => ",currentMonth);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDate", formattedDate);
//		List<AttendanceVO> attList = service.selectEmpAttList(empNo);
		List<AttendanceVO> attWorkStatus = service.selectEmpWorkList(empNo, searchDate);
		List<AttendanceVO> attList = service.empAttSerchList(empNo, searchDate);

		model.addAttribute("attList", attList);
		model.addAttribute("attWorkStatus", attWorkStatus);


		return "tiles:groupware-member/myInfo/myInfo-working-hours2";
	}



}
