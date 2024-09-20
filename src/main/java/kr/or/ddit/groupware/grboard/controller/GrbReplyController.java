package kr.or.ddit.groupware.grboard.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.grboard.service.GrbReplyService;
import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrbReplyVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/gw/board")
public class GrbReplyController {
	
	@Value("#{appInfo.saveFolderPath}")
	private String saveFolderPath;
	
	@Autowired
	private GrbReplyService service;
	
	@Autowired GrbService gservice;
	
	@PostMapping("/insertReply.do")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> insertReply(
	    @RequestBody GrbReplyVO reply, 
	    Authentication authentication
	    ) {
		
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) authentication.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    reply.setEmpNo(emp.getEmpNo());
	    reply.setEmpNm(emp.getEmpNm());
	    Map<String, Object> response = new HashMap<>();
	    String profileUrl = "";
        if (emp.getEmpProfile() != null ) {
            profileUrl = "/connect/files/" + emp.getEmpProfileNm();
      } else {
          profileUrl = "assets/img/avatars/default-avatar.png";  // 기본 아바타 설정
    }

	    try {
	        int grbReplyNo = service.createGrbReply(reply);
	        response.put("profileUrl", profileUrl);
	        response.put("reply",grbReplyNo);
	        response.put("status", "success");
	        response.put("message", "댓글 작성 성공");
	        reply.setEmployee(emp);
	        response.put("reply", reply);  // 새로 작성된 댓글 정보를 응답에 포함
	        log.info("Reply Object : " + reply);  // 오류 발생 시에도 reply 로그 남김
		    log.info("Reply EmpFile : " + reply.getEmpAtchFile());
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        log.error("댓글 작성 중 오류 발생: ", e);
	        response.put("status", "error");
	        response.put("message", "댓글 작성 실패");
	        
	        log.info("Reply Object (Error): " + reply);  // 오류 발생 시에도 reply 로그 남김
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
	@PostMapping("toggleReplyY.do")
	@ResponseBody
	public ResponseEntity<Map<String, String>> toggleBookmarkorg(@RequestBody Map<String, Object> requestData) {
		System.out.println(requestData);
		Map<String, String> response = new HashMap<>();
	    try {
//	        삭제로직
	        service.removeGrbReply(requestData);
	        response.put("status", "Restored");
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Error");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
}