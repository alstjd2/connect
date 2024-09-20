package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.BookmarkDefaultVO;

@Mapper
public interface BookmarkDefaultMapper {
    int deleteByPrimaryKey(Long markNo);

    int insert(BookmarkDefaultVO row);

    BookmarkDefaultVO selectByPrimaryKey(Long markNo);

    List<BookmarkDefaultVO> selectAll();

    int updateByPrimaryKey(BookmarkDefaultVO row);
}