package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ProdListDefaultVO;

@Mapper
public interface ProdListDefaultMapper {
    int deleteByPrimaryKey(Long prodNo);

    int insert(ProdListDefaultVO row);

    ProdListDefaultVO selectByPrimaryKey(Long prodNo);

    List<ProdListDefaultVO> selectAll();

    int updateByPrimaryKey(ProdListDefaultVO row);
}