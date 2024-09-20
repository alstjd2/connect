package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ComdcmFormDefaultVO;

@Mapper
public interface ComdcmFormDefaultMapper {
    int deleteByPrimaryKey(Long dcmFormNo);

    int insert(ComdcmFormDefaultVO row);

    ComdcmFormDefaultVO selectByPrimaryKey(Long dcmFormNo);

    List<ComdcmFormDefaultVO> selectAll();

    int updateByPrimaryKey(ComdcmFormDefaultVO row);
}