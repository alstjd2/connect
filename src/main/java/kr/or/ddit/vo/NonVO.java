package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NonVO implements Serializable {
    private int nonNo;
    
    private String nonNm;

    private String nonTitle;

    private String nonContent;

    private int nonAttachFileNo;
    
    private MultipartFile nonAttachFile;

    private String nonPerinfocollection;

    private String nonStatus;

    private LocalDateTime nonDate;

    private String nonEmail;

    private static final long serialVersionUID = 1L;
    
	@Nullable
	private Integer atchFileId;
	
	@Nullable
	private AtchFileVO atchFile;
	
	
	
	
}