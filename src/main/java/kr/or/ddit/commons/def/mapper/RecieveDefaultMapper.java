package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.RecieveDefaultVO;

@Mapper
public interface RecieveDefaultMapper {
    int deleteByPrimaryKey(@Param("recvNo") Long recvNo, @Param("msglogNo") Long msglogNo, @Param("msgrmNo") Long msgrmNo);

    int insert(RecieveDefaultVO row);

    RecieveDefaultVO selectByPrimaryKey(@Param("recvNo") Long recvNo, @Param("msglogNo") Long msglogNo, @Param("msgrmNo") Long msgrmNo);

    List<RecieveDefaultVO> selectAll();

    int updateByPrimaryKey(RecieveDefaultVO row);
}