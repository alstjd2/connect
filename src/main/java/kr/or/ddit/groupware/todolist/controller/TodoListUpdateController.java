package kr.or.ddit.groupware.todolist.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.todolist.service.TodoListCateGoryService;
import kr.or.ddit.groupware.todolist.service.TodoListService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.TodoListVO;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/gw/todoList")
@Log4j2
public class TodoListUpdateController {

	@Autowired
	public TodoListService todoService;

	@Autowired
	public TodoListCateGoryService todoCateService; // todoListCateGory Service

	@GetMapping("todoCateUpdate.do")
	public String todoCateFormUi(@RequestParam int what, Model model) {
		TodoListCateGoryVO todoCate = todoCateService.selectTodoCate(what);
		model.addAttribute("todoCate", todoCate);

		return "tiles:groupware-member/schedule/updateCategory";
	}

	@PostMapping("todoCateUpdate.do")
	public String todoCateFormData(
			@Validated(value = UpdateGroup.class) @ModelAttribute("todoCate") TodoListCateGoryVO todoCate
			, Errors errors
			, RedirectAttributes redirectAttributes
			) {
		redirectAttributes.addFlashAttribute("todoCate", todoCate);
		todoCate.getTodocateNo();
		log.info("에러는 -> ",errors);
//		if (errors.hasErrors()) {
//			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "todoCate", errors);
//			System.out.println("업데이트실패!!");
//			return "redirect:/gw/todoList/todoCateUpdate.do?what=" + todoCate.getTodocateNo();
//		} else {

			todoCateService.updateTodoCate(todoCate);
//			redirectAttributes.addFlashAttribute("redirect", "redirect");
//			System.out.println("업데이트 성공!");
			return "redirect:/gw/todoList/empTodoList.do";

//		}
	}

	@PostMapping("todoCateDelete.do")
	public String cateDelete(@RequestParam("todocateNo") int what, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		todoCateService.removeTodoCate(what);
		return "redirect:/gw/todoList/empTodoList.do";
	}


	@GetMapping("todoListUpdate.do")
	public String todoFormUI(@RequestParam int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();

		TodoListVO todoList = todoService.readTodoList(what, empNo);
		model.addAttribute("todoList", todoList);
		List<TodoListCateGoryVO> todoCateList = todoCateService.empRetriveCateList(empNo);
		model.addAttribute("todoCateList", todoCateList);
		return "tiles:groupware-member/schedule/todoListUpdate"; // update페이지로 보내주기
	}

	@GetMapping("comtodoListUpdate.do")
	public String comtodoFormUI(@RequestParam int what, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int comNo = emp.getComNo();

		TodoListVO todoList = todoService.readComTodoList(what, comNo);
		model.addAttribute("todoList", todoList);
		return "tiles:groupware-admin/schedule/todoListUpdate"; // update페이지로 보내주기
	}

	@PostMapping("todoListUpdate.do")
	public String todoFormData(@Validated(value = UpdateGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, Errors errors
			, RedirectAttributes redirectAttributes) {

		redirectAttributes.addFlashAttribute("todoList", todo);

		todo.setTodoStart(todo.getTodoStart().replace("T", " "));
	    todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));
		if (errors.hasErrors()) {

			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "todoList", errors);
			System.out.println("업데이트실패!!");
			return "redirect:/gw/todoList/todoListUpdate.do?what=" + todo.getTodoNo();
		} else {

			todoService.modifyTodoList(todo);
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			System.out.println("업데이트 성공!");
			return "redirect:/gw/todoList/empTodoList.do";

		}
	}
	@PostMapping("comtodoListUpdate.do")
	public String comtodoFormData(@Validated(value = UpdateGroup.class) @ModelAttribute("todoList") TodoListVO todo
			, Errors errors
			, RedirectAttributes redirectAttributes) {

		redirectAttributes.addFlashAttribute("todoList", todo);

		todo.setTodoStart(todo.getTodoStart().replace("T", " "));
		todo.setTodoEnd(todo.getTodoEnd().replace("T", " "));
		if (errors.hasErrors()) {
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "todoList", errors);
			System.out.println("업데이트실패!!");
			return "redirect:/gw/todoList/comtodoListUpdate.do?what=" + todo.getTodoNo();
		} else {

			todoService.modifyComTodoList(todo);
			redirectAttributes.addFlashAttribute("redirect", "redirect");
			System.out.println("업데이트 성공!");
			return "redirect:/gw/todoList/comTodoList.do";

		}
	}

	@PostMapping("todoListDelete.do")
	public String delete(@RequestParam("todoNo") int what, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		todoService.removeTodoList(what);
		return "redirect:/gw/todoList/empTodoList.do";
	}

	 @PostMapping("updateTodoState.do")
	    @ResponseBody
	    public ResponseEntity<String> updateTodoState(@RequestParam("todoNo") int todoNo,
	                                                  @RequestParam("newState") String newState
	                                                  ) {
		 	log.info("파라미터 ??  => ", newState);
	        try {
	            todoService.modifyState(todoNo, newState);
	            return new ResponseEntity<>("Success", HttpStatus.OK);
	        } catch (Exception e) {
	            return new ResponseEntity<>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }

}
