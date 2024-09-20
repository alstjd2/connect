package kr.or.ddit.groupware.bookmark.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BookMarkVO;

public interface BookMarkService {
	/**
	 * 즐겨찾기 상세 조회
	 * @param markNo 조회할 즐겨찾기의 PK
	 * @return 존재하지 않는다면, {@link PkNotFoundException}
	 */
	public BookMarkVO retrieveBookMark(Integer markNo) throws PkNotFoundException;
	public List<BookMarkVO> retrieveBookMarkList(PaginationInfo paging);
	public int createBookMark(Map<String, Object> params);
	public boolean removeBookMark(int markNo);

}
