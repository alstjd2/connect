package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.OffeduDefaultVO;

@Mapper
public interface OffeduDefaultMapper {
    int deleteByPrimaryKey(Long offeduNo);

    int insert(OffeduDefaultVO row);

    OffeduDefaultVO selectByPrimaryKey(Long offeduNo);

    List<OffeduDefaultVO> selectAll();

    int updateByPrimaryKey(OffeduDefaultVO row);
}