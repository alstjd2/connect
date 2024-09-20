package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.MemberDefaultVO;

@Mapper
public interface MemberDefaultMapper {
    int deleteByPrimaryKey(Long memNo);

    int insert(MemberDefaultVO row);

    MemberDefaultVO selectByPrimaryKey(Long memNo);

    List<MemberDefaultVO> selectAll();

    int updateByPrimaryKey(MemberDefaultVO row);
}