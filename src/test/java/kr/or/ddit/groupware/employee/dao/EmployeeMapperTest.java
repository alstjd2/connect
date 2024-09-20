package kr.or.ddit.groupware.employee.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class EmployeeMapperTest {
	@Autowired
	private EmployeeMapper dao;

	@Test
	void testInsertEmployee() {
		EmployeeVO employee = new EmployeeVO();
		
		employee.setComNo(3);
		employee.setEmpNm("test이름");
		employee.setEmpCommail("test메일");
		employee.setEmpId("test아이디");
		employee.setEmpPw("test비밀번호");
		
		assertEquals(1, dao.insertEmployee(employee));
	}

	@Test
	void testSelectEmployeeList() {
		List<EmployeeVO> list = new ArrayList<>();
		list = dao.selectEmployeeList();
		
		list.forEach((p) -> {
			log.info("list : ${}", p);
		});
	}

	@Test
	void testSelectEmployee() {
		EmployeeVO employee = new EmployeeVO();
		employee = dao.selectEmployee(1);
		log.info("employee : {}", employee);
	}

	@Test
	void testUpdateEmployee() {
		EmployeeVO employee = new EmployeeVO();
		
		employee.setEmpNo(101);
		employee.setComNo(3);
		employee.setEmpNm("test이름2");
		employee.setEmpCommail("test메일2");
		employee.setEmpId("test아이디2");
		employee.setEmpPw("test비밀번호2");
		
		assertEquals(1, dao.updateEmployee(employee));
	}

	@Test
	void testDeleteEmployee() {
		
		assertEquals(1, dao.deleteEmployee(101));
	}
	
	@Test
	void testEmployeeAuth() {
		System.out.println(dao.selectEmployeeAuth("A001"));
	}

}
