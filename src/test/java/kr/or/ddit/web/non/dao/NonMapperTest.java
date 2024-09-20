package kr.or.ddit.web.non.dao;

import org.junit.jupiter.api.Test;

import kr.or.ddit.vo.NonVO;

class NonMapperTest {

	@Test
	void testInsertNon() {
		NonVO non = new NonVO();
		non.setNonNm("지민성");
		non.setNonContent("지민성");
		non.setNonEmail("지민성");
		non.setNonNo(35);
		non.setNonTitle("제목");
		non.setNonPerinfocollection("Y");
//		assertNotEquals(0, pmtMap.insertPmtLine(pmt));
	}

}
