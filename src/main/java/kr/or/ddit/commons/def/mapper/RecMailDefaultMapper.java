package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.RecMailDefaultVO;

@Mapper
public interface RecMailDefaultMapper {
    int deleteByPrimaryKey(@Param("recNo") Long recNo, @Param("recMailNo") Long recMailNo);

    int insert(RecMailDefaultVO row);

    RecMailDefaultVO selectByPrimaryKey(@Param("recNo") Long recNo, @Param("recMailNo") Long recMailNo);

    List<RecMailDefaultVO> selectAll();

    int updateByPrimaryKey(RecMailDefaultVO row);
}