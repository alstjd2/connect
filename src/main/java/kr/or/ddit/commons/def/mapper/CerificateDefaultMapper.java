package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.CerificateDefaultVO;

@Mapper
public interface CerificateDefaultMapper {
    int deleteByPrimaryKey(Long certNo);

    int insert(CerificateDefaultVO row);

    CerificateDefaultVO selectByPrimaryKey(Long certNo);

    List<CerificateDefaultVO> selectAll();

    int updateByPrimaryKey(CerificateDefaultVO row);
}