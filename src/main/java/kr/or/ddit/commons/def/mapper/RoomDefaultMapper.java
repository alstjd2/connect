package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.RoomDefaultVO;

@Mapper
public interface RoomDefaultMapper {
    int deleteByPrimaryKey(@Param("roomNo") Long roomNo, @Param("comNo") Long comNo);

    int insert(RoomDefaultVO row);

    RoomDefaultVO selectByPrimaryKey(@Param("roomNo") Long roomNo, @Param("comNo") Long comNo);

    List<RoomDefaultVO> selectAll();

    int updateByPrimaryKey(RoomDefaultVO row);
}