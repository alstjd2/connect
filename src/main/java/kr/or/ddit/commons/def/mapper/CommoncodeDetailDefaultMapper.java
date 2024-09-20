package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.CommoncodeDetailDefaultVO;

@Mapper
public interface CommoncodeDetailDefaultMapper {
    int deleteByPrimaryKey(@Param("conmcdNo") String conmcdNo, @Param("conmcNo") String conmcNo);

    int insert(CommoncodeDetailDefaultVO row);

    CommoncodeDetailDefaultVO selectByPrimaryKey(@Param("conmcdNo") String conmcdNo, @Param("conmcNo") String conmcNo);

    List<CommoncodeDetailDefaultVO> selectAll();

    int updateByPrimaryKey(CommoncodeDetailDefaultVO row);
}