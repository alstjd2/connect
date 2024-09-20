package kr.or.ddit.groupware.room.service;

import java.util.List;

import kr.or.ddit.vo.RoomReservationVO;
import kr.or.ddit.vo.RoomReservationViewVO;
import kr.or.ddit.vo.RoomVO;

public interface RoomService {

	/**
	 * 기업별 회의실 조회
	 * @param comNo
	 * @return
	 */
	public List<RoomVO> roomList(int comNo);

	/**
	 * 기업별 회의실 예약조회
	 * @param comNo
	 * @return
	 */
	public List<RoomVO> comRoomList(int comNo);

	public List<RoomReservationViewVO> comRoomReservation(int comNo);

	public void createRoom(RoomVO room);

	public RoomVO retriveRoom(int roomNo, int comNo );

	public void modifyRoom(RoomVO room);

	public void removeRoom(int roomNo, int comNo);

	/**
	 * 회의실 예약 조회 (당일 쿼리)
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> roomReservationList(int comNo);

	/**
	 * 기업별 회의실 조회
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> roomComReservationList(int comNo);

	/**
	 * 회의실 예약
	 * @param roomReservation
	 */
	public void createRoomReservation(RoomReservationVO roomReservation);

	/**
	 * 회의실 예약취소
	 * @param roomreserNo
	 */
	public void removeRoomReservation(int roomreserNo);

	/**
	 * 당일 취소된 회의실 예약
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> roomreservationDeleteList(int comNo);

	/**
	 * 이번달 총 예약(취소된 예약 건 포함)
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationVO> roomMonthAllReservationList(int comNo);

	public RoomReservationVO retrieveRoom(int roomreserNo);
}
