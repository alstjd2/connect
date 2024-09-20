package kr.or.ddit.groupware.bookmark.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.bookmark.service.BookMarkService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
/**
 * 즐겨찾기 추가, 삭제 기능
 * @author PC-03
 *
 */
@Controller
@RequiredArgsConstructor
@RequestMapping
public class BookMarkOrgDeleteController {
	
	@Autowired
	BookMarkService markservice;

	@PostMapping("/gw/address/orgbookmarkY")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addBookMark(@RequestBody Map<String, Object> requestData) {
	    Map<String, Object> response = new HashMap<>();
	    
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
	    // JSON으로 전송된 empNo 값을 추출
	    String empNo = (String) requestData.get("empNo");
	    Map<String, Object> params = new HashMap<>();
	    params.put("empNo", emp.getEmpNo());
	    params.put("markTarget", empNo);

	    try {
	        // 북마크 생성 및 markNo 반환
	        int markNo = markservice.createBookMark(params);
	        response.put("status", "success");
	        response.put("markNo", markNo); // markNo를 Object 타입으로 추가
	        System.out.println(markNo);
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "error");
	        response.put("message", e.getMessage()); // 오류 메시지 추가
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}

	
	@PostMapping("/gw/address/orgbookmarkD")
	@ResponseBody
	public ResponseEntity<Map<String, String>> deleteBookMark(@RequestBody Map<String, Object> params) {
	    Map<String, String> response = new HashMap<>();
	    try {
	        // markservice가 null인지 확인
	        if (markservice == null) {
	            throw new IllegalStateException("markservice가 없음");
	        }
	        Integer markNo = null;
	        Object markNoObj = params.get("markNo");
	        if (markNoObj instanceof Integer) {
	            markNo = (Integer) markNoObj;
	        } else if (markNoObj instanceof String) {
	            try {
	                markNo = Integer.parseInt((String) markNoObj);
	            } catch (NumberFormatException e) {
	                throw new IllegalArgumentException("markNo가 없음 ");
	            }
	        }
	        
	        if (markNo == null) {
	            throw new IllegalArgumentException("markNo가 없음");
	        }

	        markservice.removeBookMark(markNo);
	        response.put("status", "success");
	    } catch (Exception e) {
	        response.put("status", "error");
	        response.put("message", e.getMessage());
	    }
	    return ResponseEntity.ok(response);
	}





}
