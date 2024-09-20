package kr.or.ddit.groupware.grbattention.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.BookMarkVO;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbAttentionVO;

@Mapper
public interface GrbAttentionMapper {
	public int insertGrbAttetion(Map<String, Object> params);
	public List<GrbAttentionVO> selectGrbAttetionList();
	public GrbAttentionVO selectGrbAttetion(int grbAttentionNo);
    public int updateGrbAttetion(Map<String, Object> params);
	public int selectTotalRecord(PaginationInfo paging);
	public int deleteGrbAttetion(Map<String, Object> params);
	public int checkGrbAttention(Map<String, Object> params);
	public void deleteGrbAttetion(GrbAttentionVO grbAttention);
	
	
	
	public List<GrBoardVO> selectAttentionList(PaginationInfo paging);
	public int AttentionCount(Map<String, Object> params);
	public void deleteGrbMark(Map<String, Object> params);
	
}