package kr.or.ddit.groupware.employee.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.organization.service.OrganizationService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.OrganizationVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/gw/adminEmployee")
public class AdminEmployeeController {
		private final EmployeeService service;
		private final OrganizationService orgService;


		// 직원목록 가져오기
		@GetMapping("adminEmployeeList.do")
		public String adminEmployeeList (Model model) {
			 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		       EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		       EmployeeVO emp = empAuth.getRealUser();
		       int comNo = emp.getComNo();

			List<EmployeeVO> adminEmployeeList = service.retrieveAllEmployees(comNo);
			model.addAttribute("list", adminEmployeeList);
			return "tiles:groupware-admin/personnel/personnel-employee";

		}
		// 직원목록 제이슨 데이터
		 @GetMapping("list")
		 @ResponseBody
		 public List<EmployeeVO> listJsonData() {
			 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		       EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		       EmployeeVO emp = empAuth.getRealUser();
		       int comNo = emp.getComNo();
			    return service.retrieveAllEmployees(comNo);
			}

/////////////////////////////////////////////////////////////////////////////////////////

		// 특정 직원 상세 정보 조회
		@GetMapping("/detail")
		@ResponseBody
		public EmployeeVO detail(@RequestParam("empNo") int empNo) {
			return service.retrieveEmployeeDetail(empNo);
		}

		/**
	     * 직원 정보 수정
	     *
	     * @param employee 수정할 직원 정보
	     * @return 수정 결과에 따라 리다이렉트
	     */
	    @PostMapping("/edit")  // 수정할 정보 전송
	    @ResponseBody
	    public ResponseEntity<String> switchEmployee(@RequestParam("empNo") int empNo,
									                 @RequestParam("empJoindate") String empJoindate,
									                 @RequestParam("empMail") String empMail,
									                 @RequestParam("empTel") String empTel,
									                 @RequestParam("empBir") String empBir) {
	        try {
	        	// 전달받은 파라미터로 EmployeeVO 객체 생성 및 값 설정
	            EmployeeVO employee = new EmployeeVO();
	            employee.setEmpNo(empNo);
	            employee.setEmpJoindate(empJoindate);
	            employee.setEmpMail(empMail);
	            employee.setEmpTel(empTel);
	            employee.setEmpBir(empBir);

	            service.changeEmployee(employee);  // 직원 정보 수정 서비스 호출
	            return ResponseEntity.ok("직원 정보가 성공적으로 수정되었습니다.");  // 성공 메시지 반환
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("직원 정보를 수정하는 중 오류가 발생했습니다.");  // 오류 메시지 반환
	        }
	    }






		// 직원등록 폼
		@GetMapping("/register")
		public String registerForm(Model model) {
			// 현재 인증된 사용자 정보를 가져옴
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    int comNo = emp.getComNo(); // 현재 사용자의 회사 번호를 가져옴

		    // comNo를 모델에 추가하여 뷰에서 사용할 수 있도록 설정
		    model.addAttribute("comNo", comNo);

		    return "tiles:groupware-admin/personnel/personnel-employee"; // JSP 파일경로
		}

		// 직원등록 (등록된 내용을 처리하는 메서드)
		@PostMapping("/register")
		public String addEmployee(@ModelAttribute EmployeeVO employee) {
			// 현재 인증된 사용자 정보를 가져옴
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    // 사용자의 comNo를 EmployeeVO에 설정
		    employee.setComNo(emp.getComNo());

			service.registerEmployee(employee);
			return "redirect:/gw/adminEmployee/adminEmployeeList.do";   // 등록 후 목록으로 이동 (리다이렉트)
		}


		// 아이디 생성 API
	    @GetMapping("/generateId")
	    @ResponseBody
	    public String generateId() {
	        String generatedId = service.generateUniqueEmployeeId();
	        return generatedId;
	    }

