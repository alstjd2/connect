package kr.or.ddit.web.promotion.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import lombok.extern.slf4j.Slf4j;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class PromotionMapperTest {

	@Autowired
	PromotionMapper map;
	
	@Test
	void testSelectPromotionTypeListEnable() {
		log.info("{}",map.selectPromotionTypeListEnable("sale"));
	}

}
