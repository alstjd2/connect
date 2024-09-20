package kr.or.ddit.commons.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import kr.or.ddit.attachifile.dao.AttachfileMapper;
import kr.or.ddit.vo.AttachfileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class AttachfileMapperTest {
	@Autowired
	AttachfileMapper dao;
	
	@Test
	void testInsertAttachfile() {
		AttachfileVO att = new AttachfileVO();
		
		assertEquals(1, dao.insertAttachfile(att));
	}

	@Test
	void testSelectAttachfileList() {
		List<AttachfileVO> list = new ArrayList();
		
		list = dao.selectAttachfileList();
		
		list.forEach((p)->{
			log.info("att : {}", p);
		});
	}

	@Test
	void testSelectAttachfile() {
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		
		System.out.println(encoder.encode("java"));
	}

	@Test
	void testUpdateAttachfile() {
	}

	@Test
	void testDeleteAttachfile() {
	}

}
