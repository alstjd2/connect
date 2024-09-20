package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.GroupEmployeeDefaultVO;

@Mapper
public interface GroupEmployeeDefaultMapper {
    int deleteByPrimaryKey(@Param("empNo") Long empNo, @Param("grpNo") Long grpNo);

    int insert(GroupEmployeeDefaultVO row);

    List<GroupEmployeeDefaultVO> selectAll();
}