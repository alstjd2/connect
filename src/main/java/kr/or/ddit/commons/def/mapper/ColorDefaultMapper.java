package kr.or.ddit.commons.def.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.ColorDefaultVO;

@Mapper
public interface ColorDefaultMapper {
    int deleteByPrimaryKey(Long corNo);

    int insert(ColorDefaultVO row);

    ColorDefaultVO selectByPrimaryKey(Long corNo);

    List<ColorDefaultVO> selectAll();

    int updateByPrimaryKey(ColorDefaultVO row);
}