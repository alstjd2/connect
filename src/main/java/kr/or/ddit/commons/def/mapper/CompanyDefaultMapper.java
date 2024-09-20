package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.CompanyDefaultVO;

@Mapper
public interface CompanyDefaultMapper {
    int deleteByPrimaryKey(Long comNo);

    int insert(CompanyDefaultVO row);

    CompanyDefaultVO selectByPrimaryKey(Long comNo);

    List<CompanyDefaultVO> selectAll();

    int updateByPrimaryKey(CompanyDefaultVO row);
}