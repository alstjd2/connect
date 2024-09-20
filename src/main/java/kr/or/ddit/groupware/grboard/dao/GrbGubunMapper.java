package kr.or.ddit.groupware.grboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.NonVO;

@Mapper
public interface GrbGubunMapper {
    
    /** 새글 등록
     * @param gubunVO
     * @return
     */
    public Integer insertGrbGubun(GrbGubunVO gubun);

    public List<GrbGubunVO> selectGrbGubunList();

    public GrbGubunVO selectGrbGubun(int grbGubunNo);

    public int updateGrbGubun(GrbGubunVO gubun);
    
    public int deleteGrbGubun(GrbGubunVO gubun);
    public void insertGrbGubun(Map<String, Object> params);
    
    public void selectGrbGubunBoardCount(Map<String, Object> params);
    
	public List<GrbGubunVO> selectGrbGubunBoardList(PaginationInfo paging);
	
	public int countGubun(PaginationInfo paging);
	
	public List<GrbGubunVO> getGubunListByComNo(int comNo);
	
	public List<GrbGubunVO> selectGubunByComNo(int comNo);

	public List<GrbGubunVO> retrieveGrbGubunDetail(int grbGubunNo);
	
	public int updateGrbGubunDelynToY(Map<String, Object> params);
	

	
}