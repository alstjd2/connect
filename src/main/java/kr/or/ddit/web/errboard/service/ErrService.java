package kr.or.ddit.web.errboard.service;

import java.util.List;

import java.util.Map;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.ErrAdminVO;
import kr.or.ddit.vo.ErrBoardVO;

public interface ErrService {
	public ErrBoardVO retrieveErr(Integer errNo) throws PkNotFoundException;
	public void createErr(ErrBoardVO err);
	public void createNotAtchErr(ErrBoardVO err);
	public void modifyErr(ErrBoardVO err);
	public ErrBoardVO removeErr(Integer errNo);
	public List<ErrBoardVO> retrieveErrList();
	public void updateErrStatus(Map<String, Object> params);
	public List<ErrBoardVO> retrieveErrPagingList(PaginationInfo paging);
	
	public void createErrStatus(Map<String, Object> params);
	public List<ErrBoardVO> getErrBoardWithAdmin(Integer errNo);
	public AtchFileDetailVO download(int atchFileId, int fileSn);
	
	public List<ErrBoardVO> retrieveErrAdminPagingList(PaginationInfo paging);
	
	
}
