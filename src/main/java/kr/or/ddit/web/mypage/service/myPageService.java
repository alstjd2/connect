package kr.or.ddit.web.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.BuyListVO;
import kr.or.ddit.web.buyList.dao.BuyListMapper;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class myPageService {

	@Autowired
	BuyListMapper buyMapper;

	/**
	 * 구매 리스트 개수 조회
	 * @param comNo
	 * @return
	 */
	public int totalBuyListRetrive(int comNo) {
		int cnt=0;
		List<BuyListVO> buyList = buyMapper.selectComBuyList(comNo);
		return buyList.size();
	}

}
