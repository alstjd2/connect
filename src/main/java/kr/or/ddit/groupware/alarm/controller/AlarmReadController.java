package kr.or.ddit.groupware.alarm.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.alarm.service.AlarmService;


@Controller
@RequestMapping("/gw")
public class AlarmReadController {
	
	@Autowired
	private AlarmService service;
	
	@PostMapping("/notificationsRead/{alarmNo}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deleteNotification(@PathVariable("alarmNo") Integer alarmNo) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = service.modifyAlarm(alarmNo);
            response.put("success", success);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            return ResponseEntity.status(HttpStatus.SC_INTERNAL_SERVER_ERROR).body(response);
        }
    }

}
