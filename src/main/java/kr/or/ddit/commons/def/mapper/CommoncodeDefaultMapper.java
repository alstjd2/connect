package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.CommoncodeDefaultVO;

@Mapper
public interface CommoncodeDefaultMapper {
    int deleteByPrimaryKey(String conmcNo);

    int insert(CommoncodeDefaultVO row);

    CommoncodeDefaultVO selectByPrimaryKey(String conmcNo);

    List<CommoncodeDefaultVO> selectAll();

    int updateByPrimaryKey(CommoncodeDefaultVO row);
}