package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.TodoListDefaultVO;

@Mapper
public interface TodoListDefaultMapper {
    int deleteByPrimaryKey(@Param("todoNo") Long todoNo, @Param("empNo") Long empNo);

    int insert(TodoListDefaultVO row);

    TodoListDefaultVO selectByPrimaryKey(@Param("todoNo") Long todoNo, @Param("empNo") Long empNo);

    List<TodoListDefaultVO> selectAll();

    int updateByPrimaryKey(TodoListDefaultVO row);
}