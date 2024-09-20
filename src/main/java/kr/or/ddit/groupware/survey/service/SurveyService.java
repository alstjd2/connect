package kr.or.ddit.groupware.survey.service;

import java.util.List;

import kr.or.ddit.vo.SvyAnsListVO;
import kr.or.ddit.vo.SvyAnsVO;
import kr.or.ddit.vo.SvyAskVO;
import kr.or.ddit.vo.SvyVO;

public interface SurveyService {
	public List<SvyVO> retrieveComSvyList(int comNo);
	public List<SvyVO> retrieveMySvyList(int empNo);
	public List<SvyAnsVO> retrieveSvyAnsList(int svyNo);
	public List<SvyAnsVO> retrieveSvyAnsDetailList(SvyAnsVO svyAns);
	public SvyVO retrieveSvyDetail(int svyNo);
	public List<SvyVO> retrieveSvyList(int svyNo);
	public List<SvyVO> retrieveMyAnsSvyList(int empNo);
	public List<SvyVO> retrieveSvyInsertContent(int svyNo);
	
	public void modifySvyAns(int svyAnsNo);
	
	public void modifySvy(int svyNO);

	public void createSvyAnsList(SvyAnsListVO svyAnsList);
	
	public int retrieveSvyAnsNo(SvyAnsVO svyAns);
	
	public int createSvy(SvyVO svy);
	
	public SvyAskVO retrieveSvyAsk(int svyNo);
}
