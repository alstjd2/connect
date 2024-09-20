package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.GrbAttentionDefaultVO;

@Mapper
public interface GrbAttentionDefaultMapper {
    int deleteByPrimaryKey(Long grbAttentionNo);

    int insert(GrbAttentionDefaultVO row);

    GrbAttentionDefaultVO selectByPrimaryKey(Long grbAttentionNo);

    List<GrbAttentionDefaultVO> selectAll();

    int updateByPrimaryKey(GrbAttentionDefaultVO row);
}