package kr.or.ddit.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;

/**
 * 결재 문서 입력시 필요정보
 */
@Data
public class PmtDcmInsertVO {
	
	@Valid
	private PmtDcmVO pmtDcm;
	@NotNull(groups = InsertGroup.class)
	private Integer pmtDcmAppEmpId1;
	private Integer pmtDcmAppEmpId2;
	private Integer pmtDcmAppEmpId3;
	private Integer pmtDcmAppEmpId4;
	private Integer pmtDcmAppEmpId5;
	
	private List<PmtDcmRefNoVO> pmtDcmPrfEmpList;
	
	private AtchFileVO atchFile;
	private List<AtchFileDetailVO> atchFileList;
}
