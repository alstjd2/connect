package kr.or.ddit.groupware.room.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.room.dao.RoomMapper;
import kr.or.ddit.groupware.room.dao.RoomReservationMapper;
import kr.or.ddit.vo.RoomReservationVO;
import kr.or.ddit.vo.RoomReservationViewVO;
import kr.or.ddit.vo.RoomVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RoomServiceImpl implements RoomService {

	private final RoomMapper mapper;

	private final RoomReservationMapper roomReservationMapper;

	/**
	 *기업별 회의실 조회
	 */
	@Override
	public List<RoomVO> roomList(int comNo) {
		return mapper.selectRoomList(comNo);
	}

	@Override
	public void createRoom(RoomVO room) {
		mapper.insertRoom(room);
	}

	/**
	 * 기업별 회의실 예약 조회
	 */
	@Override
	public List<RoomVO> comRoomList(int comNo) {
		return mapper.selectComRoomList(comNo);
	}

	@Override
	public List<RoomReservationViewVO> comRoomReservation(int comNo) {
		return mapper.selectComRoomReservationList(comNo);
	}

	@Override
	public RoomVO retriveRoom(int roomNo, int comNo) {
		return mapper.selectRoom(roomNo, comNo);
	}

	@Override
	public void modifyRoom(RoomVO room) {
		mapper.updateRoom(room);
	}

	@Override
	public void removeRoom(int roomNo, int comNo) {
		mapper.deleteRoom(roomNo, comNo);
	}

	@Override
	public List<RoomReservationVO> roomReservationList(int comNo) {
		return roomReservationMapper.selectRoomReservationList(comNo);
	}

	@Override
	public void createRoomReservation(RoomReservationVO roomReservation) {
		roomReservationMapper.insertRoomReser(roomReservation);
	}

	@Override
	public RoomReservationVO retrieveRoom(int roomreserNo) {
		return roomReservationMapper.selectRoomReserList(roomreserNo);
	}

	@Override
	public List<RoomReservationVO> roomComReservationList(int comNo) {
		return roomReservationMapper.selectComRoomReservationList(comNo);
	}

	@Override
	public void removeRoomReservation(int roomreserNo) {
		roomReservationMapper.updateRoomReser(roomreserNo);
	}

	@Override
	public List<RoomReservationVO> roomreservationDeleteList(int comNo) {
		return roomReservationMapper.selectDeleteRoomReservationList(comNo);
	}

	@Override
	public List<RoomReservationVO> roomMonthAllReservationList(int comNo) {
		return roomReservationMapper.selectMonthAllRoomReservationList(comNo);
	}

}
