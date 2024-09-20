package kr.or.ddit.web.prodList.dao;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.vo.ProdListVO;
import lombok.extern.slf4j.Slf4j;


@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class ProdListMapperTest {
	
	@Autowired
	ProdListMapper prodMapper;
	
	@Test
	void testProdListAll() {
		assertNotNull(prodMapper.selectProdListAll());
	}

	@Test
	void testSelectProdListAllEnable() {
		assertNotNull(prodMapper.selectProdListAllEnable());
	}

	@Test
	void testSelectProd() {
		int i = 1;
		assertNotNull(prodMapper.selectProd(i));
	}

	@Test
	void testUpdateProd() {
		ProdListVO prod = new ProdListVO();
		prod = prodMapper.selectProd(3);
		prod.setProdEventNm("테스트용3");
		
		assertNotEquals(0, prodMapper.updateProd(prod));
	}

	@Test
	void testInsertProd() {
		ProdListVO prod = new ProdListVO();
		prod.setProdNm("insert 테스트");
		prod.setProdPrice(5000);
		prod.setProdDetailContent1("임시");
		
		assertNotEquals(0, prodMapper.insertProd(prod));
	}
	
	@Test
	void testUpdateProdAvailChange() {
		ProdListVO prod = new ProdListVO();
		prod = prodMapper.selectProd(3);
		prod.setProdAvail("Y");
		
		assertNotEquals(0, prodMapper.updateProdAvailChange(prod));
	}
	
}
