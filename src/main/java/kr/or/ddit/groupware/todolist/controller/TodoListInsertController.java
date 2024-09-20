package kr.or.ddit.groupware.todolist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.todolist.service.TodoListService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListVO;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/gw/todoList")
@Log4j2
public class TodoListInsertController {

	@Autowired
	private TodoListService service;

	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private NewAlarmController alarmController;
	/**
	 * 개인일정 추가
	 * @param todo
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping("empTodoListInsert.do")
	public String formDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, BindingResult errors
			, RedirectAttributes redirectAttributes ) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    todo.setEmpNo(empNo);
	    todo.setTodoStart(todo.getTodoStart().replace("T", " "));
	    todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));
	    String logicalViewName = null;
		System.out.println("test : "+ todo);


		redirectAttributes.addFlashAttribute("todoList", todo);
		if(!errors.hasErrors()) {
			// 에러 없으면
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createEmpTodo(todo);
			logicalViewName = "redirect:/gw/todoList/empTodoList.do";
		}else {
			// 에러 있으면
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"todoList", errors);

			logicalViewName = "redirect:/gw/todoList/empTodoListInsert.do";
		}

		return logicalViewName;
	}
	@PostMapping("calempTodoListInsert.do")
	public String calformDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, BindingResult errors
			, RedirectAttributes redirectAttributes ) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		todo.setEmpNo(empNo);
		todo.setTodoStart(todo.getTodoStart().replace("T", " "));
		todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));
		String logicalViewName = null;
		System.out.println("test : "+ todo);


		redirectAttributes.addFlashAttribute("todoList", todo);
		if(!errors.hasErrors()) {
			// 에러 없으면
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createEmpTodo(todo);
			logicalViewName = "redirect:/gw/todoList/calendar.do";
		}else {
			// 에러 있으면
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"todoList", errors);

			logicalViewName = "redirect:/gw/todoList/calempTodoListInsert.do";
		}

		return logicalViewName;
	}






	@RequestMapping(value="/depTodoListInsert.do" ,method=RequestMethod.POST)
	public String formData(
			@Validated(InsertGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, BindingResult errors
			, RedirectAttributes redirectAttributes ) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    todo.setEmpNo(empNo);
		int comNo = emp.getComNo();
		String empDep = emp.getEmpNm();
//	    List<EmployeeVO> empDepList = empService.selectEmpVacDepList(empDep, comNo);
//		for (EmployeeVO employee : empDepList) {
//			int recipientEmpNo = employee.getEmpNo();
//			log.info("부서 일정 ??",recipientEmpNo);
//			alarmController.handleNewMessage("새로운 부서 일정이 등록되었습니다.", recipientEmpNo,"일정관리 - 캘린더", 6, "gw/todoList/calendar.do");
//
//		}
	    todo.setTodoStart(todo.getTodoStart().replace("T", " "));
	    todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));

		String logicalViewName = null;
		service.createDetTodo(todo);
			logicalViewName = "redirect:/gw/todoList/calendar.do";

		return logicalViewName;
	}


//



}
