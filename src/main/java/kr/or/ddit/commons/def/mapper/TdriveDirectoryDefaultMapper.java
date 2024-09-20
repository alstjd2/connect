package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.TdriveDirectoryDefaultVO;

@Mapper
public interface TdriveDirectoryDefaultMapper {
    int deleteByPrimaryKey(Long tddirNo);

    int insert(TdriveDirectoryDefaultVO row);

    TdriveDirectoryDefaultVO selectByPrimaryKey(Long tddirNo);

    List<TdriveDirectoryDefaultVO> selectAll();

    int updateByPrimaryKey(TdriveDirectoryDefaultVO row);
}