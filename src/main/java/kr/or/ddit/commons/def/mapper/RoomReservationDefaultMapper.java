package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.RoomReservationDefaultVO;

@Mapper
public interface RoomReservationDefaultMapper {
    int deleteByPrimaryKey(@Param("todoNo") Long todoNo, @Param("roomNo") Long roomNo);

    int insert(RoomReservationDefaultVO row);

    List<RoomReservationDefaultVO> selectAll();
}