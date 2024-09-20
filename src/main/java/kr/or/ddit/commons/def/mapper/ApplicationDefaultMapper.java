package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.ApplicationDefaultVO;

@Mapper
public interface ApplicationDefaultMapper {
    int deleteByPrimaryKey(@Param("appNo") Long appNo, @Param("empNo") Long empNo, @Param("vaciNo") Long vaciNo);

    int insert(ApplicationDefaultVO row);

    ApplicationDefaultVO selectByPrimaryKey(@Param("appNo") Long appNo, @Param("empNo") Long empNo, @Param("vaciNo") Long vaciNo);

    List<ApplicationDefaultVO> selectAll();

    int updateByPrimaryKey(ApplicationDefaultVO row);
}