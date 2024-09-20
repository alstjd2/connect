package kr.or.ddit.web.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.exception.AccountNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.exception.UserNotFoundException;
import kr.or.ddit.vo.MemberVO;

public interface MemberService {
	
	/**
	 * 프로바이더가 확인하는 회원 리스트를 가져오는 메소드, JSON으로 페이지에 나타낸다
	 * @return
	 */
	public List<MemberVO> selectMemberListByProviderPage(PaginationInfo paging);
	
	
	/**
	 * 웹 회원이 본인의 정보, 기업정보, 만료일을 가져온다.
	 * @return
	 */
	public MemberVO selectMemberMypage(int memNo);
	
	/**
	 * 상세 정보 조회
	 * @param memId
	 * @return 이사람이 없다 .. 존재하지 않는 경우, {@link UserNotFoundException} 발생
	 */
	public MemberVO retrieveMemberById(String memId);
	
	/**
	 * 회원 가입
	 * 성공할 경우 Ok, 실패할 경우 FAIED 결과 반환
	 * @param member
	 * @return
	 */
	public ServiceResult createMember(MemberVO member);
	
	/**
	 * 회원 아이디 찾기
	 * 이름과 이메일을 입력하면 해당하는 인원의 아이디를 찾는다
	 * @param member
	 * @return 있는경우 id값을 반환, 없는 경우 {@link AccountNotFoundException} 발생
	 */
	public String MemberIdFind(MemberVO member);
	
	
	/**
	 * 회원 비밀번호 찾기
	 * 아이디와 이메일을 입력받아 해당되는 인원의 임시비밀번호 생성 후 전송
	 * 존재하지 않을 경우 예외처리
	 * @param member
	 * @return 정상 처리할 경우 true, 정상 처리가 안될경우 false, 계정 정보가 없는경우 {@link AccountNotFoundException} 발생
	 */
	public ServiceResult memberPwFind(MemberVO member);
	
	/**
	 * 한 사람에 대한 정보를 조회
	 * @param memNo
	 * @return
	 */
	public MemberVO retrieveMemberDetail(int memNo);
	
	/**
	 * 한 사람의 정보 수정
	 * @param member
	 * @return
	 */
	public ServiceResult modifyMember(MemberVO member);
	
	/**
	 * 웹 구독 계정이 등록한 기업에 대한 어드민계정 아이디 찾기
	 * @param comNo
	 * @return 있는경우 id값을 반환, 없는 경우 {@link AccountNotFoundException} 발생
	 */
	public String retrieveMemberGroupwareId(int comNo);
	
	/**
	 * 그룹웨어 아이디 중복 체크
	 * @param empId
	 * @return
	 */
	public String retrieveGroupwareIdChk(String empId);
}
