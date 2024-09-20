package kr.or.ddit.groupware.todolist.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.todolist.dao.TodoListCateGoryDetailMapper;
import kr.or.ddit.groupware.todolist.dao.TodoListCateGoryMapper;
import kr.or.ddit.groupware.todolist.dao.TodoListMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.TodoListCateGoryDetailVO;
import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.TodoListVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Log4j2
public class TodoListServiceImpl implements TodoListService {

	private final TodoListMapper mapper;
	private final TodoListCateGoryDetailMapper tdCateDetailMapper;
	private final TodoListCateGoryMapper tdCateMapper;

	@Autowired
	private EmployeeService empService;

	@Autowired
	private AlarmService alarmService;

	@Autowired
	private NotificationWebSocketHandler notificationWebSocketHandler;

	/**
	 * 개인 일정 작성
	 */
	@Override
	public void createEmpTodo(TodoListVO todo) {
		mapper.insertEmpTodo(todo);
	}

	/**
	 * 부서일정작성
	 */
	@Override
	public void createDetTodo(TodoListVO todo) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		int comNo = emp.getComNo();
		EmployeeVO empDetail = empService.retrieveEmployeeDetail(empNo);
		int empD = empDetail.getEmpDep();
		List<EmployeeVO> empDepList = empService.retrieveEmpDep(empD);
			for(EmployeeVO empDep : empDepList) {
				int recipientEmpNo = empDep.getEmpNo();
				AlarmVO alarm = new AlarmVO();
				alarm.setEmpNo(recipientEmpNo);
				alarm.setComNo(comNo);
				alarm.setAlarmComncode("["+empNm+"]님이 새로운 [부서일정]을 등록하였습니다.");
				alarm.setAlarmChk("N");
				alarm.setAlarmDate(LocalDateTime.now());
				alarm.setAlarmHeader("일정관리 - 캘린더");
				alarm.setAlarmCode(6);
				alarm.setAlarmLink("gw/todoList/calendar.do");
				alarmService.createAlarm(alarm);

				String notificationMessage = alarm.getAlarmComncode();
				notificationWebSocketHandler.sendNotification(recipientEmpNo, notificationMessage);

		}

		mapper.insertDetTodo(todo);


	}

	/**
	 * 기업 일정 작성
	 */
	@Override
	public void createCompanyTodo(TodoListVO todo) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		int comNo = emp.getComNo();
		List<EmployeeVO> empList = empService.retrieveAllEmployees(comNo);
		for (EmployeeVO employee : empList) {
			int recipientEmpNo = employee.getEmpNo();
			AlarmVO alarm = new AlarmVO();
			alarm.setEmpNo(recipientEmpNo);
			alarm.setComNo(comNo);
			alarm.setAlarmComncode("새로운 [기업일정]이 등록되었습니다.");
			alarm.setAlarmChk("N");
			alarm.setAlarmDate(LocalDateTime.now());
			alarm.setAlarmHeader("일정관리 - 캘린더");
			alarm.setAlarmCode(6);
			alarm.setAlarmLink("gw/todoList/calendar.do");
			alarmService.createAlarm(alarm);

			String notificationMessage = alarm.getAlarmComncode();
			notificationWebSocketHandler.sendNotification(recipientEmpNo, notificationMessage);
		}
		mapper.insertCompanyTodo(todo);
	}

	/**
	 * 일정 한개 작성
	 */
	@Override
	public void createTodoList(TodoListVO todo) { // 일정 한개 작성
		mapper.insertTodoList(todo);
	}

	/**
	 * 일정 수정
	 */
	@Override
	public void modifyTodoList(TodoListVO todo) {
		mapper.updateTodoList(todo);
	}

	/**
	 * 일정 삭제
	 */
	@Override
	public void removeTodoList(int todoNo) {
		mapper.deleteTodoList(todoNo);
	}
	@Override
	public void removeDepTodoList(int todoNo) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empDepNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		int comNo = emp.getComNo();
		EmployeeVO empDetail = empService.retrieveEmployeeDetail(empDepNo);
		String empDepNm = empDetail.getEmpDepName();
		int empD = empDetail.getEmpDep();
