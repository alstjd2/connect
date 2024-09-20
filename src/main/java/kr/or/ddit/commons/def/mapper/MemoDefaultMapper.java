package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.MemoDefaultVO;

@Mapper
public interface MemoDefaultMapper {
    int deleteByPrimaryKey(Long memoNo);

    int insert(MemoDefaultVO row);

    MemoDefaultVO selectByPrimaryKey(Long memoNo);

    List<MemoDefaultVO> selectAll();

    int updateByPrimaryKey(MemoDefaultVO row);
}