	    // 비밀번호 생성 API
	    @GetMapping("/generatePassword")
	    @ResponseBody
	    public String generatePassword() {
	        String generatedPassword = service.generatePassword(); // 이 메서드는 서비스 구현체에서 비밀번호를 자동 생성하는 메서드입니다.
	        return generatedPassword;
	    }

		// 부서 목록 가져오기
		@GetMapping("/getDepartments")
		@ResponseBody
		public List<OrganizationVO> getDepartments() {
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    int comNo = emp.getComNo(); // 현재 사용자의 회사 번호를 가져옴

		    // 회사 번호를 사용하여 부서 목록을 반환
		    return orgService.retrieveAllDepartments(comNo);
		}


		// 직책 목록 가져오기
		@GetMapping("/getOnePosNm")
		@ResponseBody
		public List<EmployeeVO> getOnePosNm() {
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    int comNo = emp.getComNo(); // 현재 사용자의 회사 번호를 가져옴

		    // 직책 목록을 반환
		    return service.retrieveAllPositions(comNo, "EB04120"); // POS_TYPE = 'EB04120'는 직책
		}


		// 직급 목록 가져오기
		@GetMapping("/getPosNm")
		@ResponseBody
		public List<EmployeeVO> getPosNm() {
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    int comNo = emp.getComNo(); // 현재 사용자의 회사 번호를 가져옴

		    // 직급 목록을 반환
		    return service.retrieveAllPositions(comNo, "EB04110"); // POS_TYPE = 'EB04110'는 직급
		}

		// 직원 정보 업로드 폼
		@GetMapping("/upload")
		public String uploadForm() {
		    return "employeeUpload";   // JSP 파일 경로
		}

		// 직원 정보 업로드 처리
		@PostMapping("/upload")
		public String uploadEmployeeData(@RequestParam("file") MultipartFile file) {
		    service.uploadEmployeeData(file);
		    return "redirect:/admin/employee/list";   // 업로드 후 목록으로 이동
		}



		// 엑셀 일괄 업로드 폼
		@GetMapping("/uploadEmployeeForm")
		public String uploadEmployeeForm(Model model) {
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    int comNo = emp.getComNo();

		    // 회사 번호를 모델에 추가
		    model.addAttribute("comNo", comNo);
		    return "tiles:groupware-admin/personnel/personnel-employee";  // JSP 파일 경로
		}


		// 엑셀 일괄 업로드 처리
		@PostMapping("/uploadEmployeeExcel")
		public String uploadEmployeeExcel(@RequestParam("file") MultipartFile file, Model model) {
		    if (file.isEmpty()) {
		        model.addAttribute("message", "파일이 비어 있습니다.");
		        return "tiles:groupware-admin/personnel/personnel-employee"; // 에러 발생 시 보여줄 페이지
		    }

		    // 현재 인증된 사용자 정보를 가져옴
		    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		    EmployeeVO emp = empAuth.getRealUser();
		    int comNo = emp.getComNo(); // 현재 사용자의 회사 번호를 가져옴


		    try {
		    	// 엑셀 파일에서 직원 목록을 읽어옴
		        List<EmployeeVO> employeeList = service.readExcelFile(file, comNo);

		        // 읽어온 직원 정보에 comNo를 설정
		        for (EmployeeVO employee : employeeList) {
		            employee.setComNo(comNo); // 자동으로 회사 번호를 설정
		            log.info("설정된 comNo: {}", employee.getComNo());

		        }
		        // 직원 목록 저장
		        service.saveAll(employeeList);
		        model.addAttribute("message", "업로드성공");
		    } catch (Exception e) {
		        e.printStackTrace();
		        model.addAttribute("message", "파일 업로드 중 오류가 발생했습니다.");
		        return "tiles:groupware-admin/personnel/personnel-employee"; // 에러 발생 시 보여줄 페이지
		    }

		    return "redirect:/gw/adminEmployee/adminEmployeeList.do"; // 업로드 후 목록으로 이동
		}















}
