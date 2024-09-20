package kr.or.ddit.groupware.todolist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.TodoListCateGoryVO;
import kr.or.ddit.vo.TodoListVO;

@Mapper
public interface TodoListMapper {


	/**
	 * 새 일정 등록
	 * @param todoNo
	 * @return
	 */
	public Integer insertTodoList(TodoListVO todo);

	/**
	 * 오늘 개인 일정
	 * @param empNo
	 * @return
	 */
	public List<TodoListVO> todayTodoList(int empNo);

	/**
	 * 오늘 부서일정
	 * @param empDep
	 * @return
	 */
	public List<TodoListVO> todayDepTodoList(int empDep);

	/**
	 * 오늘 기업일정
	 * @param comNo
	 * @return
	 */
	public List<TodoListVO> todayComTodoList(int comNo);


	/**
	 * 오늘 개인 일정
	 * @param empNo
	 * @return
	 */
	public List<TodoListVO> todayoneTodoList(int empNo);

	/**
	 * 오늘 부서일정
	 * @param empDep
	 * @return
	 */
	public List<TodoListVO> todayoneDepTodoList(int empDep);

	/**
	 * 오늘 기업일정
	 * @param comNo
	 * @return
	 */
	public List<TodoListVO> todayoneComTodoList(int comNo);


	/**
	 * 개인 일정 등록
	 * @param todo
	 * @return
	 */
	public int insertEmpTodo(TodoListVO todo);

	/**
	 * 부서 일정 등록
	 * @param todo
	 * @return
	 */
	public int insertDetTodo(TodoListVO todo);

	/**
	 * 기업 일정 등록
	 * @param todo
	 * @return
	 */
	public int insertCompanyTodo(TodoListVO todo);

	/**
	 * 특정 일정 조회
	 * @param todoNo 조회할 일정 번호
	 * @return
	 */
	public TodoListVO selectTodo(@Param("todoNo") int todoNo, @Param("empNo") int empNo);


	/**
	 * 부서 상세조회
	 * @param todoNo
	 * @param empNo
	 * @return
	 */
	public TodoListVO selectDepTodo(@Param("todoNo") int todoNo, @Param("empNo") int empNo);

	public TodoListVO selectDepTodoDetail(int todoNo);

	/**
	 * todoList 전체 목록 조회
	 * @return
	 */
	public List<TodoListVO> selectTodoList();


	/**
	 * 일정 수정
	 * @param todo
	 * @return
	 */
	public int updateTodoList(TodoListVO todo);

	/**
	 * 기업일정 수정
	 * @param todo
	 * @return
	 */
	public int updateComTodoList(TodoListVO todo);

	/**
	 * 상태 수정
	 * @param todo
	 * @return
	 */
	public int updateState(@Param("todoNo") int todoNo, @Param("newState") String newState);

	/**
	 * 일정 삭제
	 * @param todoNo
	 * @return
	 */
	public int deleteTodoList(@Param("todoNo") int todoNo);


	/**
	 * 개인 일정 리스트 출력 (카테고리 별)
	 * @param empNo
	 * @param todocateNo
	 * @return
	 */
	public TodoListVO selectempTodoCate(@Param("empNo") int empNo, @Param("todocateNo") int todocateNo);


	/**
	 * 개인 일정 전체 리스트
	 * @param empNo
	 * @return
	 */
	public List<TodoListVO> selectempTodo(int empNo);
	/**
	 * 개인 일정 전체 리스트
	 * @param empNo
	 * @return
	 */
	public List<TodoListCateGoryVO> selectCateEmpTodo(int empNo);


	/**
	 * 한 직원의 카테고리 title 리스트
	 * @param empNo
	 * @return
	 */
	public TodoListVO selecttodoCateList(int empNo);



	/**
	 * 그룹웨어 관리자*직원)) 한 회사의 기업 일정 전체 리스트
	 * @param comNm
	 * @return
	 */
	public  List<TodoListVO> selectComTodoList(int comNo);


	/**
	 * 부서 별 일정 전체 리스트
	 * @param empDep
	 * @return
	 */
	public List<TodoListVO> selectDepTodoList(int empDep);


	/**
	 * 한 기업의 일정 상세조회
	 * @param comNm
	 * @param todoNo
	 * @return
	 */
	public TodoListVO selectComTodo(@Param("todoNo")int todoNo ,@Param("comNo") int comNo);


	public int deleteComTodoList(int todoNo);



}
