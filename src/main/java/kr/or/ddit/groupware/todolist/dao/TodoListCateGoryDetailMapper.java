package kr.or.ddit.groupware.todolist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.TodoListCateGoryDetailVO;

@Mapper
public interface TodoListCateGoryDetailMapper {
	//TodoListCateGoryDetail ->  TodoCateDetail 줄임
	
	
	/**
	 * 카테고리 상세 추가
	 * @param todocateDetail
	 * @return
	 */
	public int insertTodoCateDetail(TodoListCateGoryDetailVO todocateDetail);
	
	/**
	 * 특정 카테고리 조회
	 * @param tdcatedNo
	 * @return
	 */
	public TodoListCateGoryDetailVO selectTodoCateDetail(int tdcatedNo);
	
	/**
	 * 카테고리상세 전체 조회
	 * @return
	 */
	public List<TodoListCateGoryDetailVO> selectTodoCateDetailList();
	
	/**
	 * 카테고리 상세 수정
	 * @param todocateDetail
	 * @return
	 */
	public int updateTodoCateDetail(TodoListCateGoryDetailVO todocateDetail);
	
	/**
	 * 카테고리상세 삭제
	 * @param tdcatedNo
	 * @return
	 */
	public int deleteTodoCateDetail(int tdcatedNo);
	
	
	/**
	 * 직원별 카테고리 상세
	 * @return
	 */
	public TodoListCateGoryDetailVO empTodoCateDetail(int empNo);
}
