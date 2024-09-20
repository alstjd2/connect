package kr.or.ddit.groupware.grboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;

public interface GrbGubunService {
	public List<GrbGubunVO> retrieveGrbGubunPagingList(PaginationInfo paging);
	public void insertGrbGubun(Map<String, Object> params);
	public List<GrbGubunVO> getGubunListByComNo(int comNo);
	public GrbGubunVO retrieveGrbGubun(Integer grbGubunNo) throws PkNotFoundException;
	public void selectGrbGubunBoardCount(Map<String, Object> params);
	
	 public List<GrbGubunVO> retrieveGrbGubunDetail(int grbGubunNo);
	 
	 public void removeGrbGubun(Map<String, Object> params);
	
}
