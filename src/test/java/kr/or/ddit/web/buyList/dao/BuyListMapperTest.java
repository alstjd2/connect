package kr.or.ddit.web.buyList.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.BuyListVO;
import lombok.extern.slf4j.Slf4j;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class BuyListMapperTest {

	@Autowired
	BuyListMapper buyMapper;
	
	@Test
	void testSelectBuyList() {
		assertNotNull(buyMapper.selectBuyList(1));
	}

	@Test
	void testSelectBuyListAll() {
		assertNotNull(buyMapper.selectBuyListAll());
	}

	@Test
	void testSelectBuyListNotRefAll() {
		assertNotNull(buyMapper.selectBuyListNotRefAll());
	}

	@Test
	void testInsertBuyList() {
		BuyListVO buyVo = new BuyListVO();
		
		buyVo.setComNo(1);
		buyVo.setProdNo(1);

		assertNotEquals(0, buyMapper.insertBuyList(buyVo));
	}

	@Test
	void testUpdateBuyRefnChange() {
		
		assertNotEquals(0, buyMapper.updateBuyRefnChange(1));
	}

}
