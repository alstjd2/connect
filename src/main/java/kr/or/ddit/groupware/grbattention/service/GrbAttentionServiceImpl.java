package kr.or.ddit.groupware.grbattention.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.grbattention.dao.GrbAttentionMapper;
import kr.or.ddit.groupware.grboard.dao.GrBoardMapper;
import kr.or.ddit.vo.ErrBoardVO;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbAttentionVO;
import kr.or.ddit.web.errboard.dao.ErrBoardMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GrbAttentionServiceImpl implements GrbAttentionService {
	
	@Autowired
	GrbAttentionMapper attentionMapper;
	
	@Autowired
	GrBoardMapper mapper;

	@Override
	public GrBoardVO retrieveGrb(Integer grNo) throws PkNotFoundException {
		return mapper.selectGrBoard(grNo);
	}

	@Override
	public void createGr(GrBoardVO grb) {
		
	}

	@Override
	public void modifyGr(GrBoardVO grb) {
		
	}

	@Override
	public List<GrbAttentionVO> retrieveGrbAttentionList() {

		return attentionMapper.selectGrbAttetionList();
	}

	@Override
	public List<GrBoardVO> retrieveGrPagingList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrBoardList(paging);
	}

	@Override
	public List<GrBoardVO> retrieveGrbAttentionPagingList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return attentionMapper.selectAttentionList(paging);
	}

	@Override
	public void modifyGrbMark(Map<String, Object> params) {
		attentionMapper.insertGrbAttetion(params);
		
	}

	@Override
	public void removeAttention(GrbAttentionVO grbAttention) {
		attentionMapper.deleteGrbAttetion(grbAttention);
		
	}
	 public boolean isGrbMarked(Map<String, Object> params) {
	        // grbNo와 empNo를 기반으로 데이터베이스에서 존재 여부를 확인
	        return attentionMapper.AttentionCount(params) > 0;
	    }

	    public void deleteGrbMark(Map<String, Object> params) {
	        // 즐겨찾기 정보 삭제
	    	attentionMapper.deleteGrbAttetion(params);
	    }

	

}

