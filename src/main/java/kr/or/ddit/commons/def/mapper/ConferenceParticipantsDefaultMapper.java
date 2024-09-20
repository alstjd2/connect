package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ConferenceParticipantsDefaultVO;

@Mapper
public interface ConferenceParticipantsDefaultMapper {
    int deleteByPrimaryKey(Long conparNo);

    int insert(ConferenceParticipantsDefaultVO row);

    ConferenceParticipantsDefaultVO selectByPrimaryKey(Long conparNo);

    List<ConferenceParticipantsDefaultVO> selectAll();

    int updateByPrimaryKey(ConferenceParticipantsDefaultVO row);
}