package kr.or.ddit.web.promotion.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PromotionVO;

@Mapper
public interface PromotionMapper {

	/**
	 * 프로모션 모든 게시글 조회
	 * @return
	 */
	public List<PromotionVO> selectPromotionList();


	/**
	 * 프로모션, 사용하고 있는 전체 게시글 조회
	 * @return
	 */
	public List<PromotionVO> selectPromotionListEnable();

	/**
	 * 등록한 모든 프로모션 종류별 개수
	 * @return
	 */
	public PromotionVO selectPromotionCnt();

	/**
	 * 사용중인 프로모션 종류별 개수
	 * @return
	 */
	public PromotionVO selectPromotionCntAble();

	/**프로모션, 사용하고 있는 타입별 게시글 조회
	 * @return
	 */
	public List<PromotionVO> selectPromotionTypeListEnable(String type);

	/**
	 * 프로모션 게시글 한건 조회-회원/비회원
	 * @return
	 */


	/**
	 * 프로모션 게시글 한건 조회-프로바이더
	 * @param no
	 * @return
	 */
	public PromotionVO selectPromotionDetailPro(int no);

	/**
	 * 프로모션 수정
	 * @param promoNo
	 * @return
	 */
	public int updatePromotionDetail(int promoNo);

	/**
	 * 프로모션 추가
	 * @param promotionVo
	 * @return
	 */
	public int insertPromotion(PromotionVO promotionVo);

	/**
	 * 프로모션 삭제
	 * @param promoNo
	 * @return
	 */
	public int deletePromotion(int promoNo);

	/**
	 * 행사 세일 게시글 작성 후 실제 상품 미등록 개수
	 * @return
	 */
	public int selectNotInsertPromotion();

	/**
	 * 상품 번호로 게시물 번호 조회
	 * @return
	 */
	public int selectBoardNo(int boNo);


}
