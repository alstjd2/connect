package kr.or.ddit.groupware.todolist.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.room.service.RoomService;
import kr.or.ddit.groupware.todolist.service.TodoListCateGoryService;
import kr.or.ddit.groupware.todolist.service.TodoListService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.TodoListVO;

@Controller
@RequestMapping("/gw/todoList")
public class TodoListRetrieveController {

	@Autowired
	public TodoListService todoService;  //todoList service

	@Autowired
	public TodoListCateGoryService todoCateService;  //todoListCateGory Service

	@Autowired
	public RoomService roomService;

	@GetMapping("empTodoList.do")
	public String empTodoList( Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

	    int empNo = emp.getEmpNo();
	    System.out.println("얘번호"+ empNo);

//	    List<TodoListVO> todoList = todoService.empRetriveList(empNo);
	    List<TodoListCateGoryVO> todoCateList = todoService.empCateRetriveList(empNo);
	    List<TodoListVO> todoCate = todoService.empRetriveList(empNo);
	    List<TodoListCateGoryVO> todoCateTitle = todoCateService.empRetriveCateList(empNo);
//		model.addAttribute("todoList", todoCateList);



		model.addAttribute("todoCateList", todoCateList);
		model.addAttribute("todoCate", todoCate);
		model.addAttribute("todoCateTitle", todoCateTitle);

		return "tiles:groupware-member/schedule/empTodoList";
	}

	/**
	 * 부서별 일정 전체 조회
	 *
	 * @param model
	 * @return
	 */
	@GetMapping("depTodoList.do")
	public String comTodoList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
	    int empDep = emp.getEmpDep();

	    List<TodoListVO> depTodoList = todoService.depRetriveList(empDep);
	    List<RoomVO> roomList = roomService.roomList(comNo);
	    model.addAttribute("todoList", depTodoList);
	    model.addAttribute("roomList", roomList);
		return "tiles:groupware-member/schedule/depTodoList";
	}

	/**
	 *
	 * 개인 일정 상세조회
	 * @param empNo
	 * @param todoNo
	 * @param model
	 * @return
	 */
	@GetMapping("empTodoDetail.do")
	public String empTodoDetail(@RequestParam("what") int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();



		TodoListVO todoList = todoService.readTodoList(what, empNo);

		model.addAttribute("todoList", todoList);
		return "groupware-member/schedule/todoListDetail";
	}

	/**
	 * 캘린더 개인 일정을 json 데이터로 전달
	 * @return
	 */
	@GetMapping("empCalendarList.do")
	@ResponseBody
	public List<CalendarVO> empCalendarList(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

	    int empNo = emp.getEmpNo();

	    List<TodoListVO> todoList = todoService.empRetriveList(empNo);
	    List<CalendarVO> calendarList = new ArrayList<>();
	    todoList.forEach(e->{
	    	CalendarVO calendar = new CalendarVO();
	    	calendar.calendarSetTodoList(e);
	    	calendarList.add(calendar);
	    });

	    return calendarList;
	}

	/**
	 * 캘린더 기업 일정을 json 데이터로 전달
	 * @return
	 */
	@GetMapping("comCalendarList.do")
	@ResponseBody
	public List<CalendarVO> comCalendarList(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();

		int comNo = emp.getComNo();

		List<TodoListVO> todoList = todoService.comRetriveList(comNo);
		List<CalendarVO> calendarList = new ArrayList<>();
		todoList.forEach(e->{
			CalendarVO calendar = new CalendarVO();
			calendar.calendarSetTodoList(e);
			calendarList.add(calendar);
		});

		return calendarList;
	}

	@GetMapping("depCalendarList.do")
	@ResponseBody
	public List<CalendarVO> depCalendarTodoList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
	    int empDep = emp.getEmpDep();

	    List<TodoListVO> todoList = todoService.depRetriveList(empDep);

	    List<CalendarVO> calendarList = new ArrayList<>();
		todoList.forEach(e->{
			CalendarVO calendar = new CalendarVO();
			calendar.calendarSetTodoList(e);
			calendarList.add(calendar);
		});


	    return calendarList;
	}

}
