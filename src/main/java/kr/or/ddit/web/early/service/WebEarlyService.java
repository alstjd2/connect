package kr.or.ddit.web.early.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EarlyVO;

public interface WebEarlyService {
	public EarlyVO retrieveWebEarly(Integer earlyNo) throws PkNotFoundException;
	public List<EarlyVO> retrieveWebEarlyList();
	public void createWebEarly(EarlyVO early);
	public void modifyWebEarly(EarlyVO early);
	public EarlyVO removeWebEarly(Integer earlyNo);
	public List<EarlyVO> retrieveEarlyList();
	public List<EarlyVO> retrieveEarlyPagingList(PaginationInfo paging);
	public void updateEarlyStatus(Map<String, Object> params);

}
