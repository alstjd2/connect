package kr.or.ddit.groupware.grbtrash.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbTrashVO;

@Mapper
public interface GrbTrashMapper {
	 public void insertGrbTrash(Map<String, Object> params);
	public int TrashCount(Map<String, Object> params);
	public int updateGrbDelynToN(Map<String, Object> params);
	public int updateGrbDelynToY(Map<String, Object> params);
    public void restoreFromTrash(Map<String, Object> params);
    public void permanentDelete(Map<String, Object> params);
    public void deleteReply(Map<String, Object> params);
    public void permanentDeleteGrboard(Map<String, Object> params);
	
}