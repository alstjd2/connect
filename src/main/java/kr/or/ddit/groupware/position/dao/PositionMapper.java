package kr.or.ddit.groupware.position.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.PositionVO;

@Mapper
public interface PositionMapper {
	public List<PositionVO> selectPositionListByComNo(@Param("comNo") int comNo, @Param("posType") String posType);
	public PositionVO selectPositionByPosNo(int posNo);
	public void insertPosition(PositionVO positionVO);
	public void updatePosition(PositionVO positionVO);
	public void deletePosition(int posNo);
	List<PositionVO> selectPosComAll(int comNo);
	
}