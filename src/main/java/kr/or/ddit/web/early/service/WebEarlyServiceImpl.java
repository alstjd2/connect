package kr.or.ddit.web.early.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EarlyVO;
import kr.or.ddit.web.early.dao.EarlyMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WebEarlyServiceImpl implements WebEarlyService {
    
	@Autowired
	EarlyMapper mapper;
	
	@Override
	public EarlyVO retrieveWebEarly(Integer earlyNo) throws PkNotFoundException {
		return mapper.selectEarly(earlyNo);
	}

	@Override
	public List<EarlyVO> retrieveWebEarlyList() {
		return mapper.selectEarlyList();
	}

	@Override
	public void createWebEarly(EarlyVO early) {
		mapper.insertEarly(early);
	}

	@Override
	public void modifyWebEarly(EarlyVO early) {
		mapper.updateEarly(early);

	}

	@Override
	public EarlyVO removeWebEarly(Integer earlyNo) {
		return null;
	}

	@Override
	public List<EarlyVO> retrieveEarlyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EarlyVO> retrieveEarlyPagingList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectEarlyBoardListPaging(paging);
	}

	@Override
	public void updateEarlyStatus(Map<String, Object> params) {
		mapper.updateEarlyStatus(params);
	}
	

}
