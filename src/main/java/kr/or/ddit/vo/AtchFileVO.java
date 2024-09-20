package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

/**
 * 첨부파일 그룹 VO
 *
 */
@Data
public class AtchFileVO {
	private Integer atchFileId;
	private String creatDt;
	private boolean useAt;
	
	public List<AtchFileDetailVO> fileDetails;
	
	private Integer PROFILE_ATCH_FILE_ID;
	
}
