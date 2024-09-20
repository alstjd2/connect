package kr.or.ddit.groupware.todolist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.todolist.dao.TodoListCateGoryMapper;
import kr.or.ddit.vo.TodoListCateGoryVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TodoListCateGoryServiceImpl implements TodoListCateGoryService {

	private final TodoListCateGoryMapper mapper;

	/**
	 * 개인 카테고리 등록
	 */
	@Override
	public void createEmpTodoCate(TodoListCateGoryVO todocate) {

		mapper.insertTodoCate(todocate);
	}

	@Override
	public List<TodoListCateGoryVO> empRetriveCateList(int empNo) {
		return mapper.selectEmpTodoCateList(empNo);
	}

	@Override
	public TodoListCateGoryVO selectTodoCate(int todocateNo) {
		return mapper.selectTodoCate(todocateNo);
	}

	@Override
	public void updateTodoCate(TodoListCateGoryVO todocate) {
		mapper.updateTodoCate(todocate);
	}

	@Override
	public void removeTodoCate(int todocateNo) {
			
		mapper.deleteTodoCate(todocateNo);
	}
	

}
