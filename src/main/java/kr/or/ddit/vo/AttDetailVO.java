package kr.or.ddit.vo;

import java.io.Serializable;

import org.springframework.core.io.Resource;

import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 첨부파일 하나에 대한 VO
 *
 */
@Data
@EqualsAndHashCode(of= {"attdNo", "attNo"})
public class AttDetailVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer attdNo;
	private Integer attNo;
	private String attdQrinm;
	private String attdSavenm;
	private String attdPath;
	private String attdExe;
	private String attdSize;
	private String attdDelyn;
	
	private AttachfileVO attachfile;
	private Resource savedFile;
}
