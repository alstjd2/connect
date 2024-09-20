package kr.or.ddit.vo;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.LoginGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 인증 및 회원관리를 위한 Domain layer
 *
 */
@Getter
@Setter
@ToString(exclude = {"memPw"})
@EqualsAndHashCode(of = "memNo")
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO implements Serializable{
	
	private static final long serialVersionUID = 1L;

//	public MemberVO(String memId, String memPw) {
//		super();
//		this.memId = memId;
//		this.memPw = memPw;
//	}

//	@NotBlank(groups = {DeleteGroup.class, Default.class, LoginGroup.class}, message = "회원아이디 누락")
//	private String memId;
//	@NotBlank(groups = {DeleteGroup.class, Default.class, LoginGroup.class}, message = "비밀번호 누락")
////	@Size(min = 4, max = 8, groups = {DeleteGroup.class, Default.class})
////	@Pattern(regexp = "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\\$]).{4,8}", 
////				groups = {DeleteGroup.class, Default.class, LoginGroup.class}, message = "비밀번호 형식 확인")
//	@JsonIgnore
//	private transient String memPass;
//	@NotBlank(message = "이름 누락")
//	@Size(max = 20, message = "이름의 길이는 20글자 제한")
//	private String memName;
////	@NotBlank(groups = InsertGroup.class)
//	@JsonIgnore
//	private transient String memRegno1;
////	@NotBlank(groups = InsertGroup.class)
//	@JsonIgnore
//	private transient String memRegno2;
////	@NotNull(groups = UpdateGroup.class)
//	@DateTimeFormat(iso = ISO.DATE)
//	private LocalDate memBir;
//	@NotBlank
//	private String memZip;
//	@NotBlank
//	private String memAdd1;
//	@NotBlank
//	private String memAdd2;
//	private String memHometel;
//	private String memComtel;
//	@Pattern(regexp = "\\d{3}-\\d{3,4}-\\d{4}")
//	private String memHp;
//	@Email
//	private String memMail;
//	private String memJob;
//	private String memLike;
//	private String memMemorial;
//	@DateTimeFormat(iso = ISO.DATE)
//	private LocalDate memMemorialday;
//	private Integer memMileage;
//	private boolean memDelete;
//	private String memRole;
	
	private int memNo;
	@NotBlank(groups = {InsertGroup.class}, message = "회원아이디 누락")
//	@Size(min=6, max=20, message = "아이디 길이는 최소6에서 최대20자")
    private String memId;
	@NotBlank(groups = { InsertGroup.class}, message = "회원비밀번호 누락")
	@Size(min = 6, max = 20, groups = { InsertGroup.class})
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}$", 
			groups = {InsertGroup.class}, message = "비밀번호 형식 확인")
    @JsonIgnore
    private String memPw;
    @NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "회원이름 누락")
	@Size(max = 20, message = "이름의 길이는 20글자 제한")
    private String memNm;
    @NotBlank(groups = {InsertGroup.class}, message = "회원생일 누락")
    private String memBir;
    @NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "회원이메일 누락")
//    @Pattern(groups = InsertGroup.class, message = "이메일 형식 확인"
//    		, regexp = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\\\.[A-Za-z0-9-]+)*(\\\\.[A-Za-z]{2,})$")
    @Email(message = "이메일 형식에 맞게 작성해주세요.")
    private String memEmail;
    @NotBlank(groups = {InsertGroup.class, UpdateGroup.class}, message = "회원전화번호 누락")
    @Pattern(groups = InsertGroup.class, regexp = "\\d{3}-?\\d{4}-?\\d{4}", message = "번호형식 불일치, 하이픈(-) 넣고 입력해주세요.")
    private String memPhone;
    private String memDelyn;
    private String memGender;
    private String memType;
    private String memRole;
    @DateTimeFormat(iso = ISO.DATE, pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate memDate;
	
    // Has 관계를 위한 VO
    // 회사와 1:1 관계
    private CompanyVO company;
    // 회원 오류접수 1:many
    private List<ErrBoardVO> errBoardList;
    // 게시판 1:many
    private List<BoardVO> boardList;
    
    // Provider 페이지에서 멤버 리스트 항목을 표현하기 위한 객체
    // 결제 회사명(방법)
    private String billing;
    // 서비스 이용 상태(1.미구매 2.이용중 3.이용중지)
    private String status;
    // 만료일 계산 표기
    private int endDate;
    // 페이징 번호 표시
    private int rnum;
    
}






























