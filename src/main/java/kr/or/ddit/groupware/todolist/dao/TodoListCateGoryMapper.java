package kr.or.ddit.groupware.todolist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.TodoListCateGoryVO;

@Mapper
public interface TodoListCateGoryMapper { // todolistcategory -> todocate로 줄임


	/**
	 * 새 카테고리 등록
	 * @param todocate
	 * @return
	 */
	public int insertTodoCate(TodoListCateGoryVO todocate);

	/**
	 * 특정 카테고리 조회
	 * @param todocateNo
	 * @return
	 */
	public TodoListCateGoryVO selectTodoCate(int todocateNo);


	/**
	 *  특정 사람의 카테고리 리스트 조회
	 * @param empNo
	 * @return
	 */
	public List<TodoListCateGoryVO> selectEmpTodoCateList(int empNo);

	/**
	 * todoList category 전체 리스트 조회
	 * @return
	 */
	public List<TodoListCateGoryVO> selectTodoCateList();

	/**
	 * 개인일정 todolist category
	 * todolist 카테고리 업데이트
	 * @param todocate
	 * @return
	 */
	public int updateTodoCate(TodoListCateGoryVO todocate);

	/**
	 * 개인일정 todolist category
	 * todolist 카테고리 삭제
	 * @param todocateNo
	 * @return
	 */
	public int deleteTodoCate(int todocateNo);

}
