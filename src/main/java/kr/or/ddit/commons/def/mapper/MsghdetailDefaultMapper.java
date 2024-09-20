package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.MsghdetailDefaultVO;

@Mapper
public interface MsghdetailDefaultMapper {
    int deleteByPrimaryKey(Long msghdNo);

    int insert(MsghdetailDefaultVO row);

    MsghdetailDefaultVO selectByPrimaryKey(Long msghdNo);

    List<MsghdetailDefaultVO> selectAll();

    int updateByPrimaryKey(MsghdetailDefaultVO row);
}