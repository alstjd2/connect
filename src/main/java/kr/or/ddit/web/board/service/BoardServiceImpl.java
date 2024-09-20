package kr.or.ddit.web.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.web.board.dao.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardServiceImpl implements BoardService {

    @Autowired
	BoardMapper mapper;

	@Override
	public BoardVO retrieveBoard(Integer boardNo) throws PkNotFoundException {
		return mapper.selectBoard(boardNo);
	}

	@Override
	public List<BoardVO> retrieveBoardList() {
		return mapper.selectBoardList();
	}

	@Override
	public void createBoard(BoardVO board) {
		mapper.insertBoard(board);
	}

	@Override
	public void modifyBoard(BoardVO board) {
		mapper.updateBoard(board);
	}

	@Override
	public BoardVO removeWebBoard(Integer boardNo) {
		return null;
	}


	@Override
	public List<BoardVO> retrieveBoardListByType(String boardType) {
		return mapper.selectBoardByType(boardType);
	}

	@Override
	public List<BoardVO> selectBoardByGuideType(String guideType) {
		return mapper.selectBoardByGuideType(guideType);
	}

	@Override
	public List<BoardVO> retrieveBoardListPaging(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectBoardListPaging(paging);
	}

	/**
	 * 프로바이더-이벤트 작성시
	 */
	@Override
	public void createBoard(BoardVO board, int memNo) {

		int no = mapper.insertBoard(board);
		log.info("-----no출력 해라 {}",no);



	}

}
