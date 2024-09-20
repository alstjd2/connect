package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ConferenceDefaultVO;

@Mapper
public interface ConferenceDefaultMapper {
    int deleteByPrimaryKey(Long conNo);

    int insert(ConferenceDefaultVO row);

    ConferenceDefaultVO selectByPrimaryKey(Long conNo);

    List<ConferenceDefaultVO> selectAll();

    int updateByPrimaryKey(ConferenceDefaultVO row);
}