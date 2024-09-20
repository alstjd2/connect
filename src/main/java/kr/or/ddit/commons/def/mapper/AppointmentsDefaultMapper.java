package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.AppointmentsDefaultVO;

@Mapper
public interface AppointmentsDefaultMapper {
    int deleteByPrimaryKey(Long apmNo);

    int insert(AppointmentsDefaultVO row);

    AppointmentsDefaultVO selectByPrimaryKey(Long apmNo);

    List<AppointmentsDefaultVO> selectAll();

    int updateByPrimaryKey(AppointmentsDefaultVO row);
}