package kr.or.ddit.groupware.todolist.service;


import java.util.List;

import kr.or.ddit.vo.TodoListCateGoryDetailVO;
import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.TodoListVO;

/**
 * todoList를 위한 Business Logic Object interface
 *
 */
public interface TodoListService {


	/**
	 * 테스트용 리스트
	 * @return
	 */
	public List<TodoListVO> todolist();


	/**
	 * 개인 일정 리스트 출력 (카테고리 별)
	 * @param empNo
	 * @param todocateNo
	 * @return
	 */
	public TodoListVO empRetriveTodoCate(int empNo, int todocateNo);

	/**
	 * 개인 일정 전체 리스트 조회
	 * @param empNo
	 * @return
	 */
	public List<TodoListVO> empRetriveList(int empNo);

	/**
	 * 개인 일정 카테고리 별 리스트 조회
	 * @param empNo
	 * @return
	 */
	public List<TodoListCateGoryVO> empCateRetriveList(int empNo);

	/**
	 * 기업 일정 전체리스트 조회
	 * @param comNm
	 * @return
	 */
	public  List<TodoListVO> comRetriveList(int comNo);

	public List<TodoListVO> depRetriveList(int empDep);

	/**
	 * 개인 카테고리 title 리스트 조회
	 * @param empNo
	 * @return
	 */
	public TodoListVO empRetriveCateList(int empNo);

	/**
	 * 신규 일정 생성
	 * @param todo
	 */
	public void createTodoList(TodoListVO todo);




	/**
	 * 개인 일정 작성
	 * @param todo
	 */
	public void createEmpTodo(TodoListVO todo);

	/**
	 * 부서일정작성
	 * @param todo
	 */
	public void createDetTodo(TodoListVO todo);

	/**
	 * 오늘 개인 일정
	 * @param empNo
	 * @return
	 */
	public List<TodoListVO> retrieveTodayTodo(int empNo);

	/**
	 * 오늘 부서일정
	 * @param empDep
	 * @return
	 */
	public List<TodoListVO> retrieveTodayDepTodo(int empDep);

	/**
	 * 오늘 기업일정
	 * @param comNo
	 * @return
	 */
	public List<TodoListVO> retrieveTodayComTodo(int comNo);


	/**
	 * 오늘 개인 일정
	 * @param empNo
	 * @return
	 */
	public List<TodoListVO> retrieveoneTodayTodo(int empNo);

	/**
	 * 오늘 부서일정
	 * @param empDep
	 * @return
	 */
	public List<TodoListVO> retrieveoneTodayDepTodo(int empDep);

	/**
	 * 오늘 기업일정
	 * @param comNo
	 * @return
	 */
	public List<TodoListVO> retrieveoneTodayComTodo(int comNo);



	/**
	 * 기업 일정 작성
	 * @param todo
	 */
	public void createCompanyTodo(TodoListVO todo);

	/**
	 * 특정 일정 조회
	 * @param todoNo
	 * @return
	 */
	public TodoListVO readTodoList(int todoNo, int empNo);

	/**
	 * 특정 일정 조회
	 * @param todoNo
	 * @return
	 */
	public TodoListVO readComTodoList(int todoNo, int comNo);

	public void modifyState(int todoNo,  String newState);

	public TodoListVO readDepTodo(int todoNo);

	public void modifyDepTodo(TodoListVO todo);

	/**
	 * 특정 일정 수정
	 * @param todo
	 * @return
	 */
	public void modifyTodoList(TodoListVO todo);

	/**
	 * 기업일정 수정
	 * @param todo
	 */
	public void modifyComTodoList(TodoListVO todo);

	/**
	 * 일정 삭제
	 * @param todoNo
	 */
	public void removeTodoList(int todoNo);

	public void removeDepTodoList(int todoNo);

}
