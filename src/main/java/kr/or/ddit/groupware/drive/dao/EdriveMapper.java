package kr.or.ddit.groupware.drive.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.EdrivelogVO;

@Mapper
public interface EdriveMapper {
	
	/**
	 * 직원 한명의 개인드라이브 사용기록 조회
	 * @param empNo
	 * @return
	 */
	public List<EdrivelogVO> selectEdriveLogListByEmpNo(int empNo);
	
	
	/**
	 * 파일 및 폴더의 사용기록 DB에 등록
	 * @param file
	 * @param state
	 * @return
	 */
	public int insertEdrivelogByFile(EdrivelogVO edrivelog);
}
