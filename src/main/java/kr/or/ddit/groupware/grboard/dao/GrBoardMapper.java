package kr.or.ddit.groupware.grboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;

@Mapper
public interface GrBoardMapper {
	/**
	 * 새글 등록
	 * 
	 * @param board
	 * @return
	 */
	public Integer insertGrBoard(GrBoardVO board);

	/**
	 * 특정 글 조회
	 * 
	 * @param boNo 조회할 글 번호
	 * @return
	 */
	public GrBoardVO selectGrBoard(int grbNo);

	/**
	 * 글 조회수 카운트
	 * 
	 * @param boNo
	 * @return
	 */
	public int incrementHit(int grbNo);

	/**
	 * 글 목록 조회
	 * 
	 * @param paginationInfo
	 * @return
	 */
	public List<GrBoardVO> selectGrBoardList(PaginationInfo paging);
	
	public List<GrBoardVO> selectGrBoardIndexPage(PaginationInfo paging);
	
	public List<GrBoardVO> selectGrbAtenBoardList(PaginationInfo paging);
	
	public List<GrBoardVO> selectGrBoardListNonPaging();

	/**
	 * 게시글 목록 수 조회
	 * 
	 * @param paginationInfo
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
	
	public int countGrBoardList(PaginationInfo paging);

	/**
	 * 글 수정
	 * 
	 * @param board
	 * @return
	 */
	public int updateGrBoard(GrBoardVO grBoard);

	/**
	 * 글 삭제
	 * 
	 * @param boNo
	 * @return
	 */
	public int deleteGrBoard(GrBoardVO grBoard);
	
	
	
	public List<GrBoardVO> selectGrbMyPostBoardList(PaginationInfo paging);
	public int countUserPosts(PaginationInfo paging);
	
  	
	 
	public List<GrBoardVO> selectGrbImpList(PaginationInfo paging);
	public int countImp(PaginationInfo paging);
	
	public List<GrBoardVO> selectGrbTrashList(PaginationInfo paging);
	public int countTrash(PaginationInfo paging);
	
	public List<GrBoardVO> selectGrbGubunList(PaginationInfo paging);
	public int CountGubun(PaginationInfo paging);
	
	
	public Integer insertNotAtchGrboard(GrBoardVO grb); 
	
	public Integer updateNotAttchFile(GrBoardVO grb); 
	
}