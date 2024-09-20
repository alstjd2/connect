package kr.or.ddit.commons.def.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.NonDefaultVO;

@Mapper
public interface NonDefaultMapper {
    int deleteByPrimaryKey(BigDecimal nonNo);

    int insert(NonDefaultVO row);

    NonDefaultVO selectByPrimaryKey(BigDecimal nonNo);

    List<NonDefaultVO> selectAll();

    int updateByPrimaryKey(NonDefaultVO row);
}