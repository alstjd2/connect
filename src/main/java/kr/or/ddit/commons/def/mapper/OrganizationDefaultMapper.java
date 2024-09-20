package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.OrganizationDefaultVO;

@Mapper
public interface OrganizationDefaultMapper {
    int deleteByPrimaryKey(Long orgNo);

    int insert(OrganizationDefaultVO row);

    OrganizationDefaultVO selectByPrimaryKey(Long orgNo);

    List<OrganizationDefaultVO> selectAll();

    int updateByPrimaryKey(OrganizationDefaultVO row);
}