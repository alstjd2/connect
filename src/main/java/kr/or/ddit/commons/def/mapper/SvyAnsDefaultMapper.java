package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.SvyAnsDefaultVO;

@Mapper
public interface SvyAnsDefaultMapper {
    int deleteByPrimaryKey(Long svyAnsNo);

    int insert(SvyAnsDefaultVO row);

    SvyAnsDefaultVO selectByPrimaryKey(Long svyAnsNo);

    List<SvyAnsDefaultVO> selectAll();

    int updateByPrimaryKey(SvyAnsDefaultVO row);
}