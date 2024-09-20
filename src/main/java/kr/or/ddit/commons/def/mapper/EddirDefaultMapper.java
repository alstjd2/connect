package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.EddirDefaultVO;

@Mapper
public interface EddirDefaultMapper {
    int deleteByPrimaryKey(@Param("eddirNo") Long eddirNo, @Param("empNo") Long empNo);

    int insert(EddirDefaultVO row);

    EddirDefaultVO selectByPrimaryKey(@Param("eddirNo") Long eddirNo, @Param("empNo") Long empNo);

    List<EddirDefaultVO> selectAll();

    int updateByPrimaryKey(EddirDefaultVO row);
}