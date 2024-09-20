package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.EmployeeDefaultVO;

@Mapper
public interface EmployeeDefaultMapper {
    int deleteByPrimaryKey(@Param("empNo") Long empNo, @Param("comNo") Long comNo);

    int insert(EmployeeDefaultVO row);

    EmployeeDefaultVO selectByPrimaryKey(@Param("empNo") Long empNo, @Param("comNo") Long comNo);

    List<EmployeeDefaultVO> selectAll();

    int updateByPrimaryKey(EmployeeDefaultVO row);
}