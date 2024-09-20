package kr.or.ddit.groupware.organization.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.appointments.service.AppointmentsService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.organization.service.OrganizationService;
import kr.or.ddit.vo.AppointmentsVO;
import kr.or.ddit.vo.CommoncodeDetailVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.OrganizationVO;

@Controller
@RequestMapping("/gw/organization")
public class OrganizationController {

	@Autowired
	private OrganizationService service;
	@Autowired
    private AppointmentsService appointmentsService;

	@Autowired
	private EmployeeService employeeService;


	// 조직도 페이지를 렌더링하는 메서드
    @GetMapping("/adminOrganization.do")
    public String getOrganizationPage( @RequestParam(required = false) String searchName,
            						   @RequestParam(required = false) String searchDate,
            						   @RequestParam(defaultValue = "1") int page, // 페이지 번호
            					       @RequestParam(defaultValue = "10") int pageSize, // 페이지 크기
            						   Model model) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        int comNo = emp.getComNo();  // 여기서 comNo를 가져온다

        // 조직도 데이터를 모델에 추가
        List<Map<String, Object>> treeData = service.retrieveOrganizationTreeData(comNo, null);
        model.addAttribute("treeData", treeData);


        // 직원 목록을 가져와 모델에 추가
        List<EmployeeVO> employees = employeeService.retrieveAllEmployees(comNo);
        model.addAttribute("employees", employees);

        // 부서 목록을 가져와 모델에 추가
        List<OrganizationVO> orgDepList = service.retrieveAllDepartments(comNo);
        model.addAttribute("orgDepList", orgDepList);


        // 인사발령 데이터를 조회/검색 (검색 조건이 없으면 전체 데이터가 검색됨)
        List<AppointmentsVO> appointments = appointmentsService.getAppointmentsWithFilters(comNo, searchName, searchDate, page, pageSize);
        int totalRecords = appointmentsService.countAppointments(comNo, searchName, searchDate);
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        model.addAttribute("appointments", appointments);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("searchName", searchName);  // 검색어를 뷰로 전달
        model.addAttribute("searchDate", searchDate);  // 검색 날짜를 뷰로 전달


     // 발령종류 데이터를 모델에 추가
        List<CommoncodeDetailVO> apmTypes = appointmentsService.getApmTypes();
        model.addAttribute("apmTypes", apmTypes);

