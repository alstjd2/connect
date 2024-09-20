package kr.or.ddit.groupware.grboard.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.GrbReplyVO;

public interface GrbReplyService {
	public List<GrbReplyVO> retrieveGrb(int grbNo) throws PkNotFoundException;
	public int createGrbReply(GrbReplyVO reply);
	public List<GrbGubunVO> retrieveGrbGubunByComNo(int comNo);
	public AtchFileDetailVO download(int atchFileId, int fileSn);
	public void removeGrbReply(Map<String, Object> params);
}
