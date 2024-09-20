package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.TodolistCategoryDetailDefaultVO;

@Mapper
public interface TodolistCategoryDetailDefaultMapper {
    int deleteByPrimaryKey(Long tdcatedNo);

    int insert(TodolistCategoryDetailDefaultVO row);

    TodolistCategoryDetailDefaultVO selectByPrimaryKey(Long tdcatedNo);

    List<TodolistCategoryDetailDefaultVO> selectAll();

    int updateByPrimaryKey(TodolistCategoryDetailDefaultVO row);
}