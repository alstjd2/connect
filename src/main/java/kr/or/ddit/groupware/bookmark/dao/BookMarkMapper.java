package kr.or.ddit.groupware.bookmark.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BookMarkVO;

@Mapper
public interface BookMarkMapper {
	public BookMarkVO selectBookMark(Integer markNo);
	public List<BookMarkVO> selectBookMarkList(PaginationInfo paging);
	public int insertBookMark(Map<String, Object> params);
	public int deleteBookMark(Integer markNo);
	public int selectTotalRecord(PaginationInfo paging);
	
	

}
