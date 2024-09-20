package kr.or.ddit.groupware.msgroom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.UriTemplate;

//@Component
public class ChatWebSocketHandler extends TextWebSocketHandler{

	// 채팅방 별로 WebSocket 세션을 관리하는 맵
	private Map<String, List<WebSocketSession>> chatRoomSessions = new HashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("새 WebSocket 연결: " + session.getUri());

		String chatRoomId = getChatRoomId(session);  // 채팅방 ID를 세션에서 가져옴

		chatRoomSessions.putIfAbsent(chatRoomId, new CopyOnWriteArrayList<>());
		chatRoomSessions.get(chatRoomId).add(session); // 해당 방에 세션 추가

		System.out.println("WebSocket 연결 성공: " + session.getId() + " 채팅방 ID: " + chatRoomId);
	}


//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
//		String chatRoomId = getChatRoomId(session); // 채팅방 ID를 세션에서 가져옴
//		List<WebSocketSession> sessions = chatRoomSessions.get(chatRoomId);
//
//		// 같은 채팅방에 있는 모든 클라이언트에게 메시지 전송
//		for (WebSocketSession webSocketSession : sessions) {
//			if (webSocketSession.isOpen()) {
//				webSocketSession.sendMessage(new TextMessage(message.getPayload())); // 메시지를 클라이언트에게 전송
//			}
//		}
//	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String chatRoomId = getChatRoomId(session);  // 채팅방 ID를 세션에서 가져옴
		chatRoomSessions.get(chatRoomId).remove(session);  // 세션 제거
		// 해당 채팅방에 더 이상 세션이 없으면 방 삭제
	    if (chatRoomSessions.get(chatRoomId).isEmpty()) {
	        chatRoomSessions.remove(chatRoomId);
	    }
	    System.out.println("WebSocket 연결이 닫혔습니다. 세션 ID: " + session.getId() + " 상태코드: " + status.getCode()
	    		+ "이유:" + status.getReason());
	}

	private String getChatRoomId(WebSocketSession session) {
		// URI 경로 가져오기
        String uri = session.getUri().getPath();

        // WebSocket 경로가 올바른 형식인지 확인
//        if (uri != null && uri.contains("/ws/chat")) {
        	UriTemplate uriTemplate = new UriTemplate("/ws/chat/{roomId}");
        	Map<String, String> variables = uriTemplate.match(uri);
        	return variables.get("roomId");

//            String[] parts = uri.split("/ws/chat");
//            if (parts.length > 1) {
//                return parts[1];  // 채팅방 ID 가 있는 경우 반환
//            }else {
//                // 채팅방 ID가 없을 때 처리 (예: 목록 화면에서는 ID가 없을 수 있음)
//                System.out.println("채팅방 ID가 없습니다. 기본 처리를 진행합니다.");
//                return "default"; // 기본값 반환 또는 다른 처리
//            }
//        } else {
            // 예상하지 못한 URI 형식일 경우 예외 처리
//            throw new IllegalArgumentException("잘못된 WebSocket 경로: " + uri);
//        }
    }


	// 세션 리스트를 반환하는 메서드
	public List<WebSocketSession> getSessions(String chatRoomId) {
		return chatRoomSessions.getOrDefault(chatRoomId, new CopyOnWriteArrayList<>());
	}
}