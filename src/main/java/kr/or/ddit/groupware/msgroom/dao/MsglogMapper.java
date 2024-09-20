package kr.or.ddit.groupware.msgroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.MsglogVO;

@Mapper
public interface MsglogMapper {
    int deleteMsglog(@Param("msglogNo") int msglogNo, @Param("msgrmNo") int msgrmNo);

    int insertMsglog(MsglogVO row);

    MsglogVO selectMsglog(@Param("msglogNo") int msglogNo, @Param("msgrmNo") int msgrmNo);

    List<MsglogVO> selectAll();

    int updateMsglog(MsglogVO row);
}