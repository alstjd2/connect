package kr.or.ddit.groupware.grboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.GrbReplyVO;

@Mapper
public interface GrbReplyMapper {
    
    /** 새글 등록
     * @param gubunVO
     * @return
     */
    public Integer insertGrbReply(GrbReplyVO reply);
    
//    public Integer insertGrbGubun(GrbGubunVO gubun);
//
    public List<GrbReplyVO> selectGrbReplyList(int grbNo);

    public int updateGrbReplyDelynToY(Map<String, Object> params);
    
    public int deleteReply(Map<String, Object> params);
//
//    public int updateGrbGubun(GrbGubunVO gubun);
//    
//    public int deleteGrbGubun(GrbGubunVO gubun);
//    public void insertGrbGubun(Map<String, Object> params);
//    
//	public List<GrbGubunVO> selectGrbGubunBoardList(PaginationInfo paging);
//	public int countGubun(PaginationInfo paging);
//	
//	public List<GrbGubunVO> getGubunListByComNo(int comNo);
//	
//	public List<GrbGubunVO> selectGubunByComNo(int comNo);
	

}