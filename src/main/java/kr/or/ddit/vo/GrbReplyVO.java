package kr.or.ddit.vo;

import java.util.List;

import javax.annotation.Nullable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="grbReplyNo")
public class GrbReplyVO {
	
	private int grbReplyNo;
	 /**
	 * 보드 번호
	 */
	private int grbNo;
	 /**
	 *  회원번호
	 */
	private int empNo;
	 /**
	 * 회사번호
	 */
	private int comNo;
	
	private String empNm;
	 /**
	 * 
	 */

	 /**
	 * 내용
	 */
	private String replyContent;
	 /**
	 * 첨부파일
	 */
	private int grbReplyAttachfile;
	 /**
	 * 등록날짜
	 */
	private String grbReplyDate;
	
	 /**
	 * 삭제여부
	 */
	private String grbReplyDelyn;
	 /**
	 * 시작일
	 */
	private EmployeeVO employee; // 1:1 ProdVO has A lprodVO
	 /**
	 * 필독글 리스트 조인관계
	 */
	private List<GrbAttentionVO> grbAttentionList; // 1:N - has Many
	
	@Nullable
	private AtchFileVO atchFile;
	
	private AtchFileVO empAtchFile;
	
	@Nullable
	private Integer atchFileId;
	
}
