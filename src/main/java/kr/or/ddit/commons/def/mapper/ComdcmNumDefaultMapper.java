package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ComdcmNumDefaultVO;

@Mapper
public interface ComdcmNumDefaultMapper {
    int deleteByPrimaryKey(Long comdcmNumNo);

    int insert(ComdcmNumDefaultVO row);

    ComdcmNumDefaultVO selectByPrimaryKey(Long comdcmNumNo);

    List<ComdcmNumDefaultVO> selectAll();

    int updateByPrimaryKey(ComdcmNumDefaultVO row);
}