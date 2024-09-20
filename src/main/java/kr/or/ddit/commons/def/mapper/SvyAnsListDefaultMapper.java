package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.SvyAnsListDefaultVO;

@Mapper
public interface SvyAnsListDefaultMapper {
    int deleteByPrimaryKey(@Param("svyNo") Long svyNo, @Param("svyAnsNo") Long svyAnsNo, @Param("clsNo") Long clsNo);

    int insert(SvyAnsListDefaultVO row);

    List<SvyAnsListDefaultVO> selectAll();
}