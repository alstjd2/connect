package kr.or.ddit.web.promotion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.PromotionVO;
import kr.or.ddit.web.promotion.dao.PromotionMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PromotionServiceImpl implements PromotionService{

	@Autowired
	PromotionMapper mapper;


	/**
	 * 온라인/오프라인/할인행사 별 게시글 조회
	 * @param tabs = sale(EB06110),off(EB06120) ,on(EB06130)
	 * @return 타입별 모든 게시글
	 */
	public List<PromotionVO> PromotionTypeList(String tabs){
		if ("sale".equals(tabs)) tabs = "EB06110";
		else if("off".equals(tabs)) tabs = "EB06120";
		else tabs = "EB06130";

		return mapper.selectPromotionTypeListEnable(tabs);
	}

	/**
	 * 프로모션 등록
	 * @param promotion
	 * @return
	 */
	public int InsertPromotion(PromotionVO promotion) {


		return mapper.insertPromotion(promotion);
	}





}
