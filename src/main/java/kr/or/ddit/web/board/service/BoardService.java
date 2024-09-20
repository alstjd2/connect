package kr.or.ddit.web.board.service;

import java.util.List;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BoardVO;

public interface BoardService {
	public BoardVO retrieveBoard(Integer boardNo ) throws PkNotFoundException;
	public void createBoard(BoardVO board);
	public void createBoard(BoardVO board,int memNo);
	public void modifyBoard(BoardVO board);
	public BoardVO removeWebBoard(Integer boardNo);
	public List<BoardVO> retrieveBoardList();
	public List<BoardVO> retrieveBoardListPaging(PaginationInfo paging);
	public List<BoardVO> retrieveBoardListByType(String boardType);
	public List<BoardVO> selectBoardByGuideType(String guideType);

}
