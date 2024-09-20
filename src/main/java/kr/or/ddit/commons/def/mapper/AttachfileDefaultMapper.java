package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.AttachfileDefaultVO;

@Mapper
public interface AttachfileDefaultMapper {
    int deleteByPrimaryKey(Long attNo);

    int insert(AttachfileDefaultVO row);

    AttachfileDefaultVO selectByPrimaryKey(Long attNo);

    List<AttachfileDefaultVO> selectAll();

    int updateByPrimaryKey(AttachfileDefaultVO row);
}