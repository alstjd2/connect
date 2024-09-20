package kr.or.ddit.groupware.alarm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.alarm.dao.AlarmMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("/gw")
public class AlarmController {

    @Autowired
    private AlarmMapper alarmMapper;

    @GetMapping("/notifications")
    @ResponseBody
    public List<AlarmVO> getNotifications(@RequestParam(value = "empNo", required = false) Integer empNo) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
	    empNo = emp.getEmpNo();
        return alarmMapper.selectRecentAlarms(empNo);
    }
    
    
}
