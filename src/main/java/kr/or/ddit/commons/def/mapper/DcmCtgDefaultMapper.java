package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.DcmCtgDefaultVO;

@Mapper
public interface DcmCtgDefaultMapper {
    int deleteByPrimaryKey(Long dcmCtgNo);

    int insert(DcmCtgDefaultVO row);

    DcmCtgDefaultVO selectByPrimaryKey(Long dcmCtgNo);

    List<DcmCtgDefaultVO> selectAll();

    int updateByPrimaryKey(DcmCtgDefaultVO row);
}