package kr.or.ddit.groupware.adrgroup.controller;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.groupware.adrgroup.service.AdrGroupService;
import kr.or.ddit.groupware.groupemployee.service.GroupEmployeeService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.AdrGroupVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GroupEmployeeVO;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 그룹 수정 기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address/addressGroupUpdate.do")
@RequiredArgsConstructor
public class AdrGroupUpdateController {
	
    private final AddressService adrservice;
    private final AdrGroupService grpservice;
    private final GroupEmployeeService empservice;
    
    @GetMapping
    public String formUI(@RequestParam Integer what, Model model) {
       AdrGroupVO group = grpservice.retrieveGroup(what);
       model.addAttribute("group", group);
       return "tiles:groupware-member/addressBook/addressBook-group-Update";
    }
    
    @PostMapping
    public ResponseEntity<?> formDataProcess(
            @Validated(UpdateGroup.class) AdrGroupVO group,
            BindingResult errors) {

        // 폼 데이터에서 직접 값을 가져옴
        Integer grpNo = group.getGrpNo();
        String grpNm = group.getGrpNm();
        String grpCm = group.getGrpCm();
        
        System.out.println("Group Number: " + grpNo);
        System.out.println("Group Name: " + grpNm);
        System.out.println("Group Comment: " + grpCm);

        // 유효성 검사
        if (errors.hasErrors()) {
            // 에러가 있을 경우 에러 메시지를 JSON 형식으로 반환
            return ResponseEntity.badRequest().body(errors.getAllErrors());
        }

        try {
            if (grpNo == null) {
                throw new IllegalArgumentException("그룹 번호가 누락되었습니다.");
            }

            // 그룹 수정 처리
            grpservice.modifyGroup(group);

            // 그룹원 삭제
            empservice.removeGroupEmployee(grpNo);

            // 수정이 성공하면 그룹 번호를 포함한 성공 응답 반환
            return ResponseEntity.ok(Collections.singletonMap("grpNo", grpNo));
        } catch (Exception e) {
            // 예외가 발생하면 실패 메시지 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Collections.singletonMap("message", "그룹 수정에 실패했습니다."));
        }
    }


    
    

}
