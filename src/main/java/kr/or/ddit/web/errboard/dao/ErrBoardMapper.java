package kr.or.ddit.web.errboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.ErrBoardVO;

@Mapper
public interface ErrBoardMapper {
	   public int insertErrBoard(ErrBoardVO errBoard);
	   public int insertNotAtchErrBoard(ErrBoardVO errBoard);
	    public ErrBoardVO selectErrBoard(@Param("errNo") int errNo);
	    public List<ErrBoardVO> selectErrBoardList();
	    public int updateErrBoard(ErrBoardVO errBoard);
	    public int deleteErrBoard(@Param("errNo") int errNo, @Param("memNo") int memNo);
	    public List<ErrBoardVO> selectErrBoardListPaging(PaginationInfo paging);
		public int selectTotalRecord(PaginationInfo paging);
		public int selectTotalRecordTR(PaginationInfo paging);
		public void updateErrStatus(Map<String, Object> params);
		public List<ErrBoardVO> getErrBoardWithAdmin(@Param("errNo") int errNo);
		public AtchFileDetailVO download(int atchFileId, int fileSn);
	    
	    public List<ErrBoardVO> selectErrBoardAdminListPaging(PaginationInfo paging);
	    public int selectAdminTotalRecord(PaginationInfo paging);
}