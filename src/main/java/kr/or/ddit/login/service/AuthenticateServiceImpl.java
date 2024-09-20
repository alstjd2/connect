package kr.or.ddit.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.login.exception.AuthenticateException;
import kr.or.ddit.login.exception.BadCredentialException;
import kr.or.ddit.login.exception.UserNotFoundException;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.web.member.dao.MemberMapper;

@Service
public class AuthenticateServiceImpl implements AuthenticateService{

	@Autowired
	private MemberMapper dao;
	
	@Override
	public MemberVO authenticate(MemberVO inputData) throws AuthenticateException {
		
		MemberVO saved = dao.selectMemberAuth(inputData.getMemId());
		
		if(saved==null) {
			throw new UserNotFoundException(inputData.getMemId());
		}else {
			String inputPass = inputData.getMemPw();
			String savedPass = saved.getMemPw();
			if(savedPass.equals(inputPass)) {
				return saved;
			}else {
				throw new BadCredentialException();
			}
		}
	}

}
