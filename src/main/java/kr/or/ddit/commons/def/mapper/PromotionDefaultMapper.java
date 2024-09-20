package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.PromotionDefaultVO;

@Mapper
public interface PromotionDefaultMapper {
    int deleteByPrimaryKey(Long promoNo);

    int insert(PromotionDefaultVO row);

    PromotionDefaultVO selectByPrimaryKey(Long promoNo);

    List<PromotionDefaultVO> selectAll();

    int updateByPrimaryKey(PromotionDefaultVO row);
}