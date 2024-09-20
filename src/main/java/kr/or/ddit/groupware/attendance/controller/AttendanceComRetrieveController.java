package kr.or.ddit.groupware.attendance.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.groupware.attendance.service.AttendanceService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("/gw/attandance")
public class AttendanceComRetrieveController {

	@Autowired
	public AttendanceService service;
	@Autowired
	public EmployeeService empService;

	@GetMapping("attComList.do")
	public String comAttList(
			@RequestParam(required = false, defaultValue="1") int page,
			@RequestParam Map<String, Object> detailCondition,
			Model model
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

	    int comNo = emp.getComNo();
	    PaginationInfo<EmployeeVO> paging = new PaginationInfo<EmployeeVO>(10,5);
	    paging.setDetailCondition(detailCondition); //
	    EmployeeVO empNo = new EmployeeVO();
	    empNo.setComNo(comNo);

	    paging.setSearchVO(empNo);
	    paging.setPage(page);

	    paging.addSearchCondition("comNo", comNo);

	    List<EmployeeVO> comAttList = service.comAttRetriveList(paging);
	    model.addAttribute("attList", comAttList);

	    PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("detailCondition", detailCondition);
		return "tiles:groupware-admin/schedule/working-hours";
	}

	@GetMapping("attendanceDetail.do")
	public String attendDetail(@RequestParam("what") int what ,
	@RequestParam(required = false) String searchDate, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();
		int empDep = emp.getEmpDep();
		EmployeeVO empDetail = empService.selectEmpVacDetail(empNo);
		String orgDep = empDetail.getEmpDepName();
		List<EmployeeVO> empDepList = empService.selectEmpVacDepList(orgDep,comNo);

		EmployeeVO empList = empService.retrieveEmployee(what);
		List<AttendanceVO> attWorkStatus = service.selectEmpWorkList(what, searchDate);
		List<AttendanceVO> attList = service.empAttSerchList(what, searchDate);
		List<EmployeeVO> dfVacList = empService.retrieveDfVacList(comNo);

		model.addAttribute("empList", empList);
		model.addAttribute("attList", attList);
		model.addAttribute("attWorkStatus", attWorkStatus);
		model.addAttribute("dfVacList", dfVacList);
		return "tiles:groupware-admin/schedule/working-hours-detail";
	}
//	@GetMapping("attComList.do")
//	public String comAttList(
//			Model model
//			) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
//		EmployeeVO emp = empAuth.getRealUser();
//
//		int comNo = emp.getComNo();
//		emp.setComNo(comNo);
//
//
//
//		List<EmployeeVO> comAttList = service.comAttRetriveList2(comNo);
//		model.addAttribute("attList", comAttList);
//
//
//
//		return "tiles:groupware-admin/schedule/working-hours";
//	}

}
