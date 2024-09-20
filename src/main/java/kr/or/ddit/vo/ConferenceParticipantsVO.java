package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class ConferenceParticipantsVO {
	private Integer conparNo;
	private Integer conNo;
	private Integer conparEmpno;
	
	private ConferenceVO conference;
	private List<ConferenceLogVO> conferenceLogList;

}
