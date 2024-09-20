package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ConferenceLogDefaultVO;

@Mapper
public interface ConferenceLogDefaultMapper {
    int deleteByPrimaryKey(Long conlogNo);

    int insert(ConferenceLogDefaultVO row);

    ConferenceLogDefaultVO selectByPrimaryKey(Long conlogNo);

    List<ConferenceLogDefaultVO> selectAll();

    int updateByPrimaryKey(ConferenceLogDefaultVO row);
}