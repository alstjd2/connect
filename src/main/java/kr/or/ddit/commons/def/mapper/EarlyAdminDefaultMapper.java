package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.EarlyAdminDefaultVO;

@Mapper
public interface EarlyAdminDefaultMapper {
    int deleteByPrimaryKey(Long earlyAdminNo);

    int insert(EarlyAdminDefaultVO row);

    EarlyAdminDefaultVO selectByPrimaryKey(Long earlyAdminNo);

    List<EarlyAdminDefaultVO> selectAll();

    int updateByPrimaryKey(EarlyAdminDefaultVO row);
}