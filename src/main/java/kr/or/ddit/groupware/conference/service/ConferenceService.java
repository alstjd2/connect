package kr.or.ddit.groupware.conference.service;

import java.util.List;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ConferenceVO;

public interface ConferenceService {
	
	public ConferenceVO retrieveConference(Integer conNo) throws PkNotFoundException;
	
	public List<ConferenceVO> retrieveConferenceList(PaginationInfo paging);
	
	public void createConference(ConferenceVO conference);

}
