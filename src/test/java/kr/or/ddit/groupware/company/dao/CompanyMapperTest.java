package kr.or.ddit.groupware.company.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import kr.or.ddit.vo.CompanyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class CompanyMapperTest {

	@Autowired
	private CompanyMapper dao;

	@Test
	void testInsertCompany() {
		CompanyVO company = new CompanyVO();

		company.setMemNo(50);
		company.setComNm("testnm");
		company.setComBsnm("testbsnm");
		company.setComBsno("11-111-111");
		company.setComAdr("test주소");
		company.setComTel("test번호");
		company.setComGu("test타입");
		company.setComCorno(8);
//		company.setComSapr(111111111);

		dao.insertCompany(company);
	}

	@Test
	void testSelectCompanyList() {
		List<CompanyVO> list = dao.selectCompanyList();

		list.forEach((p) -> {
			log.info("list : ${}", p);
		});
	}

	@Test
	void testSelectCompany() {
		CompanyVO company = dao.selectCompany(2);
		System.out.println(company);
		
	}

	@Test
	void testUpdateCompany() {
		CompanyVO company = new CompanyVO();

		company.setMemNo(50);
		company.setComNm("test이름2");
		company.setComBsnm("test비지니스이름2");
		company.setComBsno("11-111-111");
		company.setComAdr("test주소2");
		company.setComTel("test번호2");
		company.setComGu("test타입2");
		company.setComCorno(8);
//		company.setComSapr(111111111);

		dao.updateCompany(company);
	}

	@Test
	void testDeleteCompany() {
		dao.deleteCompany(51);
	}

}
