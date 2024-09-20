package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.AbsenceDefaultVO;

@Mapper
public interface AbsenceDefaultMapper {
    int deleteByPrimaryKey(Long abNo);

    int insert(AbsenceDefaultVO row);

    AbsenceDefaultVO selectByPrimaryKey(Long abNo);

    List<AbsenceDefaultVO> selectAll();

    int updateByPrimaryKey(AbsenceDefaultVO row);
}