package kr.or.ddit.groupware.cls.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ClsVO;

@Mapper
public interface ClsMapper {
	public ClsVO selectCls(Integer clsNo);
	public List<ClsVO> selectClsList();
	public int insertCls(ClsVO cls);
	public int updateCls(ClsVO cls);
	public int deleteCls(Integer clsNo);

}
