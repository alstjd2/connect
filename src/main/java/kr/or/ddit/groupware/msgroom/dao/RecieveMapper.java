package kr.or.ddit.groupware.msgroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.RecieveVO;

@Mapper
public interface RecieveMapper {
    int deleteRecieve(@Param("recvNo") int recvNo, @Param("msglogNo") int msglogNo, @Param("msgrmNo") int msgrmNo);

    int insertRecieve(RecieveVO row);

    RecieveVO selectRecieve(@Param("recvNo") int recvNo, @Param("msglogNo") int msglogNo, @Param("msgrmNo") int msgrmNo);

    List<RecieveVO> selectAll();

    int updateRecieve(RecieveVO row);
}