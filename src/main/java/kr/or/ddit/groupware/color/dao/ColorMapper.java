package kr.or.ddit.groupware.color.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ColorVO;

@Mapper
public interface ColorMapper {
	public ColorVO selectColor(Integer corNo);
	public List<ColorVO> selectColorList();
	public int insertColor(ColorVO color);
	public int updateColor(ColorVO color);

}
