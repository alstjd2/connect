package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.PmtLineDefaultVO;

@Mapper
public interface PmtLineDefaultMapper {
    int deleteByPrimaryKey(Long pmtLineNo);

    int insert(PmtLineDefaultVO row);

    PmtLineDefaultVO selectByPrimaryKey(Long pmtLineNo);

    List<PmtLineDefaultVO> selectAll();

    int updateByPrimaryKey(PmtLineDefaultVO row);
}