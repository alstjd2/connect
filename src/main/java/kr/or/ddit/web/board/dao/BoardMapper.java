package kr.or.ddit.web.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.BoardVO;


@Mapper
public interface BoardMapper {
	public int insertBoard(BoardVO board);
    public BoardVO selectBoard(@Param("boardNo") Integer boardNo);
    public List<BoardVO> selectBoardListPaging(PaginationInfo paging);
    public List<BoardVO> selectBoardList();
    public int updateBoard(BoardVO board);
    public int deleteBoard(@Param("boardNo") Integer boardNo, @Param("memNo") Integer memNo);
    public List<BoardVO> selectBoardByType(String boardType);
    public List<BoardVO> selectBoardByGuideType(String guideType);
	public int selectTotalRecord(PaginationInfo paging);
	public int selectTotalRecordTR(PaginationInfo paging);

	/**
	 * 공지사항+업데이트 게시글 목록 조회
	 * @return
	 */
	public List<BoardVO> selectNoticeAllList();

	/**
	 * 공지사항 / 업데이트 카테고리 하나만 게시글 목록 조회
	 * @param boardType
	 * @return
	 */
	public List<BoardVO> selectNoticeTypeList(String boardType);

	/**
	 * notice 게시판에서 디테일 조회
	 * @param boardNo
	 * @return
	 */
	public BoardVO selectNoticeDetail(int boardNo);

	/**
	 * index 페이지 오프라인 게시글 1개출력
	 * @return
	 */
	public BoardVO selectIndexOff();
	/**
	 * index 페이지 업데이트 게시글 1개출력
	 * @return
	 */
	public BoardVO selectIndexUpdate();
	/**
	 * index 페이지 할인행사 게시글 1개출력
	 * @return
	 */
	public BoardVO selectIndexSale();

	/**
	 * 게시글 타입별 개수 조회
	 * @param boardType
	 * @return
	 */
	public int selectBoardTypeCnt(String boardType);

}