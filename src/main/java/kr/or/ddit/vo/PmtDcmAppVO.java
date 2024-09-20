package kr.or.ddit.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;

/**
 * 결재 문서 처리
 */
@Data
public class PmtDcmAppVO {
	

	private Integer pmtDcmNo;
	@NotNull()
	private Integer pmtDcmAppNo;
	@NotNull(groups = InsertGroup.class)
	private Integer pmtDcmAppEmpId;
	@NotBlank()
	private String pmtDcmStaNo;
	private LocalDate pmtDcmAppDate;
	private String pmtDcmAppCmt;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmAppEmpNm;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmAppEmpPos;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmAppEmpOnepos;
	@NotNull(groups = InsertGroup.class)
	private Integer pmtDcmAppTrun;
	@NotBlank(groups = InsertGroup.class)
	private String pmtDcmAppEmpDep;
	@NotNull(groups = InsertGroup.class)
	private Integer pmtDcmAppEmpOneposNo;
	
	private PmtDcmVO pmtDcm;
}
