package kr.or.ddit.groupware.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.RoomReservationVO;

@Mapper
public interface RoomReservationMapper {
	// RoomReservation -> RoomReser 으로 줄임

	public int insertRoomReser(RoomReservationVO roomReser);

	/**
	 * 회의실 상세 조회
	 * @param roomreserNo
	 * @return
	 */
	public RoomReservationVO selectRoomReserList(int roomreserNo);

	public RoomReservationVO selectRoom(@Param("todoNo")int todoNo, @Param("roomNo") int roomNo);

	public int updateRoomReser(int roomreserNo);

	public int deleteRoomReser(@Param("todoNo")int todoNo, @Param("roomNo") int roomNo);

	/**
	 * 당일 예약 조회 쿼리 - 회사별
	 * @return
	 */
	public List<RoomReservationVO> selectRoomReservationList(int comNo);


	/**
	 * 당일 취소 예약 건
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> selectDeleteRoomReservationList(int comNo);

	/**
	 * 기업별 예약 전체 조회
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> selectComRoomReservationList(int comNo);

	/**
	 * 기업별 예약 취소건 조회
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> selectComDeleteRoomReservationList(int comNo);

	/**
	 * 이번달 총 예약건
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> selectMonthAllRoomReservationList(int comNo);

}
