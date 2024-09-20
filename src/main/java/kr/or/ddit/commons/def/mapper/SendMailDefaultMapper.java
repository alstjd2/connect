package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.SendMailDefaultVO;

@Mapper
public interface SendMailDefaultMapper {
    int deleteByPrimaryKey(@Param("sendNo") Long sendNo, @Param("mailNo") Long mailNo);

    int insert(SendMailDefaultVO row);

    SendMailDefaultVO selectByPrimaryKey(@Param("sendNo") Long sendNo, @Param("mailNo") Long mailNo);

    List<SendMailDefaultVO> selectAll();

    int updateByPrimaryKey(SendMailDefaultVO row);
}