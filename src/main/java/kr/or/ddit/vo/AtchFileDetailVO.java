package kr.or.ddit.vo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.core.io.Resource;
import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.api.client.util.IOUtils;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

/**
 * 첨부파일 한건에 대한 VO
 */
@Data
@EqualsAndHashCode(of= {"atchFileId", "fileSn"})
@NoArgsConstructor
@Slf4j
public class AtchFileDetailVO implements Serializable{
	
	/**
	 * 업로드 파일 수신용
	 */
	@JsonIgnore
	@ToString.Exclude
	@Nullable
	private transient MultipartFile uploadFile;
	public AtchFileDetailVO(MultipartFile uploadFile) {
		super();
		setUploadFile(uploadFile);
	}
	
	public void setUploadFile(MultipartFile uploadFile) {
//	    if (uploadFile.isEmpty()) {
//        	throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "업로드 파일 없음");
//        }
//	    
		this.uploadFile = uploadFile;
		this.streFileNm = UUID.randomUUID().toString();
		this.orignlFileNm = uploadFile.getOriginalFilename();
		this.fileExtsn = FilenameUtils.getExtension(orignlFileNm);
		this.fileCn = null;
		this.fileSize = uploadFile.getSize();
		this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize);
		this.fileMime = uploadFile.getContentType();
		this.fileDwncnt = 0;
	}
	
	public MultipartFile setFileToMultipartFile(File file) throws IOException {
		FileItem fileItem = new DiskFileItem( "mainFile", Files.probeContentType(file.toPath()), 
				        		false, file.getName(), (int) file.length(), file.getParentFile() );
		try (InputStream input = new FileInputStream(file); OutputStream os = fileItem.getOutputStream()) {
		    IOUtils.copy(input, os);
		} catch (IOException ex) {
		    log.error("### file -> MultipartFile 변환 error : {}", ex.getMessage(), ex);
		}	
		MultipartFile mFile = new CommonsMultipartFile(fileItem);
		return mFile;
	}
	
	public void uploadFileSaveTo(File saveFolder) throws IOException{
		if(uploadFile!=null) {
			File saveFile = new File(saveFolder, streFileNm);
			uploadFile.transferTo(saveFile);
			this.fileStreCours = saveFile.getCanonicalPath();
		}
	}
	
	private Integer atchFileId;
	private Integer fileSn;
	private String fileStreCours;
	private String streFileNm;
	private String orignlFileNm;
	private String fileExtsn;
	private String fileCn;
	private long fileSize;
	private String fileFancysize;
	private String fileMime;
	private int fileDwncnt;
	
	private Resource savedFile;
	
	private Integer DETAIL_ATCH_FILE_ID;
	
	

    private String comClogoStrefileNm;
    private String comFaviconStreFileNm;
    
    // 드라이브에서 표시하기 위한 정보
    // 확장자명 제거한 이름명
    private String fileExeRemoveNm;
    // 파일 마지막 수정일자
    private String fileLastModify;
    
    // 파일 추가 경로
    private String sfPath;
    
    
    /**
     * 파일의 타입이 폴더인 경우에 값을 넣어주는 메소드
     * @param folder
     */
    public void setFolderData(File folder) {
    	this.orignlFileNm = folder.getName();
		this.fileExtsn = "folder";
		this.fileSize = folder.length();
		this.fileStreCours = folder.getPath();
		this.fileLastModify = new SimpleDateFormat("yyyy-MM-dd a hh:mm").format(folder.lastModified());
		this.fileExeRemoveNm = FilenameUtils.removeExtension(orignlFileNm);
		this.fileFancysize = FileUtils.byteCountToDisplaySize(folderTotalSize(folder));
    }
    
    /**
     * 폴더 내부에 있는 모든 파일의 사이즈를 구하는 메소드
     * @param folder
     * @return
     */
    public long folderTotalSize(File folder) {
    	long length = 0;
        try {
            for (File file : folder.listFiles()) {
                if (file.isFile())
                    length += file.length();
            else
                length += folderTotalSize(file);
            }			
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return length;
    }

    
}
