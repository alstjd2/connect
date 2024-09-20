package kr.or.ddit.groupware.conference.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.ConferenceVO;

@Mapper
public interface ConferenceMapper {
	public int insertConference(ConferenceVO conference);
	public List<ConferenceVO> selectConferenceList(PaginationInfo paging);
	public ConferenceVO selectConference(Integer conNo);
	public int selectTotalRecord(PaginationInfo paging);

}
