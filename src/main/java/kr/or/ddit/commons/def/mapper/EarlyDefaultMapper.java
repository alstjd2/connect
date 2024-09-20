package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.EarlyDefaultVO;

@Mapper
public interface EarlyDefaultMapper {
    int deleteByPrimaryKey(Long earlyNo);

    int insert(EarlyDefaultVO row);

    EarlyDefaultVO selectByPrimaryKey(Long earlyNo);

    List<EarlyDefaultVO> selectAll();

    int updateByPrimaryKey(EarlyDefaultVO row);
}