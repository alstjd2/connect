package kr.or.ddit.groupware.grboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.grboard.dao.GrBoardMapper;
import kr.or.ddit.groupware.grboard.dao.GrbGubunMapper;
import kr.or.ddit.vo.GrbGubunVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GrbGubunServiceImpl implements GrbGubunService {
	
	@Autowired
	GrBoardMapper mapper;
	
	@Autowired
	GrbGubunMapper guMappber;

	@Override
	public List<GrbGubunVO> retrieveGrbGubunPagingList(PaginationInfo paging) {
		int totalRecord = guMappber.countGubun(paging);
		paging.setTotalRecord(totalRecord);
		return guMappber.selectGrbGubunBoardList(paging);
	}

	@Override
	public void insertGrbGubun(Map<String, Object> params) {
		guMappber.insertGrbGubun(params);
	}

	@Override
	public List<GrbGubunVO> getGubunListByComNo(int comNo) {
		return guMappber.getGubunListByComNo(comNo);
	}

	@Override
	public GrbGubunVO retrieveGrbGubun(Integer grbGubunNo) throws PkNotFoundException {
		
		return guMappber.selectGrbGubun(grbGubunNo);
	}

	@Override
	public void selectGrbGubunBoardCount(Map<String, Object> params) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GrbGubunVO> retrieveGrbGubunDetail(int grbGubunNo) {
	     
	        return guMappber.retrieveGrbGubunDetail(grbGubunNo);
	    }

	@Override
	public void removeGrbGubun(Map<String, Object> params) {
		guMappber.updateGrbGubunDelynToY(params);
	}
	}
