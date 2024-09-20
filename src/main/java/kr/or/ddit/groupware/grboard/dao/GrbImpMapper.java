package kr.or.ddit.groupware.grboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.GrbImpVO;

@Mapper
public interface GrbImpMapper {
	public Integer insertGrbImp(GrbImpVO grbImp);
	public List<GrbImpVO> selectGrbImpList();
	public GrbImpVO selectGrbImp(int grbImpNo);
	public int updateGrbImp(GrbImpVO grbImp);
    public int deleteGrbImp(GrbImpVO grbImp);
    
    
}