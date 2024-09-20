package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.SvyAskDefaultVO;

@Mapper
public interface SvyAskDefaultMapper {
    int deleteByPrimaryKey(@Param("svyAskNo") Long svyAskNo, @Param("svyNo") Long svyNo);

    int insert(SvyAskDefaultVO row);

    SvyAskDefaultVO selectByPrimaryKey(@Param("svyAskNo") Long svyAskNo, @Param("svyNo") Long svyNo);

    List<SvyAskDefaultVO> selectAll();

    int updateByPrimaryKey(SvyAskDefaultVO row);
}