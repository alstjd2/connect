package kr.or.ddit.groupware.todolist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.todolist.service.TodoListService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListVO;

@Controller
@RequestMapping("/gw/todoList")
public class ComTodoListRetrieveController {

	@Autowired
	public TodoListService service;


	@GetMapping("comTodoList.do")
	public String comTodoList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();

	    List<TodoListVO> comTodoList = service.comRetriveList(comNo);

	    model.addAttribute("todoList", comTodoList);
	    return "tiles:groupware-admin/schedule/companyTodoList";

	}

	@GetMapping("companyTodoList")
	public @ResponseBody List<TodoListVO> comTodoList() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();

	    List<TodoListVO> companyTodoList = service.comRetriveList(comNo);

	    return companyTodoList;
	}

	@GetMapping("comTodoDetail.do")
	public String empTodoDetail(@RequestParam("what") int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();


		TodoListVO todoList = service.readComTodoList(what, comNo);
		model.addAttribute("todoList", todoList);
		return "groupware-admin/schedule/todoListDetail";
	}

	@PostMapping("comtodoListDelete.do")
	public String deletecomTodo(@RequestParam("todoNo") int what, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		service.removeTodoList(what);
		return "redirect:/gw/todoList/comTodoList.do";
	}
}
