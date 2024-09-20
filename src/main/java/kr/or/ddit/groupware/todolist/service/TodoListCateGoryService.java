package kr.or.ddit.groupware.todolist.service;

import java.util.List;

import kr.or.ddit.vo.TodoListCateGoryVO;

/**
 * todoListCateGory
 * @author PC-09
 *
 */
public interface TodoListCateGoryService {


	/**
	 * 새 카테고리 등록
	 * @param todocate
	 * @return
	 */
	public void createEmpTodoCate(TodoListCateGoryVO todocate);


	/**
	 * @param empNo
	 * @return
	 */
	public List<TodoListCateGoryVO> empRetriveCateList(int empNo);

	/**
	 * 하나의 카테고리 조회
	 * @param todocate
	 * @return
	 */
	public TodoListCateGoryVO selectTodoCate(int  todocateNo);
	
	/**
	 * 카테고리 수정
	 * @param todocate
	 */
	public void updateTodoCate(TodoListCateGoryVO todocate);
	
	/**
	 * 하나의 카테고리 삭제
	 * @param todocateNo
	 */
	public void removeTodoCate(int todocateNo);
}
