package kr.or.ddit.groupware.chi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ChiVO;

@Mapper
public interface ChiMapper {
	public ChiVO selectChi(Integer chiNo);
	public List<ChiVO> selectChiList();
	public int insertChi(ChiVO chi);
	public int updateChi(ChiVO chi);
	public int deleteChi(Integer chiNo);

}
