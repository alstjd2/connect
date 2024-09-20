package kr.or.ddit.web.non.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.NonVO;

@Mapper
public interface NonMapper {
    public Integer insertNon(NonVO non);
    public Integer insertNotAtchNon(NonVO non);
    public NonVO selectNon (int nonNo);
    public List<NonVO> selectNonList();
    public int updateNon(NonVO non);
    public int deleteNon(int nonNo);
    public int updateNonStatus(Integer nonNo, String nonStatus);
    public List<NonVO> selectBoardListPaging(PaginationInfo paging);
	public int selectTotalRecord(PaginationInfo paging);
	public int selectTotalRecordTR(PaginationInfo paging);
	public void updateNonStatus(Map<String, Object> params);
	
	
}