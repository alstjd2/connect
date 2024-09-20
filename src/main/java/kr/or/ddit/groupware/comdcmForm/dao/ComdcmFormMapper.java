package kr.or.ddit.groupware.comdcmForm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ComdcmFormVO;

@Mapper
public interface ComdcmFormMapper {

	public int deleteComdcmForm(int FormNo);
	
	public int insertComdcmForm(ComdcmFormVO formVO);
	
	public int updateComdcmForm(ComdcmFormVO formVO);
	
	public ComdcmFormVO selectComdcmForm(String formCode);
	
	public List<ComdcmFormVO> selectComdcmFormAll();
}
