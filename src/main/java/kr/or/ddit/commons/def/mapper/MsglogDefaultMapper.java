package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.MsglogDefaultVO;

@Mapper
public interface MsglogDefaultMapper {
    int deleteByPrimaryKey(@Param("msglogNo") Long msglogNo, @Param("msgrmNo") Long msgrmNo);

    int insert(MsglogDefaultVO row);

    MsglogDefaultVO selectByPrimaryKey(@Param("msglogNo") Long msglogNo, @Param("msgrmNo") Long msgrmNo);

    List<MsglogDefaultVO> selectAll();

    int updateByPrimaryKey(MsglogDefaultVO row);
}