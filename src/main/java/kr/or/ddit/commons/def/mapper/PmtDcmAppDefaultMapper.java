package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.PmtDcmAppDefaultVO;

@Mapper
public interface PmtDcmAppDefaultMapper {
    int deleteByPrimaryKey(Long pmtDcmAppNo);

    int insert(PmtDcmAppDefaultVO row);

    PmtDcmAppDefaultVO selectByPrimaryKey(Long pmtDcmAppNo);

    List<PmtDcmAppDefaultVO> selectAll();

    int updateByPrimaryKey(PmtDcmAppDefaultVO row);
}