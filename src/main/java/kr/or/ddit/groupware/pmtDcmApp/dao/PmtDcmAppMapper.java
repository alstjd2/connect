package kr.or.ddit.groupware.pmtDcmApp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PmtDcmAppVO;

@Mapper
public interface PmtDcmAppMapper {

	public int deletePmtDcmApp(int pmtDcmAppNo);
	
	public int insertPmtDcmApp(PmtDcmAppVO pmtDcmAppNo);
	
	public int updatePmtDcmApp(PmtDcmAppVO pmtDcmAppNo);
	
	public int updatePmtDcmAppLine(PmtDcmAppVO pmtDcmAppNo);
	
	public PmtDcmAppVO selectPmtDcmApp(int pmtDcmAppNo);
	
	public List<PmtDcmAppVO> selectPmtDcmAppAll(int pmtDcmNo);
	
}
