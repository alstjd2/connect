package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.BuyListDefaultVO;

@Mapper
public interface BuyListDefaultMapper {
    int insert(BuyListDefaultVO row);

    List<BuyListDefaultVO> selectAll();
}