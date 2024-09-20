package kr.or.ddit.web.buyList.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.BuyListVO;
import kr.or.ddit.vo.VRevenueVO;

@Mapper
public interface BuyListMapper {

	/**
	 * 구매내역 한건에 대한 조회
	 * @param buyNo
	 * @return
	 */
	public BuyListVO selectBuyList(int buyNo);

	/**
	 * 마지막 구매 상품의 만료날짜를 조회
	 * @param comNo
	 * @return 만료날짜 String date(yyyymmdd)
	 */
	public String selectBuyUse(int comNo);

	/**
	 * 모든 구매내역 조회
	 * @return
	 */
	public List<BuyListVO> selectBuyListAll();

	/**
	 * 해당 회사에 대한 구매내역 조회
	 * @return
	 */
	public List<BuyListVO> selectComBuyList(int comNo);

	/**
	 * 환불안한 모든 구매내역 조회
	 * @return
	 */
	public List<BuyListVO> selectBuyListNotRefAll();

	/**
	 * 구매내역 등록
	 * @return
	 */
	public int insertBuyList(BuyListVO buyVo);

	/**
	 * 구매내역 환불여부 변경(N->Y)
	 * @return
	 */
	public int updateBuyRefnChange(int buyNo);

	/**
	 * 년월별 판매내역
	 * @return
	 */
	public List<VRevenueVO> selectRevenue();

	/**
	 *  구매한 모든 건수
	 * @return
	 */
	public int selectBuyTotal();

	/**
	 * 환불안한 구매건수
	 * @return
	 */
	public int selectBuyCnt();

	/**
	 * 상품별 구매건수
	 * @return
	 */
	public int selectBuyProd(int prodNo);


	/**
	 * 환불 그래프 값
	 * @return
	 */
	public List<VRevenueVO> selectRefnCnt();


	/**
	 * 결제완료시 결제완료컬럼 수정  N->Y
	 * @param tid
	 * @return
	 */
	public int updateBuyListTS(String tid);


	/**
	 * 프로바이더페이지 상품 할인 구매현황 조회
	 * @param tid
	 * @return
	 */
	public List<BuyListVO> selectBuyPromotionSaleDetail(int prodNo);


	/**
	 * 환불 가능한 구매목록
	 * @param comNo
	 * @return
	 */
	public List<BuyListVO> selectAbleRefn(int comNo);

	public String[] selectYearList();
}
