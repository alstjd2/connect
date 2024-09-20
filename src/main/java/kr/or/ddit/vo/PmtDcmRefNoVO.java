package kr.or.ddit.vo;

import java.time.LocalDate;

import lombok.Data;

/**
 * 결재 문서 참고
 */
@Data
public class PmtDcmRefNoVO {

	private int value;
	private int pmtDcmRefNo;
	private int pmtDcmNo;
	private int pmtDcmRefEmpNo;
	private String pmtDcmRefCmt;
	private LocalDate pmtDcmRefCmtDate;
	
	private String pmtDcmRefEmpNm;
	private String pmtDcmRefEmpPos;
	private String pmtDcmRefEmpOnepos;
	private String pmtDcmRefEmpDep;
	
	private PmtDcmVO pmtDcm;
}
