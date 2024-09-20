package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.PmtDcmDefaultVO;

@Mapper
public interface PmtDcmDefaultMapper {
    int deleteByPrimaryKey(Long pmtDcmNo);

    int insert(PmtDcmDefaultVO row);

    PmtDcmDefaultVO selectByPrimaryKey(Long pmtDcmNo);

    List<PmtDcmDefaultVO> selectAll();

    int updateByPrimaryKey(PmtDcmDefaultVO row);
}