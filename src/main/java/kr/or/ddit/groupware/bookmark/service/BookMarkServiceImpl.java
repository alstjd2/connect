package kr.or.ddit.groupware.bookmark.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.bookmark.dao.BookMarkMapper;
import kr.or.ddit.vo.BookMarkVO;

@Service
public class BookMarkServiceImpl implements BookMarkService {
	@Autowired
	private BookMarkMapper mapper;

	@Override
	public BookMarkVO retrieveBookMark(Integer markNo) throws PkNotFoundException {
		BookMarkVO bookmark = mapper.selectBookMark(markNo);
		if(bookmark==null)
			throw new PkNotFoundException(markNo);
		return bookmark;
	}

	@Override
	public List<BookMarkVO> retrieveBookMarkList(PaginationInfo paging) {		
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectBookMarkList(paging);
	}

	@Override
	public int createBookMark(Map<String, Object> params) {

	    mapper.insertBookMark(params);
	    
	    Integer markNo = (Integer) params.get("markNo");
	    
	    if (markNo == null) {
	        System.out.println("params에서 markNo를 찾을 수 없습니다.");
	    } else {
	        System.out.println("params에서 가져온 markNo: " + markNo);
	    }
	    
	    return markNo != null ? markNo : 1; 
	}


	@Override
	public boolean removeBookMark(int markNo) {
		int ok = mapper.deleteBookMark(markNo);
	    return ok > 0;
		
	}

	

}
