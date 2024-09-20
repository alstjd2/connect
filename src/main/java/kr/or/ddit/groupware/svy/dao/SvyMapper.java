package kr.or.ddit.groupware.svy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.SvyVO;

@Mapper
public interface SvyMapper {
	public SvyVO selectSvy(Integer svyNo);
	public List<SvyVO> selectSvyList(Integer svyNo);
	public List<SvyVO> selectSvyInsertContent(Integer svyNo);
	public int insertSvy(SvyVO svy);
	public int updateSvy(Integer svyNo);
	public int deleteSvy(Integer svyNo);
	public List<SvyVO> selectComSvyList(int comNo);
	public List<SvyVO> selectMyAskSvyList(int empNo);
	public List<SvyVO> selectMyAnsSvyList(int empNo);
	
	public void updateSvyList();
}
