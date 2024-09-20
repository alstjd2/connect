package kr.or.ddit.web.buyList.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.BuyListVO;
import kr.or.ddit.web.buyList.dao.BuyListMapper;

@Service
public class BuyListService {

	@Autowired
	BuyListMapper buyMapper;

	/**
	 * 상품별 판매 퍼센트 추출
	 * @return
	 */
//	public Map<String, Double> cal() {
	public Map<String, Integer> cal() {
		//월간건
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

//		Map<String, Double> prodBuy = new HashMap<>();
//		prodBuy.put("mProd", mProd);
//		prodBuy.put("yProd", yProd);
//		prodBuy.put("eProd", eProd);

		Map<String, Integer> prodBuy = new HashMap<>();
		prodBuy.put("mProd", month);
		prodBuy.put("yProd", year);
		prodBuy.put("eProd", event);

		return prodBuy;
	}

	/**
	 * 환불건수
	 * @return
	 */
	public int refnBuy(){
		int total = buyMapper.selectBuyTotal();
		int buyCnt = buyMapper.selectBuyCnt();
		int refnCnt = total-buyCnt;

		return refnCnt;
	}


	public List<Map<String, Object>> selectAbleRefn(int comNo){
		 List<BuyListVO> buyList = buyMapper.selectAbleRefn(comNo);
		 List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();

		 for(BuyListVO buy : buyList) {

			 Map<String, Object> map = new HashedMap<String, Object>();

			 SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
			 String buyDate = buy.getBuyDate().split(" ")[0];

			 String buyUseStartDate =   buy.getBuyUseStartDate().substring(0, 4)
					 					+"-"+buy.getBuyUseStartDate().substring(4, 6)
					 					+"-"+buy.getBuyUseStartDate().substring(6);
			 String buyUseEndDate =  buy.getBuyUseEndDate().substring(0, 4)
	 					+"-"+buy.getBuyUseEndDate().substring(4, 6)
	 					+"-"+buy.getBuyUseEndDate().substring(6);

			 map.put("buyNo", buy.getBuyNo());
			 map.put("buyDate", buyDate);
			 map.put("buyUseStartDate", buyUseStartDate);
			 map.put("buyUseEndDate", buyUseEndDate);

			 list.add(map);
		 }

		 return list;

	}
}
