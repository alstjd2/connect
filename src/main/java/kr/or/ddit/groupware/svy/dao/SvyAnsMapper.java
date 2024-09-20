package kr.or.ddit.groupware.svy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.SvyAnsVO;

@Mapper
public interface SvyAnsMapper {

	public List<SvyAnsVO> selectSvyAnsList(int svyNo);

	public SvyAnsVO selectSvyAns(int svyAnsNo);
	
	public int insertSvyAns(SvyAnsVO svyAns);
	
	public int updateSvyAns(int SvyAns);
	
	public int deleteSvyAns(int svyAnsNo);

	public List<SvyAnsVO> selectSvyAnsDetailList(SvyAnsVO svyAns);
	
	public SvyAnsVO selectSvyAnsNo(SvyAnsVO svyAns);
}
