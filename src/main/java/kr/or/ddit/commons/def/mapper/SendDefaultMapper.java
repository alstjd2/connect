package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.SendDefaultVO;

@Mapper
public interface SendDefaultMapper {
    int deleteByPrimaryKey(@Param("sendNo") Long sendNo, @Param("msglogNo") Long msglogNo, @Param("msgrmNo") Long msgrmNo);

    int insert(SendDefaultVO row);

    SendDefaultVO selectByPrimaryKey(@Param("sendNo") Long sendNo, @Param("msglogNo") Long msglogNo, @Param("msgrmNo") Long msgrmNo);

    List<SendDefaultVO> selectAll();

    int updateByPrimaryKey(SendDefaultVO row);
}