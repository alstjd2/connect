package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
@Data
@EqualsAndHashCode(of="grbNo")
public class GrBoardVO {
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
	 /**
	 * 
	 */
	private int grbGubunNo;
	 /**
	 * 새글
	 */
	private String grbNewPost;
	 /**
	 * 제목
	 */
	private String grbTitle;
	 /**
	 * 내용
	 */
	private String grbContent;
	
	private String EmpNm;
	
//	private String grbGubunTitle;
	 /**
	 * 첨부파일
	 */
	private int grbAttachfile;
	 /**
	 * 등록날짜
	 */
	private String grbDate;
	 /**
	 * 삭제여부
	 */
	private String grbDelyn;
	 /**
	 * 시작일
	 */
	private String grbStart;
	 /**
	 * 종료일
	 */
	private String grbEnd;
	 /**
	 * 필독글 조회
	 */
	private String grbAttentionYN;
	 
	 /**
	 * 첨부파일 객체
	 */
	private MultipartFile uploadFile;
	
	 /**
	 * 중요여부(중요 버튼 클릭시 조회가능)
	 */
	private List<GrbImpVO> grbImpList; // 1:N - has Many
	 /**
	 * empList 조인관계 
	 */
	private EmployeeVO employee; // 1:1 ProdVO has A lprodVO
	 /**
	 * 필독글 리스트 조인관계
	 */
	private List<GrbAttentionVO> grbAttentionList; // 1:N - has Many
	
	private List<GrbTrashVO> grbTrashList; // 1:N - has Many
	
	private List<GrbReplyVO> grbReplyList; // 1:N - has Many
	 /**
	 * 게시판 구분(여러개의 게시판중 어떤 게시판을 사용할지)
	 */
	private GrbGubunVO gubun;
	
	@Nullable
	private AtchFileVO atchFile;
	
	private AtchFileVO empAtchFile;
	
	@Nullable
	private Integer atchFileId;

	public void setFormattedDate(String formattedDate) {
		// TODO Auto-generated method stub
		
	}

	
}
