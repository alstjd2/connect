package kr.or.ddit.web.RefnList.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.sound.midi.MidiDevice.Info;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

//import kr.or.ddit.web.refnList.dao.RefnListMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class RefnListMapperTest {

	@Autowired
	RefnListMapper refnMapper;
	
	@Test
	void testSelectRefnListAll() {
		assertNotNull(refnMapper.selectRefnListAll());
	}

	@Test
	void testSelectRefnListDetail() {
		log.info("{}",refnMapper.selectRefnListDetail(2));
		assertNotNull(refnMapper.selectRefnListDetail(2));
	}

	@Test
	void testUpdateRefnListDetail() {
	}

	@Test
	void testInsertRefnList() {
	}

	@Test
	void testUpdateRefnStatus() {
	}

}
