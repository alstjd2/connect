package kr.or.ddit.groupware.alarm.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class NotificationWebSocketHandler extends TextWebSocketHandler {

    private static final Logger logger = LoggerFactory.getLogger(NotificationWebSocketHandler.class);

    
    private final Map<Integer, WebSocketSession> sessions = new ConcurrentHashMap<>();
    private final Map<Integer, ConcurrentLinkedQueue<String>> messageQueues = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        HttpSession httpSession = (HttpSession) session.getAttributes().get("HTTP_SESSION");
        if (httpSession == null) {
            logger.warn("웹소켓아이디 : " + session.getId());
            session.close(CloseStatus.NOT_ACCEPTABLE.withReason("HttpSession not found"));
            return;
        }

        Integer empNo = (Integer) httpSession.getAttribute("empNo");
        if (empNo == null) {
            logger.warn("empNo : " + session.getId());
            return;
        }else {
        	synchronized (sessions) {
        		sessions.put(empNo, session);
        		logger.info("WebSocket 커넥션 empNo: " + empNo);
        		
        		logger.info("현재 연결된 세션 수: " + sessions.size());
        		sessions.forEach((key, value) -> {
        			logger.info("empNo: " + key + ", 세션 ID: " + value.getId());
        		});
        		
        		
        	}
        	
        }

    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        logger.info("message: " + payload);
        session.sendMessage(new TextMessage("Echo: " + payload));
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        Integer empNo = getEmpNoFromSession(session);
        if (empNo != null) {
            synchronized (sessions) {
            	
                WebSocketSession sessionss =  sessions.remove(empNo);
                
                
                logger.info("WebSocket 커넥션 close empNo:{}, session id {} , sessionss id {} " , empNo, session.getId(), sessionss.getId());
            }
        }
    }

    public boolean isSessionOpen(Integer empNo) {
        WebSocketSession session = sessions.get(empNo);
        return session != null && session.isOpen();
    }

    public void sendNotification(Integer empNo, String message) {
        WebSocketSession session = sessions.get(empNo);
        sessions.forEach((k,v)->{
        	logger.info("empNo : {} , sessionid : {}, session opened : {} ", k, v.getId(),v.isOpen() );
        });
        if (session != null && session.isOpen()) {
            try {
                session.sendMessage(new TextMessage(message));
            } catch (IOException e) {
                logger.error("메세지 못보냄 : " + empNo, e);
            }
        } else {
            
            logger.warn("세션 없음 : " + empNo );
        }
    }

    private Integer getEmpNoFromSession(WebSocketSession session) {
        HttpSession httpSession = (HttpSession) session.getAttributes().get("HTTP_SESSION");
        return httpSession != null ? (Integer) httpSession.getAttribute("empNo") : null;
    }
}
