package kr.or.ddit.vo;


import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;



public class EmployeeVOWrapper extends User{

	private final EmployeeVO realUser;
	
	public EmployeeVOWrapper(EmployeeVO realUser) {
		super(realUser.getEmpId(), realUser.getEmpPw()
				, true, true, true, true
				, AuthorityUtils.createAuthorityList(realUser.getEmpRole())
		);
		this.realUser = realUser;
	}
	
	public EmployeeVO getRealUser() {
		return realUser;
	}
	
}
