package kr.or.ddit.groupware.cerificate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.CerificateVO;

@Mapper
public interface CerificateMapper {
	public int deleteCerificate(int certNo);

	public int insertCerificate(CerificateVO row);

	public CerificateVO selectCerificate(int certNo);

	public List<CerificateVO> selectAll();

	public int updateCerificate(CerificateVO row);

	public List<CerificateVO> selectCerificateList(@Param("comNo")int comNo);
}