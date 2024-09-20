package kr.or.ddit.groupware.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.groupware.address.dao.AddressMapper;
import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 외부연락처 추가기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address/addressInsert.do")
@RequiredArgsConstructor
public class AddressInsertController {

    @Autowired
    private AddressService service;
    
    @Autowired
    private NewAlarmController alarmController;
    
    @Autowired
    private AddressMapper mapper;
    @ModelAttribute("address")
    public AddressVO address() {
        return new AddressVO();
    }

    @PostMapping
    public ResponseEntity<?> formDataProcess(
            @Validated(InsertGroup.class) @RequestBody AddressVO address,
            Errors errors) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
	    int empNo = emp.getEmpNo();
	    address.setEmpNo(empNo);

        if (errors.hasErrors()) {
            return new ResponseEntity<>(errors.getAllErrors(), HttpStatus.BAD_REQUEST);
        }

        try {
            service.createAddress(address);
            
//            alarmController.handleNewMessage("새로운 주소록이 추가되었습니다.", address.getEmpNo(), "주소록- 외부주소록", 3, "gw/address/addressList.do");
            
            return new ResponseEntity<>("주소록이 성공적으로 추가되었습니다.", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    
    
    
    
}