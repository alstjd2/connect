package kr.or.ddit.web.member.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.AccountNotFoundException;
import kr.or.ddit.commons.exception.MailNotSendException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.utils.RandomUtils;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.login.exception.UserNotFoundException;
import kr.or.ddit.vo.MailVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.web.mail.service.MailService;
import kr.or.ddit.web.member.dao.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	public MemberMapper memberMapper;
	@Autowired
	private MailService mailService;
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public List<MemberVO> selectMemberListByProviderPage(PaginationInfo paging) {
		int totalRecord = memberMapper.selectTotalMember(paging);// 3개를 호출해야하는데 2가지만 컨트롤러에서 가져와서 나머지는 dao에서 가져오기
		paging.setTotalRecord(totalRecord); // setter에 totalRecord 넘겨주기
		return memberMapper.selectMemberListByProviderPage(paging);
	}

	@Override
	public MemberVO selectMemberMypage(int memNo) {
		MemberVO member = memberMapper.selectMemberMypage(memNo);
		return member;
	}

	@Override
	public MemberVO retrieveMemberById(String memId) {
		MemberVO member = memberMapper.selectMemberById(memId);
		
		if(member == null) {
			throw new UserNotFoundException(memId);
		}
		
		return member;
	}

	@Override
	public ServiceResult createMember(MemberVO member) {
		ServiceResult result = null;
		result = memberMapper.insertMember(member) > 0 ? ServiceResult.OK : ServiceResult.FAIED;
		return result;
	}

	@Override
	public String MemberIdFind(MemberVO member) {
		String memId = memberMapper.memberIdFind(member);
		
		if(StringUtil.isBlank(memId)) {
			throw new AccountNotFoundException();
		}
		return memId;
	}

	@Transactional
	@Override
	public ServiceResult memberPwFind(MemberVO member) {
		Integer memNo = memberMapper.memberPwFind(member);
		ServiceResult result = ServiceResult.FAIED;
		if(!"null".equals(memNo+"") && memNo > 0) {
			String rndPw = RandomUtils.getRandomPassword(8);
			
			MailVO mail = new MailVO();
			mail.setEMail(member.getMemEmail());
			mail.setTitle("connect회원님의 임시 비밀번호입니다.");
			mail.setContent(String.format("회원님의 임시 비밀번호 : %s", rndPw));
			mailService.sendMail(mail);
			String inputPw = encoder.encode(rndPw);
			member.setMemNo(memNo);
			member.setMemPw(inputPw);
			memberMapper.memberPwFindChange(member);
			result = ServiceResult.OK;
		}else {
			throw new AccountNotFoundException();
		}
		return result;
	}

	@Override
	public MemberVO retrieveMemberDetail(int memNo) {
		MemberVO member = memberMapper.selectMemberDetail(memNo);
		
		if(member == null) {
			throw new UserNotFoundException(memNo);
		}
		
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		ServiceResult result = null;
		result = memberMapper.updateMember(member) > 0 ? ServiceResult.OK : ServiceResult.FAIED;
		return result;
	}

	@Override
	public String retrieveMemberGroupwareId(int comNo) {
		String groupwareId = memberMapper.selectMemberFindGroupwareId(comNo);
		if(StringUtils.isNotBlank(groupwareId)) {
			return groupwareId;
		}else {
			throw new AccountNotFoundException();
		}
	}

	@Override
	public String retrieveGroupwareIdChk(String empId) {
		String groupwareId = memberMapper.selectGroupwareIdChk(empId);
		if(StringUtils.isNotBlank(groupwareId)) {
			return groupwareId;
		}else {
			throw new AccountNotFoundException();
		}
	}
	
}
