package kr.or.ddit.groupware.grbattention.controller;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.grbattention.service.GrbAttentionService;
import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class GrbAttentionInsertController {
	
	@Autowired
	GrbAttentionService aservice;
	@Autowired
	GrbService service;
	
	@PostMapping("/gw/board/toggleBoardmark1.do")
	@ResponseBody
	public ResponseEntity<Map<String, String>> toggleBoardmark(@RequestBody Map<String, String> requestData) {

		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    int empNo = emp.getEmpNo();
	    String grbNo = requestData.get("grbNo");
	    Map<String, Object> params = new HashMap<>();
	    params.put("grbNo", grbNo);
	    params.put("empNo", empNo);	
	    
	    Map<String, String> response = new HashMap<>();
	    try {
	        aservice.modifyGrbMark(params);
	        response.put("status", "Success");
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Error");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
	
	@PostMapping("/gw/board/toggleBoardmark.do")
	@ResponseBody
	public ResponseEntity<Map<String, String>> toggleBookmarkorg(@RequestBody Map<String, Object> requestData) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
//    String grbNo = (String) requestData.get("grbNo");
//    String attNo = (String) requestData.get("attNo");
//    Map<String, Object> params = new HashMap<>();
//    params.put("grbNo", grbNo);
//    params.put("empNo", empNo);	
//    params.put("attNo", attNo);
      requestData.put("empNo", empNo);
		Map<String, String> response = new HashMap<>();
		try {
	        // 먼저 즐겨찾기가 이미 되어있는지 확인
	        boolean isMarked = aservice.isGrbMarked(requestData);
	        if (isMarked) {
	            // 이미 즐겨찾기가 되어있다면 삭제
	            aservice.deleteGrbMark(requestData);
	            response.put("status", "Unmarked");
	        } else {
	            // 즐겨찾기가 되어있지 않다면 추가
	            aservice.modifyGrbMark(requestData);
	            response.put("status", "Marked");
	        }
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Error");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
}
