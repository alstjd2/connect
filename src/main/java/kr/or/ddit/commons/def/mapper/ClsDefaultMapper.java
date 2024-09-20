package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ClsDefaultVO;

@Mapper
public interface ClsDefaultMapper {
    int deleteByPrimaryKey(Long clsNo);

    int insert(ClsDefaultVO row);

    ClsDefaultVO selectByPrimaryKey(Long clsNo);

    List<ClsDefaultVO> selectAll();

    int updateByPrimaryKey(ClsDefaultVO row);
}