package kr.or.ddit.groupware.attendance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.attendance.service.AttendanceService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("/gw/attendance")
public class AttendanceRetrieveController {


	@Autowired
	public AttendanceService service;

	@Autowired
	public EmployeeService empService;

	@GetMapping("categoryInsert.do")
	public String attendanceList() {
		return "tiles:groupware-admin/attendance/attendance-category";
	}

	@GetMapping("attendanceList.do")
	public String attendanceWorkList(
			@RequestParam(required = false) String empNm
			, @RequestParam(required = false) String searchDate
            ,Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();
		emp.setComNo(comNo);



		List<EmployeeVO> comAttList = service.comAttRetriveList2(comNo);
		List<EmployeeVO> comWorkStatus = service.comAttWorkStatusRetriveList(comNo);
		 List<EmployeeVO> serachList = service.searchAttendance(comNo,empNm, searchDate);
		 List<EmployeeVO> empList = empService.retrieveAllEmployees(comNo);
//	     model.addAttribute("serachList", serachList);
		model.addAttribute("attList", serachList);
		model.addAttribute("attWorkStatus", comWorkStatus);
		model.addAttribute("empList", empList);

		return "tiles:groupware-admin/schedule/working-hours";
	}

//	 @GetMapping("/attendanceSearch.do")
//	    public String searchAttendance(
//	            @RequestParam(required = false) String empName,
//	            @RequestParam(required = false) String searchMonth,
//	            Model model) {
//
//	        List<EmployeeVO> attList = service.searchAttendance(empName, searchMonth);
//	        model.addAttribute("attList", attList);
//	        
//	        // 페이징 처리
////	        PaginationInfo<> paginationInfo = new PaginationInfo();
//	        // paginationInfo 설정 ...
////	        model.addAttribute("paginationInfo", paginationInfo);
//
//	        return "attendancePage"; // JSP 페이지명
//	    }



}
