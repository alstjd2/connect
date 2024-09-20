package kr.or.ddit.web.early.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EarlyVO;

@Mapper
public interface EarlyMapper {

   public Integer insertEarly(EarlyVO ealry);
   public EarlyVO selectEarly(int earlyNo);
   public List<EarlyVO> selectEarlyList();
   public int updateEarly(EarlyVO ealry);
   public int deleteEarly(int earlyNo);
   public List<EarlyVO> selectEarlyBoardListPaging(PaginationInfo paging);
	public int selectTotalRecord(PaginationInfo paging);
	public int selectTotalRecordTR(PaginationInfo paging);
	public void updateEarlyStatus(Map<String, Object> params);
}