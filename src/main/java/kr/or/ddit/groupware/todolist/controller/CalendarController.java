package kr.or.ddit.groupware.todolist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.todolist.service.TodoListCateGoryService;
import kr.or.ddit.groupware.todolist.service.TodoListService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.TodoListVO;

@Controller
@RequestMapping("/gw/todoList")
public class CalendarController {

	@Autowired
	public TodoListService todoService;  //todoList service

	@Autowired
	public TodoListCateGoryService todoCateService;

	@Autowired
	private NewAlarmController alarmController;

	@GetMapping("calendar.do")
	public String calendar(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
	    int empDep = emp.getEmpDep();
	    int empNo = emp.getEmpNo();
	    System.out.println("얘번호"+ empNo);
	    List<TodoListCateGoryVO> todoCateList = todoService.empCateRetriveList(empNo);
	    List<TodoListVO> todoCate = todoService.empRetriveList(empNo);
		List<TodoListCateGoryVO> todoCateTitle = todoCateService.empRetriveCateList(empNo);
		List<TodoListVO> depTodoList = todoService.depRetriveList(empDep);
		List<TodoListVO> todoList = todoService.comRetriveList(comNo);

		model.addAttribute("todoCateList", todoCateList);
		model.addAttribute("todoCate", todoCate);
		model.addAttribute("depTodoList", depTodoList);
		model.addAttribute("todoList", todoList);
		model.addAttribute("todoCateTitle", todoCateTitle);

		return "tiles:groupware-member/schedule/calendar";
	}


	@GetMapping("caltodoListUpdate.do")
	public String todoFormUI(@RequestParam int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();

		TodoListVO todoList = todoService.readTodoList(what, empNo);
		model.addAttribute("todoList", todoList);
		List<TodoListCateGoryVO> todoCateList = todoCateService.empRetriveCateList(empNo);
		model.addAttribute("todoCateList", todoCateList);
		return "tiles:groupware-member/schedule/caltodoListUpdate"; // update페이지로 보내주기
	}
	@GetMapping("calDeptodoListUpdate.do")
	public String deptodoFormUI(@RequestParam int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();

		TodoListVO todoList = todoService.readDepTodo(what);
		model.addAttribute("todoList", todoList);
		List<TodoListCateGoryVO> todoCateList = todoCateService.empRetriveCateList(empNo);
		model.addAttribute("todoCateList", todoCateList);
		return "tiles:groupware-member/schedule/depTodoListUpdate"; // update페이지로 보내주기
	}

	@PostMapping("calDeptodoListUpdate.do")
	public String tododepFormData(@Validated(value = UpdateGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, Errors errors
			, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();

		redirectAttributes.addFlashAttribute("todoList", todo);

		todo.setTodoStart(todo.getTodoStart().replace("T", " "));
	    todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));
		if (errors.hasErrors()) {

			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "todoList", errors);
			System.out.println("업데이트실패!!");
			return "redirect:/gw/todoList/calDeptodoListUpdate.do?what=" + todo.getTodoNo();
		} else {

			todoService.modifyDepTodo(todo);
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			System.out.println("업데이트 성공!");
			return "redirect:/gw/todoList/calendar.do";

		}
	}
	@PostMapping("caltodoListUpdate.do")
	public String todoFormData(@Validated(value = UpdateGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, Errors errors
			, RedirectAttributes redirectAttributes) {

		redirectAttributes.addFlashAttribute("todoList", todo);

		todo.setTodoStart(todo.getTodoStart().replace("T", " "));
	    todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));
		if (errors.hasErrors()) {

			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "todoList", errors);
			System.out.println("업데이트실패!!");
			return "redirect:/gw/todoList/caltodoListUpdate.do?what=" + todo.getTodoNo();
		} else {

			todoService.modifyTodoList(todo);
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			System.out.println("업데이트 성공!");
			return "redirect:/gw/todoList/calendar.do";

		}
	}
	@PostMapping("caltodoListDelete.do")
	public String delete(@RequestParam("todoNo") int what, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		todoService.removeTodoList(what);
		return "redirect:/gw/todoList/calendar.do";
	}


	@PostMapping("calDeptodoListDelete.do")
	@ResponseBody
	public Map<String, Object> deleteTodo(@RequestParam("todoNo")  int what) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        // Perform the delete operation
	        response.put("success", true);
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
			EmployeeVO emp = empAuth.getRealUser();
			int empNo = emp.getEmpNo();
			todoService.removeDepTodoList(what);
	    } catch (Exception e) {
	        response.put("success", false);
	    }
	    return response;
	}

	@PostMapping("emptodoListDelete.do")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam("todoNo")  int what) {
		Map<String, Object> response = new HashMap<>();
		try {
			// Perform the delete operation
			response.put("success", true);
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
			EmployeeVO emp = empAuth.getRealUser();
			int empNo = emp.getEmpNo();
			todoService.removeTodoList(what);
		} catch (Exception e) {
			response.put("success", false);
		}
		return response;
	}


//	@PostMapping("calDeptodoListDelete.do")
//	public String deletedepTodo(@RequestParam("todoNo") int what, RedirectAttributes redirectAttributes) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
//		EmployeeVO emp = empAuth.getRealUser();
//		int empNo = emp.getEmpNo();
//		todoService.removeTodoList(what, empNo);
//		return "redirect:/gw/todoList/calendar.do";
//	}
}