        return "tiles:groupware-admin/personnel/personnel-organization";  // JSP 경로
    }



 // 인사발령 추가 메서드
    @PostMapping("/adminOrganization.do")
    public String addAppointment(AppointmentsVO appointment, Model model,
					    		@RequestParam(required = false) String searchName,
					            @RequestParam(required = false) String searchDate,
					            @RequestParam(defaultValue = "1") int page,
					            @RequestParam(defaultValue = "10") int pageSize){
        try {
            // 현재 사용자의 정보를 가져와서 발령 작성자와 회사 번호 설정
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
            EmployeeVO emp = empAuth.getRealUser();
            int comNo = emp.getComNo();

            // 발령 정보를 설정
            appointment.setComNo(comNo);
            appointment.setApmWriter(appointment.getEmpNo());

            // 인사 발령 추가 처리
            appointmentsService.addAppointment(appointment);

            // 발령일이 오늘인 경우에만 부서 이동 처리
            if (appointment.getApmDate().equals(LocalDate.now()) && "EB01110".equals(appointment.getApmType())) {
                employeeService.updateEmployeeDepartment(appointment.getEmpNo(), appointment.getNewOrgDep());
            }

            // 인사발령 추가 후 페이지를 새로고침
            return "redirect:/gw/organization/adminOrganization.do";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "발령 처리 중 오류가 발생했습니다.");
            return "tiles:groupware-admin/personnel/personnel-organization";
        }
    }


    @GetMapping("/getDepartments")
    @ResponseBody
    public List<OrganizationVO> getDepartments() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        int comNo = emp.getComNo(); // 현재 사용자의 회사 번호를 가져옴

        // 부서 목록을 가져와서 반환
        return service.retrieveAllDepartments(comNo);
    }





    // 조직도 목록 JSON 데이터를 반환하는 메서드
    @GetMapping("/treeData")
    @ResponseBody
    public List<Map<String, Object>> getOrganizationTreeData() {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        int comNo = emp.getComNo();  // 여기서 comNo를 가져온다.

        List<Map<String, Object>> treeData = service.retrieveOrganizationTreeData(comNo, null);

        // 데이터 확인 및 'root' 타입 설정
        for (Map<String, Object> node : treeData) {
        	if ("19".equals(node.get("id").toString())) { // 19번 노드인 경우
                node.put("type", "root");
            } else {
                node.putIfAbsent("type", "default");
            }
        }

        return treeData;
    }

    @GetMapping("/treeData/{orgUpdep}")
    @ResponseBody
    public List<Map<String, Object>> getOrganizationTreeData(@PathVariable String orgUpdep) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
        EmployeeVO emp = empAuth.getRealUser();
        int comNo = emp.getComNo();  // 여기서 comNo를 가져온다.
    	return service.retrieveOrganizationTreeData(comNo, orgUpdep);
    }


    @GetMapping("/getAppointmentsDetails")
    @ResponseBody
    public AppointmentsVO getAppointmentsDetails(@RequestParam("apmNo") int apmNo) {
        return appointmentsService.getAppointmentsDetails(apmNo);


    }

    @PostMapping("/createNode")
    @ResponseBody
    public ResponseEntity<?> createNode(@RequestBody OrganizationVO organizationVO) {
    	System.out.println("createNode 호출됨: " + organizationVO);  // 로그
        try {
            // 시퀀스를 사용해 새로운 orgId를 설정
        	int newOrgId = service.getNewOrgId(); // 시퀀스에서 ID를 가져옴
            organizationVO.setOrgId(newOrgId);

            // COM_NO 설정: 현재 사용자의 COM_NO를 설정
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
            EmployeeVO emp = empAuth.getRealUser();
            int validComNo = emp.getComNo(); // 실제 유효한 COM_NO를 가져옴
            organizationVO.setComNo(validComNo);

            // orgUpdep 값이 제대로 설정되어 있는지 확인
            if (organizationVO.getOrgUpdep() == null || organizationVO.getOrgUpdep().trim().isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Parent department ORG_NO is missing or invalid.");
            }

         // 조직 대표자(대표 이름 또는 번호)가 있는 경우 유효성 검사
            String representative = organizationVO.getOrgDf();
            if (representative != null && !representative.trim().isEmpty()) {
                try {
                    // 대표자가 직원 번호로 주어진 경우 (숫자인 경우)
                    int empNo = Integer.parseInt(representative.trim());
                    // 직원 번호로 직접 설정
                    organizationVO.setOrgDf(String.valueOf(empNo));
                } catch (NumberFormatException e) {
                    // 대표자가 이름으로 주어진 경우 (숫자가 아닌 경우)
                    Integer empNo = service.getEmpNoByName(representative);
                    if (empNo == null) {
                        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("등록되지 않은 직원입니다.");
                    }
                    organizationVO.setOrgDf(empNo.toString());
                }
            }


            // 데이터베이스에 노드 생성
            service.createOrganization(organizationVO);

            Map<String, Object> node = new HashMap<>();
            node.put("id", organizationVO.getOrgNo()+"");   // ORG_NO을 사용
            node.put("text", organizationVO.getOrgDep()); // 부서명
            node.put("type","default"); // 노드타입

            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("representative", representative);  // 부서장 정보 (원래 입력된 값을 유지)
            dataMap.put("representativeId", organizationVO.getOrgDf());  // 아이디를 넣기위함
            node.put("data", dataMap);

            return ResponseEntity.ok(node);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to create node");
        }
    }

    @PostMapping("/updateNode")
    @ResponseBody
    public ResponseEntity<?> updateNode(@RequestBody OrganizationVO organizationVO) {
        try {
        	 // COM_NO 설정: 현재 사용자의 COM_NO를 설정
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
            EmployeeVO emp = empAuth.getRealUser();
            int validComNo = emp.getComNo(); // 실제 유효한 COM_NO를 가져옴
            organizationVO.setComNo(validComNo);


         // 기존의 조직 정보를 유지하며 필요한 필드만 업데이트
            OrganizationVO existingOrg = service.retrieveOrganization(organizationVO.getOrgNo());
            if (existingOrg != null) {
                organizationVO.setOrgUpdep(existingOrg.getOrgUpdep());  // 기존 상위부서 유지
                organizationVO.setOrgLevel(existingOrg.getOrgLevel());  // 기존 레벨 유지
                organizationVO.setOrgDelyn(existingOrg.getOrgDelyn());  // 기존 삭제 여부 유지
            }

            // 데이터베이스에서 조직 정보 업데이트
            service.modifyOrganization(organizationVO);
            return ResponseEntity.ok("Organization updated successfully");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update organization");
        }
    }


    @PostMapping("/checkDuplicateRepresentative")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkDuplicateRepresentative(@RequestBody Map<String, String> request) {
        String representativeId = request.get("representativeId");
        boolean isDuplicate = service.isRepresentativeAlreadyAssigned(representativeId);

        Map<String, Boolean> response = new HashMap<>();
        response.put("isDuplicate", isDuplicate);
        return ResponseEntity.ok(response);
    }





    @GetMapping("/getEmployeeNameByEmpNo")
    @ResponseBody
    public ResponseEntity<String> getEmployeeNameByEmpNo(@RequestParam("empNo") int empNo) {
        try {
            String employeeName = service.getEmployeeNameByEmpNo(empNo);
              return ResponseEntity.ok(employeeName);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to get employee name");
        }
    }
    @GetMapping("/getEmpNoByName")
    @ResponseBody
    public ResponseEntity<Integer> getEmpNoByName(@RequestParam("empNm") String empNm) {
        try {
        	if (empNm == null || empNm.trim().isEmpty()) {
                // 직원 이름이 제공되지 않은 경우 400 Bad Request 반환
                return ResponseEntity.badRequest().body(null);
            }

        	Integer empNo = service.getEmpNoByName(empNm);
        	if (empNo == null) {
                // 직원 번호가 없는 경우 처리
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
            return ResponseEntity.ok(empNo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/deleteOrganization")
    @ResponseBody
    public ResponseEntity<?> deleteOrganization(@RequestBody Map<String, Integer> payload) {
    	Integer orgNo = payload.get("orgNo");
    	if (orgNo == null) {
            return ResponseEntity.badRequest().body("Invalid organization number.");
        }

    	//  ROOT 노드 삭제 방지
        if (orgNo == 19 || orgNo == 20) {  // orgNo가 19 또는 20인 경우 삭제 금지
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("ROOT 노드는 삭제할 수 없습니다.");
        }

        try {
        	// 하위 부서들도 함께 삭제
            service.removeOrganizationAndChildren(orgNo);
            return ResponseEntity.ok("Organization and its sub-departments deleted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete organization");
        }
    }

    @PostMapping("/moveNode")
    @ResponseBody
    public ResponseEntity<?> moveNode(@RequestBody List<Map<String, Object>> nodes) {
    	try {
            if (nodes == null || nodes.isEmpty()) {
                return ResponseEntity.badRequest().body("No nodes data provided.");
            }

            // 트랜잭션 시작 (필요한 경우)
            for (Map<String, Object> node : nodes) {
                Integer orgNo = null;
                String newParent = null;
                Integer newLevel = null;

                try {
                    orgNo = Integer.valueOf(node.get("orgNo").toString());
                    newParent = (String) node.get("newParent");
                    newLevel = Integer.valueOf(node.get("newLevel").toString());
                } catch (NumberFormatException e) {
                    return ResponseEntity.badRequest().body("Invalid node data format.");
                }

                // 노드 정보 검증
                if (orgNo == null || newParent == null || newLevel == null) {
                    return ResponseEntity.badRequest().body("Node data is missing required fields.");
                }

                // 서비스 호출하여 노드 이동 처리
                try {
                    service.updateNodeParentAndLevel(orgNo, newParent, newLevel);
                } catch (Exception e) {
                    // 특정 서비스 예외 처리 가능
                    e.printStackTrace();
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error while updating node with ID: " + orgNo);
                }
            }

            // 트랜잭션 커밋 (필요한 경우)
            return ResponseEntity.ok("Nodes moved successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to move nodes.");
        }
    }

    @PostMapping("/updateLevelsAfterDeletion")
    @ResponseBody
    public ResponseEntity<?> updateLevelsAfterDeletion(@RequestBody List<Map<String, Object>> nodes) {
        try {
            for (Map<String, Object> node : nodes) {
                Integer orgNo = Integer.valueOf(node.get("orgNo").toString());
                Integer newLevel = Integer.valueOf(node.get("newLevel").toString());

                // 노드 레벨을 업데이트하는 서비스 호출
                service.updateNodeLevel(orgNo, newLevel);
            }

            return ResponseEntity.ok("Levels updated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update levels.");
        }
    }




}
