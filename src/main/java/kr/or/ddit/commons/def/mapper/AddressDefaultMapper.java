package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.AddressDefaultVO;

@Mapper
public interface AddressDefaultMapper {
    int deleteByPrimaryKey(Long adrNo);

    int insert(AddressDefaultVO row);

    AddressDefaultVO selectByPrimaryKey(Long adrNo);

    List<AddressDefaultVO> selectAll();

    int updateByPrimaryKey(AddressDefaultVO row);
}