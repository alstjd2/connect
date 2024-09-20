package kr.or.ddit.commons.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import kr.or.ddit.attachifile.dao.AttDetailMapper;
import kr.or.ddit.vo.AttDetailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class AttDetailMapperTest {
	@Autowired
	AttDetailMapper dao;
	
	@Test
	void testInsertAttDetail() {
		AttDetailVO attd = new AttDetailVO();
		
		attd.setAttNo(2);
		attd.setAttdQrinm("test원래이름");
		attd.setAttdSavenm("test저장이름");
		attd.setAttdPath("test경로");
		attd.setAttdExe("test확장자");
		attd.setAttdSize("test사이즈");
		
		assertEquals(1, dao.insertAttDetail(attd));
	}

	@Test
	void testSelectAttDetailList() {
		List<AttDetailVO> list = new ArrayList();
		
		list = dao.selectAttDetailList();
		
		list.forEach((p)->{
			log.info("att : {}", p);
		});
	}

	@Test
	void testSelectAttDetail() {
	}

	@Test
	void testUpdateAttDetail() {
	}

	@Test
	void testDeleteAttDetail() {
	}

}
