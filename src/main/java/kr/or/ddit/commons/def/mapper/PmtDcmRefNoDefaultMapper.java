package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.PmtDcmRefNoDefaultVO;

@Mapper
public interface PmtDcmRefNoDefaultMapper {
    int deleteByPrimaryKey(Long pmtDcmRefNo);

    int insert(PmtDcmRefNoDefaultVO row);

    PmtDcmRefNoDefaultVO selectByPrimaryKey(Long pmtDcmRefNo);

    List<PmtDcmRefNoDefaultVO> selectAll();

    int updateByPrimaryKey(PmtDcmRefNoDefaultVO row);
}