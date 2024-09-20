package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.SvyDefaultVO;

@Mapper
public interface SvyDefaultMapper {
    int deleteByPrimaryKey(Long svyNo);

    int insert(SvyDefaultVO row);

    SvyDefaultVO selectByPrimaryKey(Long svyNo);

    List<SvyDefaultVO> selectAll();

    int updateByPrimaryKey(SvyDefaultVO row);
}