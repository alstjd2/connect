package kr.or.ddit.web.promotion.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.PromotionVO;
import lombok.extern.slf4j.Slf4j;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class PromotionServiceTest {

	@Autowired
	PromotionService service;
	
	@Test
	void testPromotionTypeList() {
		List<PromotionVO> pro = service.PromotionTypeList("sale");
		log.info("{}",pro);
	}

}
