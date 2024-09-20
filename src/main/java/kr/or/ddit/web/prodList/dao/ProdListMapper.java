package kr.or.ddit.web.prodList.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ProdListVO;
import kr.or.ddit.vo.VRevenueVO;

@Mapper
public interface ProdListMapper {

	/**
	 * @return 모든 상품에 대한 조회 (사용/불가능 구분안함)
	 */
	public List<ProdListVO> selectProdListAll();


	/**
	 * @return 기본형 상품 조회
	 */
	public List<ProdListVO> selectBasicProdList();

	/**
	 * @return 이벤트형 상품 조회
	 */
	public List<ProdListVO> selectNotBasicProdList();

	/**
	 * @return 사용중인 모든 상품에 대한 조회
	 */
	public List<ProdListVO> selectProdListAllEnable();

	/**
	 * 상품 하나건에 대한 조회
	 * @param prodNo : 상품 번호
	 * @return prodVO
	 */
	public ProdListVO selectProd(int prodNo);

	/**
	 * 상품 개수 확인
	 * @return
	 */
	public ProdListVO selectProdCnt();

	/**
	 * 상품 수정
	 * @param prodListVO : 하나의 상품 정보
	 * @return
	 */
	public int updateProd(ProdListVO prodListVO);

	/**
	 * 상품 추가
	 * @param prodListVO : 하나의 상품 정보
	 * @return
	 */
	public int insertProd(ProdListVO prodListVO);

	/**
	 * 상품 사용여부 변경
	 * @param prodNo : 상품번호
	 * @param prodAvail : 'Y' or 'N'
	 * @return
	 */
	public int updateProdAvailChange(ProdListVO prodVO);

	/**
	 * 게시글 번호로 해당 상품 조회하기
	 * @param prodEventNm
	 * @return
	 */
	public int selectProdNo(String prodEventNm);

}
