package kr.or.ddit.web.RefnList.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.RefnListVO;

@Mapper
public interface RefnListMapper {

	/**
	 * 환불한 모든 정보 조회
	 * @return
	 */
	public List<RefnListVO> selectRefnListAll();

	/**
	 * 환불한 정보 한건에 대한 조회
	 * @param buyNo : 구매번호
	 * @return
	 */
	public RefnListVO selectRefnListDetail(int buyNo);

	/**
	 * 환불한 정보 한건에 대한 수정
	 * @param buyNo
	 * @return
	 */
	public RefnListVO updateRefnListDetail(int buyNo);

	/**
	 * 환불 정보 추가
	 * @param refnNo
	 * @return
	 */
	public int insertRefnList(RefnListVO refnNo);


	/**
	 * 환불 처리 상태 변경
	 * @param refnStatus
	 * @return
	 */
	public int updateRefnStatus(String refnStatus);

	/**
	 * 타입별 환불 종류 개수 조회
	 * @return
	 */
	public int selectContentCnt(String refnContent);
}
