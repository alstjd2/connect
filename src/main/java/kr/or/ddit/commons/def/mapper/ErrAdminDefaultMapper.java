package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ErrAdminDefaultVO;

@Mapper
public interface ErrAdminDefaultMapper {
    int deleteByPrimaryKey(Long errAdminNo);

    int insert(ErrAdminDefaultVO row);

    ErrAdminDefaultVO selectByPrimaryKey(Long errAdminNo);

    List<ErrAdminDefaultVO> selectAll();

    int updateByPrimaryKey(ErrAdminDefaultVO row);
}