package kr.or.ddit.groupware.msgroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.SendVO;

@Mapper
public interface SendMapper {
    int deleteSend(@Param("sendNo") int sendNo, @Param("msglogNo") int msglogNo, @Param("msgrmNo") int msgrmNo);

    int insertSend(SendVO row);

    SendVO selectSend(@Param("sendNo") int sendNo, @Param("msglogNo") int msglogNo, @Param("msgrmNo") int msgrmNo);

    List<SendVO> selectAll();

    int updateSend(SendVO row);
}