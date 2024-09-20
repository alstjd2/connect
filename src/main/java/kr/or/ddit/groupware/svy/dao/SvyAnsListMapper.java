package kr.or.ddit.groupware.svy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.SvyAnsListVO;

@Mapper
public interface SvyAnsListMapper {
	
	
	/**
	 * 이게 너무 애매해서 이렇게 해놨어요ㅠㅠ selectSvyAnsTotalList로 할게요..ㅎ
	 * 전체 목록 
	 * @return
	 */
	public List<SvyAnsListVO> selectSvyAnsTotalList();
	

	/**
	 * 
	 * 
	 * 상세조회
	 * @param svyNo
	 * @param clsNo
	 * @param svyAnsNo
	 * @return
	 */
	public SvyAnsListVO selectSvyAnsList(@Param("svyNo") int svyNo, @Param("svyAnsNo") int svyAnsNo, @Param("clsNo") int clsNo);
	
	
	/**
	 * 등록
	 * @param svyAnsList
	 * @return
	 */
	public int insertSvyAnsList(SvyAnsListVO svyAnsList);
	
	/**
	 * 수정
	 * @param svyAnsList
	 * @return
	 */
	public int updateSvyAnsList(SvyAnsListVO svyAnsList);
	
	/**
	 * 키 세개라 VO로 받음
	 * 
	 * 삭제
	 * @param svyNo
	 * @param clsNo
	 * @param svyAnsNo
	 * @return
	 */
	public int deleteSvyAnsList(@Param("svyNo") int svyNo, @Param("svyAnsNo") int svyAnsNo, @Param("clsNo") int clsNo);
	
}
