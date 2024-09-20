package kr.or.ddit.groupware.svy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.SvyAskVO;

@Mapper
public interface SvyAskMapper {
	
	/**
	 * 설문답변자 리스트 전체 조회
	 * @return
	 */
	public List<SvyAskVO> selectsvyAskList();
	
	/**
	 * 설문답변자 상세 조회
	 * @param svyAskNo
	 * @param svyNo
	 * @return
	 */
	public SvyAskVO selectSvyAsk(@Param("svyNo") int svyNo);
	
	
	/**
	 *  등록
	 * @param svyAsk
	 * @return
	 */
	public int insertSvyAsk(SvyAskVO svyAsk);
	
	/**
	 * 수정
	 * @param svyAsk
	 * @return
	 */
	public int updatesvyAsk(SvyAskVO svyAsk);

	
	/**
	 * 삭제
	 * @param svyAskNo
	 * @param svyNo
	 * @return
	 */
	public int deleteSvyAsk(@Param("svyAskNo")int svyAskNo, @Param("svyNo") int svyNo);
}
