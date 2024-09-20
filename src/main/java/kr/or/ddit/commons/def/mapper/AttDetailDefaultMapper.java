package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.AttDetailDefaultVO;

@Mapper
public interface AttDetailDefaultMapper {
    int deleteByPrimaryKey(@Param("attdNo") Long attdNo, @Param("attNo") Long attNo);

    int insert(AttDetailDefaultVO row);

    AttDetailDefaultVO selectByPrimaryKey(@Param("attdNo") Long attdNo, @Param("attNo") Long attNo);

    List<AttDetailDefaultVO> selectAll();

    int updateByPrimaryKey(AttDetailDefaultVO row);
}