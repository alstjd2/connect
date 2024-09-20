package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.GrboardDefaultVO;

@Mapper
public interface GrboardDefaultMapper {
    int deleteByPrimaryKey(Long grbNo);

    int insert(GrboardDefaultVO row);

    GrboardDefaultVO selectByPrimaryKey(Long grbNo);

    List<GrboardDefaultVO> selectAll();

    int updateByPrimaryKey(GrboardDefaultVO row);
}