package kr.or.ddit.groupware.adrgroup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdrGroupVO;
import kr.or.ddit.vo.BookMarkVO;

@Mapper
public interface AdrGroupMapper {
	public AdrGroupVO selectGroup(Integer grpNo);
	public List<AdrGroupVO> selectGroupList(PaginationInfo paging);
	public int insertGroup(AdrGroupVO group);
	public int updateGroup(AdrGroupVO group);
	public int deleteGroup(AdrGroupVO group);
	public int selectTotalRecord(PaginationInfo paging);

}
