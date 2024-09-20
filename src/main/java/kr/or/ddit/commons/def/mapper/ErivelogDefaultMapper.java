package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ErivelogDefaultVO;

@Mapper
public interface ErivelogDefaultMapper {
    int deleteByPrimaryKey(Long drivelogNo);

    int insert(ErivelogDefaultVO row);

    ErivelogDefaultVO selectByPrimaryKey(Long drivelogNo);

    List<ErivelogDefaultVO> selectAll();

    int updateByPrimaryKey(ErivelogDefaultVO row);
}