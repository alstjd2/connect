package kr.or.ddit.groupware.msgroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.MsglogVO;
import kr.or.ddit.vo.MsgroomVO;

@Mapper
public interface MsgroomMapper {
    public int deleteMsgroom(int msgrmNo);

    public int insertMsgroom(MsgroomVO row);

    public MsgroomVO selectMsgroom(int msgrmNo);

    public List<MsgroomVO> selectAllChatRooms(@Param("empNo") int empNo);

    public int updateMsgroom(MsgroomVO row);

	public List<MsglogVO> selectChatHistory(@Param("msgrmNo") int msgrmNo);

	public int insertMsgLog(MsglogVO msgLog);
}