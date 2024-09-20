package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.TodolistCategoryDefaultVO;

@Mapper
public interface TodolistCategoryDefaultMapper {
    int deleteByPrimaryKey(Long todocateNo);

    int insert(TodolistCategoryDefaultVO row);

    TodolistCategoryDefaultVO selectByPrimaryKey(Long todocateNo);

    List<TodolistCategoryDefaultVO> selectAll();

    int updateByPrimaryKey(TodolistCategoryDefaultVO row);
}