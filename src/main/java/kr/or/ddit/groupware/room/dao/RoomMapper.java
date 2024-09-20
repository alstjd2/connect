package kr.or.ddit.groupware.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.RoomReservationViewVO;
import kr.or.ddit.vo.RoomVO;

@Mapper
public interface RoomMapper { // 회의실 mapper


	/**
	 * 회의실 생성
	 * @param room
	 * @return
	 */
	public int insertRoom(RoomVO room);

	/**
	 * 특정회의실 조회
	 * @param roomNo
	 * @param comNo
	 * @return
	 */
	public RoomVO selectRoom(@Param("roomNo") int roomNo, @Param("comNo") int comNo);

	/**
	 * 회의실 목록 조회
	 * @return
	 */
	public List<RoomVO> selectRoomList(int comNo);


	/**
	 * 회의실 예약 목록 조회
	 * @param comNo
	 * @return
	 */
	public List<RoomVO> selectComRoomList(int comNo);

	/**
	 * 뷰테이블만들어서 직원이름이랑 부서명 다 나오는 예약 목록 조회
	 * @param comNo
	 * @return
	 */
	public List<RoomReservationViewVO> selectComRoomReservationList(int comNo);

	/**
	 * 회의실 수정
	 * @param room
	 * @return
	 */
	public int updateRoom(RoomVO room);

	/**
	 * 회의실 삭제
	 * @param roomNo
	 * @param comNo
	 * @return
	 */
	public int deleteRoom(@Param("roomNo") int roomNo, @Param("comNo") int comNo);
}
