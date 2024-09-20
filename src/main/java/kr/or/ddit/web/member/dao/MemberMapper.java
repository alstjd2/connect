package kr.or.ddit.web.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.MemberVO;

/**
 * 인증 및 회원 관리를 위한 Persistence layer
 *
 */
@Mapper
public interface MemberMapper {
	/**
	 * username(사용자 식별데이터)로 조회된 회원정보(회원 번호, 아이디, 비밀번호, 이름, 휴대전화, 역할, 회사번호)
	 * @param memId
	 * @return
	 */
	public MemberVO selectMemberAuth(String memId);

	/**
	 * 한사람의 대한 정보조회
	 * @param name
	 * @return
	 */
	public MemberVO selectMemberDetail(int memNo);

	/**
	 * 전체 회원 목록 조회, ----> 페이징 처리 x
	 * @return
	 */
	public List<MemberVO> selsctMemberList();

	/**
	 * 전체 회원 목록 조회, ----> 페이징 처리 추가
	 * @return
	 */
	public List<MemberVO> selsctMemberListP(PaginationInfo paging);

	/**
	 * 전체 인원 카운트
	 * @return
	 */
	public int selectTotalMember(PaginationInfo paging);
	public int selectTotalMember();

	/**
	 * 신규 회원 등록
	 * @param member
	 * @return
	 */
	public int insertMember(MemberVO member);

	/**
	 * 회원 정보 수정
	 * @param member
	 * @return
	 */
	public int updateMember(MemberVO member);

	/**
	 * 회원정보삭제(?)
	 * @param memId
	 * @return
	 */
	public int deleteMember(int memNo);


	/**
	 * 프로바이더 페이지의 회원정보 리스트
	 * @return
	 */
	public List<MemberVO> selectMemberListByProviderPage(PaginationInfo paging);

	/**
	 * 회원 마이페이지에서 로그인한 회원의 정보와 회사 정보, 구독중이라면 만료일까지 가져온다
	 * @return
	 */
	public MemberVO selectMemberMypage(int memNo);

	/**
	 * 회원 1명의 정보를 id로 조회
	 * @param memId
	 * @return
	 */
	public MemberVO selectMemberById(String memId);
	
	/**
	 * 이름과 이메일로 회원이 있는지 조회한다.
	 * @param member
	 * @return 존재 할 경우 아이디 반환
	 */
	public String memberIdFind(MemberVO member);
	
	/**
	 * 아이디와 이메일로 회원이 있는지 조회한다.
	 * @param member
	 * @return 존재 할 경우 회원no(PK) 반환
	 */
	public Integer memberPwFind(MemberVO member);
	
	
	/**
	 * 회원 비밀번호 변경
	 * @param 회원 번호(memNo), 변경할 비밀번호(memPw)를 담은 MemberVO 필요
	 * @return
	 */
	public int memberPwFindChange(MemberVO member);
	
	
	/**
	 * 회사 번호(PK)로 해당 회사의 그룹웨어 어드민 계정 찾기
	 * @param comNo
	 * @return
	 */
	public String selectMemberFindGroupwareId(int comNo);
	
	/**
	 * 그룹웨어 아이디 중복 체크
	 * @param empId
	 * @return
	 */
	public String selectGroupwareIdChk(String empId);
	
}
