package kr.or.ddit.groupware.comdcmNum.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ComdcmNumVO;

@Mapper
public interface ComdcmNumMapper {

	/**
	 * 기업 문서 번호 전체 조회
	 * @return
	 */
	public List<ComdcmNumVO> selectComdcmNumAll();
	
	/**
	 * 기업 문서 번호 상세 조회
	 * @return
	 */
	public ComdcmNumVO selectComdcmNum(int comNo);
	
	/**
	 * 기업 문서 번호 수정
	 * @param comdcm
	 * @return
	 */
	public int updateComdcmNum(ComdcmNumVO comdcm);
	
	/**
	 * 기업 문서 번호 삽입
	 * @param comdcmNo
	 * @return
	 */
	public int insertComdcmNum(int comdcmNo);
	
	/**
	 * 기업 문서 번호 삭제
	 * @param comdcmNo
	 * @return
	 */
	public int deleteComdcmNum(int comdcmNo);
	
	public void updateComdcmCount(ComdcmNumVO comdcm);
	
}
