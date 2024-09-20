package kr.or.ddit.web.RefnList.service;

import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.web.RefnList.dao.RefnListMapper;

@Service
public class RefnListServiceImpl implements RefnListService{

	@Autowired
	private RefnListMapper refnMapper;

	/**
	 * 환불 이유 통계
	 */
	public Map<String, Integer> RefnListCnt() {
		Map<String, Integer> refnTypeCnt = new HashedMap<>();
		int AA01150 = refnMapper.selectContentCnt("AA01150"); 	// 단순변심
		int AA01110 = refnMapper.selectContentCnt("AA01110");	// 상품불만족
		int AA01120 = refnMapper.selectContentCnt("AA01120");	// 비용불만족
		int AA01130 = refnMapper.selectContentCnt("AA01130");	// 서비스불만족
		int AA01140 = refnMapper.selectContentCnt("AA01140");	// 잦은에러
		int AA01160 = refnMapper.selectContentCnt("AA01160");	// 기타

		refnTypeCnt.put("단순변심", AA01150);
		refnTypeCnt.put("상품불만족", AA01110);
		refnTypeCnt.put("비용불만족", AA01120);
		refnTypeCnt.put("서비스불만족", AA01130);
		refnTypeCnt.put("잦은에러", AA01140);
		refnTypeCnt.put("기타", AA01160);

		return refnTypeCnt;
	}


	public void RefnListModify(String[] buyNo) {
		//구매한 상품 refn > Y로 변경
		// refnList에 넣기 >> 환불 사유 필요함

	}

}
