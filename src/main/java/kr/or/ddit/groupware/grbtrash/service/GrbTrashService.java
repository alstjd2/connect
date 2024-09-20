package kr.or.ddit.groupware.grbtrash.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbAttentionVO;

public interface GrbTrashService {

	public void insertGrbTrash(Map<String, Object> params);
	public void restoreFromTrash(Map<String, Object> params);
	public void permanentDelete(Map<String, Object> params);
	public void permanentDeleteGrboard(Map<String, Object> params);
	public void permanentDeleteReply(Map<String, Object> params);
	public boolean isTrashMarked(Map<String, Object> params);
	}
