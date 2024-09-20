package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.MsgroomDefaultVO;

@Mapper
public interface MsgroomDefaultMapper {
    int deleteByPrimaryKey(Long msgrmNo);

    int insert(MsgroomDefaultVO row);

    MsgroomDefaultVO selectByPrimaryKey(Long msgrmNo);

    List<MsgroomDefaultVO> selectAll();

    int updateByPrimaryKey(MsgroomDefaultVO row);
}