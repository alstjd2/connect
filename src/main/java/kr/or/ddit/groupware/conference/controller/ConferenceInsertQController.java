package kr.or.ddit.groupware.conference.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.groupware.conference.service.ConferenceService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.ConferenceVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("/gw/conference")
public class ConferenceInsertQController {

    @Autowired
    ConferenceService service;

    @PostMapping(value = "conferenceInsert.do", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> formDataProcess(
            @Validated(InsertGroup.class) @ModelAttribute ConferenceVO conference, 
            Errors errors) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();

        int empNo = emp.getEmpNo();
        int comNo = emp.getComNo();
        conference.setEmpNo(empNo);
        conference.setComNo(comNo);

        if (errors.hasErrors()) {
            return new ResponseEntity<>(errors.getAllErrors(), HttpStatus.BAD_REQUEST);
        }

        try {
            service.createConference(conference);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
