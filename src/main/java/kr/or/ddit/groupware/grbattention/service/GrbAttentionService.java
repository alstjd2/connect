package kr.or.ddit.groupware.grbattention.service;

import java.util.List;

import java.util.Map;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbAttentionVO;

public interface GrbAttentionService {
	public GrBoardVO retrieveGrb(Integer grNo) throws PkNotFoundException;
	public void createGr(GrBoardVO grb);
	public void modifyGr(GrBoardVO grb);
	public List<GrbAttentionVO> retrieveGrbAttentionList();
	public List<GrBoardVO> retrieveGrPagingList(PaginationInfo paging);
	public void removeAttention(GrbAttentionVO grbAttention);
	public boolean isGrbMarked(Map<String, Object> params);

	
	public List<GrBoardVO> retrieveGrbAttentionPagingList(PaginationInfo paging);
	    /**
	     * 특정 게시글에 대한 북마크를 삭제하는 메서드.
	     *
	     * @param params grbNo와 empNo를 포함한 파라미터 맵.
	     */
	public  void deleteGrbMark(Map<String, Object> params);

	    /**
	     * 특정 게시글에 대한 북마크를 추가하는 메서드.
	     *
	     * @param params grbNo와 empNo를 포함한 파라미터 맵.
	     */
	    /**
	     * 특정 게시글에 대한 북마크 상태를 토글하는 메서드.
	     *
	     * @param params grbNo와 empNo를 포함한 파라미터 맵.
	     * @return 변경된 북마크 상태 (true: 추가됨, false: 제거됨).
	     */
	public  void modifyGrbMark(Map<String, Object> params);
	}
