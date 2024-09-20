package kr.or.ddit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.member.dao.MemberMapper;

@Service
public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO realUser = mapper.selectMemberAuth(username);
		
		if(realUser == null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음", username));
		}
		
		return new MemberVOWrapper(realUser);
	}
	
}