package kr.or.ddit.groupware.alarm.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
public class NewAlarmController {

    @Autowired
    private AlarmService alarmService;

    @Autowired
    private NotificationWebSocketHandler notificationWebSocketHandler;

    public void handleNewMessage(String alarmComcode, Integer receiverEmpNo, String messageContent, Integer code, String link) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();

        AlarmVO alarm = new AlarmVO();
        alarm.setEmpNo(receiverEmpNo);
        alarm.setComNo(comNo);
        alarm.setAlarmComncode(alarmComcode);
        alarm.setAlarmChk("N");
        alarm.setAlarmDate(LocalDateTime.now());
        alarm.setAlarmHeader(messageContent);
        alarm.setAlarmCode(code);
        alarm.setAlarmLink(link);

        alarmService.createAlarm(alarm);

        String notificationMessage = alarm.getAlarmComncode();
        notificationWebSocketHandler.sendNotification(receiverEmpNo, notificationMessage);
    }
}
