package kr.or.ddit.vo;

import java.io.File;
import java.text.SimpleDateFormat;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import lombok.Data;

@Data
public class FileDetailVO {
	private String fileOrgName;
	private String fileExeRemoveName;
	private String fileStdName;
	private long fileSize;
	private String fileFancy;
	private String filePath;
	private String fileExe;
	private String fileLastModify;
	
	public FileDetailVO(File file) {
		super();
		setFile(file);
	}
	
	public void setFile(File file) {
		this.fileOrgName = file.getName();
		this.fileExe = FilenameUtils.getExtension(fileOrgName);
		this.fileSize = file.length();
		this.fileFancy = FileUtils.byteCountToDisplaySize(fileSize);
		this.filePath = file.getPath();
		this.fileLastModify = new SimpleDateFormat("yyyy-MM-dd a hh:mm").format(file.lastModified());
		this.fileExeRemoveName = FilenameUtils.removeExtension(fileOrgName);
	}
}
