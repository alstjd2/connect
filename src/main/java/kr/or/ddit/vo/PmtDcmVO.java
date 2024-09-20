package kr.or.ddit.vo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonGetter;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;

/**
 * 결재 문서 번호
 */
@Data
public class PmtDcmVO {

	
	private Integer pmtDcmNo;
	private String comdcmNum;
	@NotBlank(groups = InsertGroup.class)
	private String dcmFormCode;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmStaNo;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmTitle;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmContent;

	private Integer pmtDcmAttno;
	private Integer pmtRetDcmNo;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmTepSaveYn;

	@NotNull(groups = InsertGroup.class)
	private Integer pmtDcmEmpno;
	
	@DateTimeFormat(iso = ISO.DATE) 
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDate pmtDcmSaveDate;
	@NotNull(groups = InsertGroup.class)
	private Integer pmtDcmPrePos;
	@NotNull(groups = InsertGroup.class)
	private Integer pmtDcmRecEmpno;
	@NotNull(groups = InsertGroup.class)
	private Integer comNo;

	@DateTimeFormat(iso = ISO.DATE) 
	private LocalDate pmtDcmEndDate;
	
	@JsonGetter("pmtDcmEndDate")
    public String getPmtDcmEndDateAsString() {
        return (pmtDcmEndDate != null) ? pmtDcmEndDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) : "";
    }
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmEmpnm;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmRecEmpnm;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmRecEmpdep;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmRecEmponepos;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmRecStano;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmEmpdep;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmEmponepos;
	
	@DateTimeFormat(iso = ISO.DATE) 
	private LocalDate pmtDcmRecDate;
	
	@JsonGetter("pmtDcmRecDate")
    public String getPmtDcmRecDateAsString() {
        return (pmtDcmRecDate != null) ? pmtDcmRecDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) : "";
    }
	
	private String pmtDcmEndStaNo;
	
	private List<PmtDcmAppVO> pmtDcmAppList ;
	private List<PmtDcmRefNoVO> PmtDcmRefList ;
	
	private AtchFileVO atchFile;
	
	private Integer myAppNowDcm;
	private Integer myAppAffDcm;
	private Integer myRefDcm;
	private Integer myRecDcm;
	
}
