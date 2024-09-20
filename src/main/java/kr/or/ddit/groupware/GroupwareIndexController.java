package kr.or.ddit.groupware;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.groupware.attendance.service.AttendanceService;
import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.groupware.document.service.DocumentService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.groupware.todolist.service.TodoListService;
import kr.or.ddit.groupware.vacation.service.ApplicationService;
import kr.or.ddit.groupware.vacation.service.VacationInfoService;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.PmtDcmVO;
import kr.or.ddit.vo.TodoListVO;

@Controller
public class GroupwareIndexController {

	@Autowired
	public VacationInfoService vacService;

	@Autowired
	public ApplicationService appService;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private CompanyService comService;

	@Autowired
	private TodoListService todoService;

	@Autowired
	private AttendanceService attService;

	@Autowired
	private GrbService grbService;	
	
	@Autowired
	private DocumentService dcmService;
	

	@RequestMapping("/gw/index.do")
	public String employeeIndex(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    int depNo = emp.getEmpDep();
	    int comNo = emp.getComNo();

	    // 내 휴가관리
	    EmployeeVO vacCnt = vacService.empAllVacCnt(empNo);
	    ApplicationVO speUseCnt = appService.empUseSpeCnt(empNo);
	    EmployeeVO vacUseCnt = vacService.empUseVacCnt(empNo);
	    ApplicationVO speAllCnt = appService.empAllSpeCnt(empNo);
	    List<ApplicationVO> empSpeList = appService.empSpeList(empNo);
	    List<ApplicationVO> empSpeUseList = appService.empSpeUseList(empNo);
	    model.addAttribute("vacCnt", vacCnt);
	    model.addAttribute("vacUseCnt", vacUseCnt);
	    model.addAttribute("speAllCnt", speAllCnt);
	    model.addAttribute("empSpeList", empSpeList);
	    model.addAttribute("empSpeUseList", empSpeUseList);
	    model.addAttribute("speUseCnt", speUseCnt);

	    // 내 오늘 일정관리 (개인)
	    List<TodoListVO> todayTodoList = todoService.retrieveTodayTodo(empNo); // 개인 오늘
	    model.addAttribute("todayTodoList", todayTodoList);
	    List<TodoListVO> todayDepList = todoService.retrieveTodayDepTodo(depNo); // 부서 오늘
	    model.addAttribute("todayDepList", todayDepList);
	    List<TodoListVO> todayComList= todoService.retrieveTodayComTodo(comNo); // 기업 오늘
	    model.addAttribute("todayComList", todayComList);

	    // 오늘 출퇴근
	    AttendanceVO todayAtt = attService.selectTodayAtt(empNo);
	    model.addAttribute("todayAtt", todayAtt);
	    
	 // 월단위 출퇴근 현황
	    String searchDate = ""; // searchDate 초기화

	    // searchDate가 null 또는 빈 값이면 현재 날짜를 기본값으로 사용
	    if (searchDate == null || searchDate.isEmpty()) {
	        Calendar cal = Calendar.getInstance();
	        searchDate = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1); // 예: "2024-9"
	    }

	    
	    List<AttendanceVO> attWorkStatus = attService.selectEmpWorkList(empNo, searchDate);
		List<AttendanceVO> attList = attService.empAttSerchList(empNo, searchDate);

		model.addAttribute("attList", attList);
		model.addAttribute("attWorkStatus", attWorkStatus);
	    
	    
		//게시판 조회
		PaginationInfo paging = new PaginationInfo(7, 5);
		GrBoardVO grb = new GrBoardVO();
		grb.setEmpNo(emp.getEmpNo());
		grb.setComNo(emp.getComNo());
		grb.setEmpNm(emp.getEmpNm());
		paging.setSearchVO(grb);
		String empNm = emp.getEmpNm();
		List<GrBoardVO> grBoardList = grbService.retrieveGrIndexList(paging);

		model.addAttribute("grBoardList", grBoardList);
		model.addAttribute("empNm", empNm);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("empNo", emp.getEmpNo());
		
		//내 문서관리
		PmtDcmVO pmtDcm = dcmService.retrieveMyDcmCount(emp.getEmpNo());
		if(pmtDcm.getMyAppNowDcm() != null) {
			model.addAttribute("myAppNowDcm",pmtDcm.getMyAppNowDcm());
		}
		if(pmtDcm.getMyAppAffDcm() != null) {
			model.addAttribute("myAppAffDcm",pmtDcm.getMyAppAffDcm());
		}
		if(pmtDcm.getMyRefDcm() != null) {
			model.addAttribute("myRefDcm",pmtDcm.getMyRefDcm());
		}
		if(pmtDcm.getMyRecDcm() != null) {
			model.addAttribute("myRecDcm",pmtDcm.getMyRecDcm());
		}


		return "groupware-member/index";
	}

	@RequestMapping("/gw/adminPage.do")
	public String adminIndex() {
		return "groupware-admin/index";
	}

}
