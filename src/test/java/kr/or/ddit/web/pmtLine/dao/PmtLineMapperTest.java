package kr.or.ddit.web.pmtLine.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

//import kr.or.ddit.groupware.pmtLine.dao.PmtLineMapper;
import kr.or.ddit.vo.PmtLineVO;
import lombok.extern.slf4j.Slf4j;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Slf4j
class PmtLineMapperTest {

	
	@Test
	void testDeletePmtLine() {
	}

	@Test
	void testInsertPmtLine() {
		PmtLineVO pmt = new PmtLineVO();
		pmt.setPmtLineNo(2);
		pmt.setComNo(2);
		pmt.setEmpNo(2);
		pmt.setPmtLineOneId(4);
		pmt.setPmtLineTwoId(4);
		pmt.setPmtLineYn("Y");
		
//		assertNotEquals(0, pmtMap.insertPmtLine(pmt));
	}

	@Test
	void testUpdatePmtLine() {
		PmtLineVO pmt = new PmtLineVO();
		pmt.setPmtLineNo(2);
		pmt.setComNo(2);
		pmt.setEmpNo(2);
		pmt.setPmtLineOneId(4);
		pmt.setPmtLineTwoId(4);
		pmt.setPmtLineYn("N");
		
//		assertNotEquals(0, pmtMap.updatePmtLine(pmt));
	}

	@Test
	void testSelectPmtLineDetail() {
//		assertNotNull(pmtMap.selectPmtLineDetail(1));
	}

	@Test
	void testSelectPmtLineList() {
//		assertNotNull(pmtMap.selectPmtLineList());
	}

}
