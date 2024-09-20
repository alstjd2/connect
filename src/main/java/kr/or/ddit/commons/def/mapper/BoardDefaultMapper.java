package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.BoardDefaultVO;

@Mapper
public interface BoardDefaultMapper {
    int deleteByPrimaryKey(@Param("boardNo") Long boardNo, @Param("memNo") Long memNo);

    int insert(BoardDefaultVO row);

    BoardDefaultVO selectByPrimaryKey(@Param("boardNo") Long boardNo, @Param("memNo") Long memNo);

    List<BoardDefaultVO> selectAll();

    int updateByPrimaryKey(BoardDefaultVO row);
}