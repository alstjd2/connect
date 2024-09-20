package kr.or.ddit.web.offedu.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import lombok.extern.slf4j.Slf4j;


@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class OffeduMapperTest {

	@Autowired
	OffeduMapper map;
	
	
	@Test
	void testSelectOffeduList() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectOffeduDetail() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectOffeduNum() {
		System.out.println(map.selectOffeduNum(1));
	}

	@Test
	void testUpdateOffeduDetail() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertOffedu() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteOffedu() {
		fail("Not yet implemented");
	}

}
