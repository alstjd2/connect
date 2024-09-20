package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.AlaramDefaultVO;

@Mapper
public interface AlaramDefaultMapper {
    int deleteByPrimaryKey(Long alaramNo);

    int insert(AlaramDefaultVO row);

    AlaramDefaultVO selectByPrimaryKey(Long alaramNo);

    List<AlaramDefaultVO> selectAll();

    int updateByPrimaryKey(AlaramDefaultVO row);
}