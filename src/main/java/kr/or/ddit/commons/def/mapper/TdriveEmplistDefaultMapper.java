package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.TdriveEmplistDefaultVO;

@Mapper
public interface TdriveEmplistDefaultMapper {
    int deleteByPrimaryKey(@Param("tdempEmpno") Long tdempEmpno, @Param("tddirNo") Long tddirNo);

    int insert(TdriveEmplistDefaultVO row);

    TdriveEmplistDefaultVO selectByPrimaryKey(@Param("tdempEmpno") Long tdempEmpno, @Param("tddirNo") Long tddirNo);

    List<TdriveEmplistDefaultVO> selectAll();

    int updateByPrimaryKey(TdriveEmplistDefaultVO row);
}