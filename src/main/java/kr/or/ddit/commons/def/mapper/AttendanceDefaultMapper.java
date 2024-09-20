package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.AttendanceDefaultVO;

@Mapper
public interface AttendanceDefaultMapper {
    int deleteByPrimaryKey(@Param("attNo") Long attNo, @Param("empNo") Long empNo);

    int insert(AttendanceDefaultVO row);

    AttendanceDefaultVO selectByPrimaryKey(@Param("attNo") Long attNo, @Param("empNo") Long empNo);

    List<AttendanceDefaultVO> selectAll();

    int updateByPrimaryKey(AttendanceDefaultVO row);
}