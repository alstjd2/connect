package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(of="errNo")
@Data
public class ErrBoardVO implements Serializable {
    /**
     * 에러보드 번호
     */
    private Integer errNo;

    /**
     * 회원번호
     */
    private Integer memNo;

    /**
     * 에러 작업 진행도
     */
    private String errWorkProgress;

    /**
     * 제목
     */
    private String errTitle;

    private String errLoc;
    
    private int errAttachFile;

    private String errIncidentDescription;

    private String errContent;
    
    /**
     * 날짜
     */
    private String formattedDate; // Getter 및 Setter 추가
    
    private String errDate;

    private static final long serialVersionUID = 1L;
    
    private List<ErrAdminVO> errAdmin;
    
	@Nullable
	private Integer atchFileId;
	
	@Nullable
	private AtchFileVO atchFile;
}