package kr.or.ddit.web.non.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.NonVO;

public interface NonService {
	public NonVO retrieveNon(Integer nonNo ) throws PkNotFoundException;
	public void createNon(NonVO non);
	public void createNotAtchNon(NonVO non);
	public void modifyNon(NonVO non);
	public NonVO removeNon(Integer nonNo);
	public List<NonVO> retrieveNonList();
	public List<NonVO> retrieveBoardListPaging(PaginationInfo paging);
	public List<NonVO> retrieveBoardListByType(String boardType);
	public List<NonVO> selectBoardByGuideType(String guideType);
	
	public void updateNonStatus(Map<String, Object> params);
	public AtchFileDetailVO download(int atchFileId, int fileSn);
	
}

