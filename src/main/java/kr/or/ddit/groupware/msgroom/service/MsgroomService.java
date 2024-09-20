package kr.or.ddit.groupware.msgroom.service;

import java.util.List;

import kr.or.ddit.vo.MsglogVO;
import kr.or.ddit.vo.MsgroomVO;

public interface MsgroomService {

	/**
	 * 특정 직원의 모든 채팅방 목록을 가져온다.
	 * @param empNo 직원번호
	 * @return 직원의 모든 채팅방 목록
	 */
	public List<MsgroomVO> getAllChatRooms(int empNo);

	/**
	 * 특정 채팅방을 가져온다.
	 * @param msgrmNo 채팅방 번호
	 * @return 채팅방 정보
	 */
	public MsgroomVO getChatRoom(int msgrmNo);

	/**
	 * 채팅기록가져오기
	 * @param msgrmNo
	 * @return
	 */
	public List<MsglogVO> getChatHistory(int msgrmNo);

	/**
	 * 메시지 전송하기
	 * @param msgLog
	 */
	public void sendMessage(MsglogVO msgLog);





}
