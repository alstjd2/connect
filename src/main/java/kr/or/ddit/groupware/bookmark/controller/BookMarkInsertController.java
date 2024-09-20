package kr.or.ddit.groupware.bookmark.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.groupware.bookmark.service.BookMarkService;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 즐겨찾기 추가 기능
 * @author 이희진
 *
 */
@Controller
@RequiredArgsConstructor
@RequestMapping
public class BookMarkInsertController {
	
	@Autowired
	AddressService service;
	@Autowired
	BookMarkService markservice;

	@PostMapping("/gw/address/toggleBookmark.do")
	@ResponseBody
	public ResponseEntity<Map<String, String>> toggleBookmark(@RequestBody Map<String, String> requestData) {
	    String adrNo = requestData.get("adrNo");
	    String markyn = requestData.get("markyn");
	    Map<String, Object> params = new HashMap<>();
	    params.put("adrNo", adrNo);
	    params.put("adrMarkyn", markyn);
	    Map<String, String> response = new HashMap<>();
	    try {
	        service.modifyAddressMark(params);
	        response.put("status", "Success");
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Error");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
	@PostMapping("/gw/address/toggleBookmarkorg.do")
	@ResponseBody
	public ResponseEntity<Map<String, String>> toggleBookmarkorg(@RequestBody Map<String, String> requestData) {
		String empNo = requestData.get("empNo");
		String markTarget = requestData.get("markTarget");
		Map<String, Object> params = new HashMap<>();
		params.put("empNo", empNo);
		params.put("markTarget", markTarget);
		Map<String, String> response = new HashMap<>();
		try {
			service.modifyAddressMark(params);
			response.put("status", "Success");
			return ResponseEntity.ok(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "Error");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}


}
