package kr.or.ddit.groupware.conference.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.conference.dao.ConferenceMapper;
import kr.or.ddit.vo.ConferenceVO;

@Service
public class ConferenceServiceImpl implements ConferenceService {
	
	@Autowired
	private ConferenceMapper mapper;

	@Override
	public ConferenceVO retrieveConference(Integer conNo) throws PkNotFoundException {
		ConferenceVO conference = mapper.selectConference(conNo);
		if(conference==null)
			throw new PkNotFoundException(conNo);
		return conference;
	}

	@Override
	public List<ConferenceVO> retrieveConferenceList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectConferenceList(paging);
	}

	@Override
	public void createConference(ConferenceVO conference) {
		mapper.insertConference(conference);

	}

}
