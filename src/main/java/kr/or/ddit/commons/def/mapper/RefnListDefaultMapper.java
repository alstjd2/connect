package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.RefnListDefaultVO;

@Mapper
public interface RefnListDefaultMapper {
    int deleteByPrimaryKey(Long buyNo);

    int insert(RefnListDefaultVO row);

    RefnListDefaultVO selectByPrimaryKey(Long buyNo);

    List<RefnListDefaultVO> selectAll();

    int updateByPrimaryKey(RefnListDefaultVO row);
}