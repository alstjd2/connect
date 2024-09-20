package kr.or.ddit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.employee.dao.EmployeeMapper;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Service
public class CustomMemberDetailService implements UserDetailsService{
	
	@Autowired
	private EmployeeMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO realUser = mapper.selectEmployeeAuth(username);
		
		if(realUser == null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음", username));
		}
		
		return new EmployeeVOWrapper(realUser);
	}
	
}