package kr.or.ddit.commons.def.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.ErrBoardDefaultVO;

@Mapper
public interface ErrBoardDefaultMapper {
    int deleteByPrimaryKey(@Param("errNo") BigDecimal errNo, @Param("memNo") BigDecimal memNo);

    int insert(ErrBoardDefaultVO row);

    ErrBoardDefaultVO selectByPrimaryKey(@Param("errNo") BigDecimal errNo, @Param("memNo") BigDecimal memNo);

    List<ErrBoardDefaultVO> selectAll();

    int updateByPrimaryKey(ErrBoardDefaultVO row);
}