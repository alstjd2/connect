package kr.or.ddit.web.buyList.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.web.buyList.dao.BuyListMapper;
import lombok.extern.slf4j.Slf4j;
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class BuyListServiceTest {
	@Autowired
	BuyListMapper buyMapper;
	@Test
	void testCal() {
		int month = buyMapper.selectBuyProd(1);
		//연간건
		int year = buyMapper.selectBuyProd(2);
		//모든건수
		int total = buyMapper.selectBuyTotal();
		//이벤트
		int event = total-(month+year);

		double mProd =month*100/total;
		double yProd =year*100/total;
		double eProd =event*100/total;

		log.info("mProd{}",mProd);
		log.info("yProd{}",yProd);
		log.info("eProd{}",eProd);
	}

}
