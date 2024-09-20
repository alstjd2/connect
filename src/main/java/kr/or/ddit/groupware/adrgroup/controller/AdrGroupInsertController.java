package kr.or.ddit.groupware.adrgroup.controller;

import java.util.List;
import java.util.stream.Collectors;

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

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.groupware.adrgroup.service.AdrGroupService;
import kr.or.ddit.groupware.groupemployee.service.GroupEmployeeService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.AdrGroupVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.RequiredArgsConstructor;
/**
 * 주소록 - 그룹 추가기능
 * @author 이희진
 *
 */
@Controller
@RequestMapping("/gw/address")
@RequiredArgsConstructor
public class AdrGroupInsertController {

    private final AddressService adrservice;
    private final AdrGroupService grpservice;
    private final GroupEmployeeService empservice;
    
    @PostMapping("/addressGroupInsert.do")
    public ResponseEntity<?> formDataProcess(
            @RequestBody GroupRequest request) {
    	
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        
        AdrGroupVO group = request.getGroup();
        if (group == null) {
            return new ResponseEntity<>("그룹정보가 없습니다.", HttpStatus.BAD_REQUEST);
        }
        
        try {
            // 그룹 생성 및 그룹 번호 가져오기
            int empNo = emp.getEmpNo();
            group.setEmpNo(empNo);
            int grpNo = grpservice.createGroup(group);

            return ResponseEntity.ok().body(new GroupResponse(grpNo));
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public static class GroupRequest {
        private AdrGroupVO group;
        private List<Integer> empNos;

        public AdrGroupVO getGroup() {
            return group;
        }

        public void setGroup(AdrGroupVO group) {
            this.group = group;
        }

        public List<Integer> getEmpNos() {
            return empNos;
        }

        public void setEmpNos(List<Integer> empNos) {
            this.empNos = empNos;
        }
    }

    public static class GroupResponse {
        private int grpNo;

        public GroupResponse(int grpNo) {
            this.grpNo = grpNo;
        }

        public int getGrpNo() {
            return grpNo;
        }

        public void setGrpNo(int grpNo) {
            this.grpNo = grpNo;
        }
    }
    
    @PostMapping("/addTagsToGroup.do")
    public ResponseEntity<?> addTagsToGroup(@RequestBody TagRequest request) {
    	 System.out.println("Received request: " + request);
        try {
            // 그룹 번호와 태그 데이터 처리 로직
            int grpNo = request.getGrpNo();
            List<Integer> empNos = request.getTags().stream()
                    .map(TagData::getEmpNo)
                    .collect(Collectors.toList());
            	
            // 그룹에 태그 추가
            empservice.createGroupEmployee(grpNo, empNos);

            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public static class TagRequest {
        private int grpNo;
        private List<TagData> tags;

        public int getGrpNo() {
            return grpNo;
        }

        public void setGrpNo(int grpNo) {
            this.grpNo = grpNo;
        }

        public List<TagData> getTags() {
            return tags;
        }

        public void setTags(List<TagData> tags) {
            this.tags = tags;
        }
    }

    public static class TagData {
        private int empNo;

        public int getEmpNo() {
            return empNo;
        }

        public void setEmpNo(int empNo) {
            this.empNo = empNo;
        }
    }
}