//		List<EmployeeVO> empDepList = empService.selectEmpVacDepList(empDepNm, comNo);
		List<EmployeeVO> empDepList = empService.retrieveEmpDep(empD);
		log.info(empDepList);
			for(EmployeeVO empDep : empDepList) {
				int recipientEmpNo = empDep.getEmpNo();
				AlarmVO alarm = new AlarmVO();
				alarm.setEmpNo(recipientEmpNo);
				alarm.setComNo(comNo);
				alarm.setAlarmComncode("["+empNm+"]님이 [부서일정]을 삭제하였습니다.");
				alarm.setAlarmChk("N");
				alarm.setAlarmDate(LocalDateTime.now());
				alarm.setAlarmHeader("일정관리 - 캘린더");
				alarm.setAlarmCode(6);
				alarm.setAlarmLink("gw/todoList/calendar.do");
				alarmService.createAlarm(alarm);

				String notificationMessage = alarm.getAlarmComncode();
				notificationWebSocketHandler.sendNotification(recipientEmpNo, notificationMessage);

		}

		mapper.deleteTodoList(todoNo);
	}


	/**
	 * 개인 일정 전체 조회
	 */
	@Override
	public List<TodoListVO> empRetriveList(int empNo) {
		return mapper.selectempTodo(empNo);

	}

	/**
	 * 개인 일정 카테고리 title 리스트
	 */
	@Override
	public TodoListVO empRetriveCateList(int empNo) {

		return mapper.selecttodoCateList(empNo);
	}

	/**
	 * 카테고리별 개인 일정 리스트 출력
	 */
	@Override
	public TodoListVO empRetriveTodoCate(int empNo, int todocateNo) {
		return mapper.selectempTodoCate(empNo, todocateNo);
	}

	/**
	 * 기업 일정 전체 리스트 조회
	 */
	@Override
	public List<TodoListVO> comRetriveList(int comNo) {

		return mapper.selectComTodoList(comNo);
	}

	@Override
	public List<TodoListVO> todolist() {
		return mapper.selectTodoList();
	}

	/**
	 * 한개의 기업 일정 상세조회
	 */
	@Override
	public TodoListVO readComTodoList(int comNo, int todoNo) {
		return mapper.selectComTodo(comNo, todoNo);

	}

	/**
	 * 한개의 개인 일정 상세조회
	 */
	@Override
	public TodoListVO readTodoList(int todoNo, int empNo) {
		TodoListVO todo = mapper.selectTodo(todoNo, empNo);
		if (todo == null) {
			throw new PkNotFoundException(todo);
		}

		return todo;
	}

	@Override
	public List<TodoListVO> depRetriveList(int empDep) {
		return mapper.selectDepTodoList(empDep);
	}

	@Override
	public List<TodoListCateGoryVO> empCateRetriveList(int empNo) {
		return mapper.selectCateEmpTodo(empNo);
	}

	@Override
	public List<TodoListVO> retrieveTodayTodo(int empNo) {
		return mapper.todayTodoList(empNo);
	}

	@Override
	public void modifyComTodoList(TodoListVO todo) {
		mapper.updateComTodoList(todo);
	}

	@Override
	public void modifyState(int todoNo, String newState) {
		mapper.updateState(todoNo, newState);
	}

	@Override
	public List<TodoListVO> retrieveTodayDepTodo(int empDep) {
		return mapper.todayDepTodoList(empDep);
	}

	@Override
	public List<TodoListVO> retrieveTodayComTodo(int comNo) {
		return mapper.todayComTodoList(comNo);
	}

	@Override
	public TodoListVO readDepTodo(int todoNo) {

		return mapper.selectDepTodoDetail(todoNo);
	}

	@Override
	public void modifyDepTodo(TodoListVO todo) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		int empNo = emp.getEmpNo();
		String empNm = emp.getEmpNm();
		int comNo = emp.getComNo();
		EmployeeVO empDetail = empService.retrieveEmployeeDetail(empNo);
		String empDepNm = empDetail.getEmpDepName();
		List<EmployeeVO> empDepList = empService.selectEmpVacDepList(empDepNm, comNo);
			for(EmployeeVO empDep : empDepList) {
				int recipientEmpNo = empDep.getEmpNo();
				AlarmVO alarm = new AlarmVO();
				alarm.setEmpNo(recipientEmpNo);
				alarm.setComNo(comNo);
				alarm.setAlarmComncode("["+empNm+"]님이 [부서일정]을 수정하였습니다.");
				alarm.setAlarmChk("N");
				alarm.setAlarmDate(LocalDateTime.now());
				alarm.setAlarmHeader("일정관리 - 캘린더");
				alarm.setAlarmCode(6);
				alarm.setAlarmLink("gw/todoList/calendar.do");
				alarmService.createAlarm(alarm);

				String notificationMessage = alarm.getAlarmComncode();
				notificationWebSocketHandler.sendNotification(recipientEmpNo, notificationMessage);

		}
		mapper.updateTodoList(todo);
	}

	@Override
	public List<TodoListVO> retrieveoneTodayTodo(int empNo) {
		return mapper.todayoneTodoList(empNo);
	}

	@Override
	public List<TodoListVO> retrieveoneTodayDepTodo(int empDep) {
		return mapper.todayoneDepTodoList(empDep);
	}

	@Override
	public List<TodoListVO> retrieveoneTodayComTodo(int comNo) {
		return mapper.todayoneComTodoList(comNo);
	}

}
