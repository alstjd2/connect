package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.lang.Nullable;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;

@Data
public class EmployeeVO implements Serializable{

	/**
	 * 직원번호
	 */
	private Integer empNo;
	/**
	 * 기업번호
	 */
	private Integer comNo;
	/**
	 * 직원ID
	 */
	@NotBlank(groups = {InsertGroup.class}, message = "회원아이디 누락")
	private String empId;
	/**
	 * 직원PW
	 */
	@NotBlank(groups = { InsertGroup.class}, message = "회원비밀번호 누락")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}$", 
			groups = {InsertGroup.class}, message = "비밀번호 형식 확인")
    @JsonIgnore
	private String empPw;
	/**
	 * 성별
	 */
	private String empGender;
	/**
	 * 직원분류
	 */
	private String empType;
	/**
	 * 프로필사진
	 */
	private Integer empProfile;
//	private Integer atchFileId;
	/**
	 * 이름
	 */
	private String empNm;
	/**
	 * 소속
	 */
	private String empAff;
	/**
	 * 부서(조직)
	 */
	private int empDep;
	/**
	 * 직급
	 */
	private Integer empPos;
	/**
	 * 직책
	 */
	private Integer empOnepos;
	/**
	 * 사내전화번호
	 */
	private String empComtel;
	/**
	 * 휴대폰번호
	 */
	private String empTel;
	/**
	 * 회사메일
	 */
	private String empCommail;
	/**
	 * 개인메일
	 */
	private String empMail;
	/**
	 * 생일
	 */
	private String empBir;
	/**
	 * 입사일
	 */
	private String empJoindate;
	/**
	 * 연차
	 */
	private Integer empYear;
	private String empDelyn;
	private String empRole;

	/**
	 * 재직상태
	 */
	private String empState;  	// 재직상태

	/**
	 * 부서명
	 */
	private String empDepName;  // 부서명을 담기 위한 필드 새로 추가

	/**
	 * 직급명
	 */
	private String empPosName;  // 직급명을 담기 위한 필드 새로 추가


	/**
	 * 직책명
	 */
	private String empOneposName; // 직책명을 담기 위한 필드 새로 추가



	// has 관계를 위한 변수생성
	private List<TodoListVO> todoList;
	private CompanyVO company;
	private List<BookMarkVO> bookMarkList;
//	private List<TdriveDirectoryVO> TdriveDirectoryList;
	private List<AttendanceVO> attendenceList;
	private List<MsgroomVO> msgroomList;
	private List<AdrGroupVO> adrGroupList;
//	private EddirVO eddir;
//	private List<sendMailVO> sendMailList;
	private List<AlarmVO> alarmList;
	private List<CerificateVO> cerificateList;
//	private List<MemoVO> memoList;
	private List<ConferenceVO> conferenceList;
	private List<AppointmentsVO> appointmentsList;
	private List<AddressVO> addressList;
	private List<ApplicationVO> applicationList;
	private List<GrBoardVO> grBoardList;




	/**
	 * 첨부파일분류
	 */
	private AtchFileVO atchFile;

	private int rnum;

	private String orgDep;

	private String percentage;

	private String workStatus;

	private boolean isImageModified;
	
	// 프로필 사진을 보여줄 경로
	private String empProfileNm;
	

}
