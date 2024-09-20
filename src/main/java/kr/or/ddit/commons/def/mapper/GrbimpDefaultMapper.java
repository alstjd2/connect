package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.GrbimpDefaultVO;

@Mapper
public interface GrbimpDefaultMapper {
    int deleteByPrimaryKey(Long grbimpNo);

    int insert(GrbimpDefaultVO row);

    GrbimpDefaultVO selectByPrimaryKey(Long grbimpNo);

    List<GrbimpDefaultVO> selectAll();

    int updateByPrimaryKey(GrbimpDefaultVO row);
}