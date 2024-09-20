package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ChiDefaultVO;

@Mapper
public interface ChiDefaultMapper {
    int deleteByPrimaryKey(Long chiNo);

    int insert(ChiDefaultVO row);

    ChiDefaultVO selectByPrimaryKey(Long chiNo);

    List<ChiDefaultVO> selectAll();

    int updateByPrimaryKey(ChiDefaultVO row);
}