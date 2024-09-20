package kr.or.ddit.groupware.msgroom.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import kr.or.ddit.groupware.msgroom.service.MsgroomService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.MsglogVO;
import kr.or.ddit.vo.MsgroomVO;

@Controller
@RequestMapping("/gw")
public class MsgController {
	private final MsgroomService msgroomService;
	private final ChatWebSocketHandler chatWebSocketHandler; // WebSocket 핸들러 주입

	@Autowired
	public MsgController(MsgroomService msgroomService, ChatWebSocketHandler chatWebSocketHandler) {
		this.msgroomService = msgroomService;
		this.chatWebSocketHandler = chatWebSocketHandler;

	}

	@GetMapping("/msg.do")
	public String msgHome(Model model) {
		// 현재 로그인한 사용자의 직원 번호와 회사번호를 가져오는 로직
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        int empNo = emp.getEmpNo(); // 직원 번호 가져오기
        String empNm = emp.getEmpNm(); // 직원 이름 가져오기
//      int comNo = emp.getComNo(); // 회사 번호 가져오기

        // 직원 번호를 활용하여 해당 직원의 개인 채팅방 목록을 가져오기
		List<MsgroomVO> chatRoomList = msgroomService.getAllChatRooms(empNo);
        model.addAttribute("chatRoomList", chatRoomList);


        // 로그인한 사용자 정보를 Model에 추가
        model.addAttribute("loggedInEmpNo", empNo);
        model.addAttribute("loggedInEmpNm", empNm);

        return "tiles:groupware-member/message/message";
	}


	@GetMapping("/chat/{msgrmNo}/history")
    @ResponseBody
    public List<MsglogVO> getChatHistory(@PathVariable("msgrmNo") int msgrmNo) {
        // msgrmNo에 해당하는 채팅 기록을 가져옴
		List<MsglogVO> chatHistory = msgroomService.getChatHistory(msgrmNo);
	    if(chatHistory == null || chatHistory.isEmpty()) {
	        System.out.println("No chat history found for room: " + msgrmNo);
	    } else {
	    	chatHistory.forEach(msg -> {
	            System.out.println("Message Content: " + msg.getMsglogContent());
	            System.out.println("Message Date: " + msg.getMsglogWtdate());
	        });
	    }
	    return chatHistory;
    }


	@PostMapping("/chat/{msgrmNo}/send")
    @ResponseBody
    public Map<String, String> sendMessage(@PathVariable("msgrmNo") int msgrmNo, @RequestBody MsglogVO msgLog) {
		System.out.println("Received message content: " + msgLog.getMsglogContent());
	    System.out.println("Received message room ID: " + msgLog.getMsgrmNo());
	    System.out.println("Received message write date: " + msgLog.getMsglogWtdate()); // 로그로 날짜 확인
	    // 현재 로그인한 사용자의 직원 번호를 가져옴
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();

		msgLog.setMsgrmNo(msgrmNo);
		msgLog.setEmpNo(emp.getEmpNo());  // 메시지 작성자의 직원 번호 설정
		msgLog.setEmpNm(emp.getEmpNm());  // 메시지 작성자의 이름 설정
		System.out.println("Logged in Employee Number: " + emp.getEmpNo());
		System.out.println("Set Employee Number in MsglogVO: " + msgLog.getEmpNo());
		System.out.println("Logged in Employee Name: " + emp.getEmpNm());
		System.out.println("Set Employee Name in MsglogVO: " + msgLog.getEmpNm());

		// 메시지 작성 시간 설정
		if (msgLog.getMsglogWtdate() == null) {
		    msgLog.setMsglogWtdate(LocalDateTime.now());
		}

        msgroomService.sendMessage(msgLog); // 메시지를 데이터베이스에 저장하는로직

        // WebSocket을 통해 실시간으로 메시지를 JSON 형식으로 전송
        try {
        	// 메시지 전송 전 다시 한 번 msgLog 상태를 확인
        	System.out.println("WebSocket 전송 직전 MsglogVO 상태: " + msgLog);  // 여기에 empNm 값이 들어있는지 확인
        	// ObjectMapper를 사용해 MsglogVO를 JSON으로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.registerModule(new JavaTimeModule());  // LocalDateTime 처리용 모듈 등록
            String messageJson = objectMapper.writeValueAsString(msgLog);

        	// 로그로 전송할 JSON 확인
        	System.out.println("전송할 WebSocket 메시지: " + messageJson);

            // 해당 채팅방의 모든 세션에게 메시지 전송
        	for (WebSocketSession session : chatWebSocketHandler.getSessions(String.valueOf(msgrmNo))) {
            	if (session.isOpen()) {
                session.sendMessage(new TextMessage(messageJson));  // JSON 형식으로 메시지를 전송
            	}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // HTTP 응답
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        return response;
    }


}





