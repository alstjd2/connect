package kr.or.ddit.groupware.grboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.NonVO;

public interface GrbService {
	public GrBoardVO retrieveGrb(int grbNo) throws PkNotFoundException;
	public void createGr(GrBoardVO board);
	public void modifyGr(GrBoardVO grb);
	public GrBoardVO removeGr(Integer GrNo);
	public List<GrBoardVO> retrieveGrList();
	public List<GrBoardVO> retrieveGrPagingList(PaginationInfo paging);
	public List<GrBoardVO> retrieveGrIndexList(PaginationInfo paging);
	public List<GrBoardVO> retrieveGrbAttentionPagingList(PaginationInfo paging);
	public List<GrBoardVO> retrieveGrbMyPostPagingList(PaginationInfo paging);
	public List<GrBoardVO> retrieveGrbImpPagingList(PaginationInfo paging);
	public List<GrBoardVO> retrieveGrbTrashPagingList(PaginationInfo paging);
	public List<GrBoardVO> retrieveGrbGubunPagingList(PaginationInfo paging);
	
	public List<GrbGubunVO> retrieveGrbGubunByComNo(int comNo);
	public AtchFileDetailVO download(int atchFileId, int fileSn);
	
	public void insertNotAtchGrboard(GrBoardVO grb);
	
	public void updateNotAttchFile(GrBoardVO grb);
	
}
