package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.VacationInfoDefaultVO;

@Mapper
public interface VacationInfoDefaultMapper {
    int deleteByPrimaryKey(Long vaciNo);

    int insert(VacationInfoDefaultVO row);

    VacationInfoDefaultVO selectByPrimaryKey(Long vaciNo);

    List<VacationInfoDefaultVO> selectAll();

    int updateByPrimaryKey(VacationInfoDefaultVO row);
}