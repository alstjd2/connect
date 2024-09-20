package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.GrbGubunDefaultVO;

@Mapper
public interface GrbGubunDefaultMapper {
    int deleteByPrimaryKey(Long grbGubunNo);

    int insert(GrbGubunDefaultVO row);

    GrbGubunDefaultVO selectByPrimaryKey(Long grbGubunNo);

    List<GrbGubunDefaultVO> selectAll();

    int updateByPrimaryKey(GrbGubunDefaultVO row);
}