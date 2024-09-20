package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;
import lombok.ToString;

@Data
public class CompanyVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private int comNo;
	private int memNo;
	@NotBlank(groups = {InsertGroup.class}, message = "기업명 누락")
	private String comNm;
	@NotBlank(groups = {InsertGroup.class}, message = "대표명 누락")
	private String comBsnm;
	@NotBlank(groups = {InsertGroup.class}, message = "사업자번호 누락")
	private String comBsno;
	@NotBlank(groups = {InsertGroup.class}, message = "주소 누락")
	private String comAdr;
	@NotBlank(groups = {InsertGroup.class}, message = "회사 전화번호 누락")
	private String comTel;
	private int comClogo;
	private int comWlogo;
	private int comFavicon;
	private int comOg;
	private int comCorno;
	private String comGu;
	@NotNull(groups = {InsertGroup.class}, message = "매출규모 누락")
	private Long comSapr;
	private String comDelyn;
	private LocalDate comDate;
	// 기업 사용여부 통계를 위한 객체
	private int cntCom;

	// has 관계를 위한 VO
	private List<EmployeeVO> employeeList;
	private MemberVO member;
	private List<AbsenceVO> absenceList;
	private List<PositionVO> positionList;
	private List<GrbGubunVO> grbGubunList;
	private List<ComdcmNumVO> comdcmNumList;
	private List<VacationInfoVO> vacationInfoList;
	private List<OrganizationVO> organizationList;
	private List<RoomVO> roomList;
	private List<SvyVO> svyList;

	private int COMPANY_NO;
	private AtchFileVO atchFile;
	private AtchFileVO atchFile2;

	/**
	 * 브랜드로고 파일 수신용
	 */
	@JsonIgnore
	@ToString.Exclude
	@Nullable
	private transient MultipartFile comClogoFile;
	/**
	 * 파비콘 파일 수신용
	 */
	@JsonIgnore
	@ToString.Exclude
	@Nullable
	private transient MultipartFile comFaviconFile;

}