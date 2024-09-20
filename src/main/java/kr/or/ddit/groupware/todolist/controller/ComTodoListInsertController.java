package kr.or.ddit.groupware.todolist.controller;

import java.time.LocalDateTime;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.todolist.service.TodoListService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListVO;


@Controller
@RequestMapping("/gw/todoList")
public class ComTodoListInsertController {


	@Autowired
	private TodoListService service;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private NewAlarmController alarmController;

	@Autowired
    private AlarmService alarmService;

	@Autowired
    private NotificationWebSocketHandler notificationWebSocketHandler;

	@PostMapping("comTodoListInsert.do")
	public String formDataP(
			@Validated(InsertGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, BindingResult errors
			, RedirectAttributes redirectAttributes ) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    int comNo = emp.getComNo();
	    todo.setEmpNo(empNo);

	    todo.setTodoStart(todo.getTodoStart().replace("T", " "));
	    todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));

		String logicalViewName = null;

		redirectAttributes.addFlashAttribute("todoList", todo);

		List<EmployeeVO> empList = empService.retrieveAllEmployees(comNo);

		if(!errors.hasErrors()) {
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createCompanyTodo(todo);

			logicalViewName = "redirect:/gw/todoList/comTodoList.do";

		}else {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"todoList", errors);
			logicalViewName = "redirect:/gw/todoList/comTodoListInsert.do";
		}

		return logicalViewName;
	}


}
