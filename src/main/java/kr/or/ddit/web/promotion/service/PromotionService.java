package kr.or.ddit.web.promotion.service;

import java.util.List;

import kr.or.ddit.vo.PromotionVO;

public interface PromotionService {
	public List<PromotionVO> PromotionTypeList(String tabs);
	public int InsertPromotion(PromotionVO promotion);
}
