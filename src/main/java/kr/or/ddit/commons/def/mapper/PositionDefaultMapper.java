package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.PositionDefaultVO;

@Mapper
public interface PositionDefaultMapper {
    int deleteByPrimaryKey(Long posNo);

    int insert(PositionDefaultVO row);

    PositionDefaultVO selectByPrimaryKey(Long posNo);

    List<PositionDefaultVO> selectAll();

    int updateByPrimaryKey(PositionDefaultVO row);
}