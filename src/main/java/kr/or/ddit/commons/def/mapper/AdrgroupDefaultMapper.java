package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.AdrgroupDefaultVO;

@Mapper
public interface AdrgroupDefaultMapper {
    int deleteByPrimaryKey(Long grpNo);

    int insert(AdrgroupDefaultVO row);

    AdrgroupDefaultVO selectByPrimaryKey(Long grpNo);

    List<AdrgroupDefaultVO> selectAll();

    int updateByPrimaryKey(AdrgroupDefaultVO row);
}