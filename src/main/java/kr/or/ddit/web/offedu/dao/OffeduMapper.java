package kr.or.ddit.web.offedu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.OffeduVO;

@Mapper
public interface OffeduMapper {

	/**
	 * 오프라인 모두 조회
	 * @return
	 */
	public List<OffeduVO> selectOffeduList();


	/**
	 * 해당 교육 기업별 총 신청인원
	 * @return
	 */
	public List<OffeduVO> selectOffeduList(int promoNo);


	public List<OffeduVO> selectOffeduListDetail(int promoNo);

	/**
	 * 오프라인 한건 조회
	 * @param offeduNo
	 * @return
	 */
	public OffeduVO selectOffeduDetail(int offeduNo);

	/**
	 * 해당 교육 총 신청인원
	 * @param promoNo
	 * @return
	 */
	public int selectOffeduNum(int promoNo);

	/**
	 * 오프라인 수정
	 * @param offeduVo
	 * @return
	 */
	public int updateOffeduDetail(OffeduVO offeduVo);

	/**
	 * 오프라인 추가
	 * @param offeduVo
	 * @return
	 */
	public int insertOffedu(OffeduVO offeduVo);

	/**
	 * 오프라인 삭제
	 * @param offeduNo
	 * @return
	 */
	public int deleteOffedu(int offeduNo);



}
