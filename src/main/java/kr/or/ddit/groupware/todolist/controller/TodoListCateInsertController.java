package kr.or.ddit.groupware.todolist.controller;

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

import kr.or.ddit.groupware.todolist.service.TodoListCateGoryService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.TodoListVO;

/**
 * @author PC-09
 * 개인 카테고리 추가
 */
@Controller
@RequestMapping("/gw/todoList")
public class TodoListCateInsertController {

	@Autowired
	private TodoListCateGoryService service;

	@PostMapping("empTodoCateInsert.do")
	public String formDataProcess(
			@Validated(InsertGroup.class) @ModelAttribute("todoList") TodoListCateGoryVO todoListCate
			, BindingResult errors
			, RedirectAttributes redirectAttributes
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
	    todoListCate.setEmpNo(empNo);
	    String logicalViewName = null;

	    redirectAttributes.addFlashAttribute("todoList", todoListCate);

		if(!errors.hasErrors()) {
			// 에러 없으면
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			service.createEmpTodoCate(todoListCate);
			logicalViewName = "redirect:/gw/todoList/empTodoList.do";
		}else {
			// 에러 있으면
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"todo", errors);

			logicalViewName = "redirect:/gw/todoList/empTodoCateInsert.do";
		}
		return logicalViewName;
	}
}
