package kr.or.ddit.groupware.document.controller;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.groupware.document.service.DocumentService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.vo.ComdcmFormVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.PmtDcmAppVO;
import kr.or.ddit.vo.PmtDcmInsertVO;
import kr.or.ddit.vo.PmtDcmRefNoVO;
import kr.or.ddit.vo.PmtDcmVO;
import kr.or.ddit.vo.PositionVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 그룹웨어 결재문서 생성, 승인, 반려, 전결, 완료 처리
 * @author 정윤지
 *
 */
@Controller
@RequestMapping("/gw/document/insert")
@RequiredArgsConstructor
@Slf4j
public class DocumentInsertController {
	private final DocumentService service;
	private final CompanyService comService;
	private final EmployeeService empService;
	private final NewAlarmController alarmController;

	@Value("#{appInfo.atchSavePath}")
	private Resource folder;
	private File saveFolder;


	@PostConstruct
	public void init() throws IOException {
		saveFolder = folder.getFile();
		log.info("이미지 저장 경로 : {}",saveFolder.getAbsolutePath());
	}

	@PostMapping({"app/ok", "app/no", "app/pre"})
	//public String formDataApp(
	public ResponseEntity<Map<String, Object>> formDataApp(
	    @ModelAttribute PmtDcmAppVO app, 
	    Errors errors, 
	    RedirectAttributes rd,
	    HttpServletRequest request
	) {
        
        // JSON 응답을 위해 Map을 사용
        Map<String, Object> response = new HashMap<>();
        
        PmtDcmAppVO nowApp = service.retrievePmtDcmApp(app.getPmtDcmAppNo());
        
        // staCode가 "DB06120"이 아닌 경우 처리
        if (!"DB06110".equals(nowApp.getPmtDcmStaNo())) {
            //rd.addFlashAttribute("alertType", "error");
            //rd.addFlashAttribute("alertTitle", "처리된 결재문서");
            //rd.addFlashAttribute("alertMessage", "이미 처리한 결재문서 입니다.");
            response.put("success", false);
            log.info("{}",app.getPmtDcmStaNo());
            if("DB06120".equals(app.getPmtDcmStaNo())) {
                response.put("message", "결재 예정인  결재문서 입니다.");
            }else {
                response.put("message", "이미 처리한 결재문서 입니다.");
            }
            return ResponseEntity.ok(response);
            //return "redirect:/gw/document/detail.do?what=" + app.getPmtDcmNo();
        }
	    String path = request.getRequestURI();
        if (path.endsWith("/app/ok")) {
            app.setPmtDcmStaNo("DB06130");
        } else if (path.endsWith("/app/no")) {
            app.setPmtDcmStaNo("DB06140");
        } else if (path.endsWith("/app/pre")) {
            app.setPmtDcmStaNo("DB06150");
        } else {
            throw new IllegalArgumentException("Invalid request path: " + path);
        }

	    if (errors.hasErrors()) {
	    	response.put("success", false);
            response.put("message", "폼 유효성 검사에 실패했습니다.");
            return ResponseEntity.ok(response);
	        //return "redirect:/gw/document/detail.do?what=" + app.getPmtDcmNo();
	    } else {
	        service.modifyPmtDcmApp(app);
            response.put("success", true);
            response.put("message", "문서 처리가 완료되었습니다.");
            return ResponseEntity.ok(response);
	        //return "redirect:/gw/document/detail.do?what=" + app.getPmtDcmNo();
	    }
	}
	
	@PostMapping("rec/ok")
	public ResponseEntity<Map<String, Object>> formDataRec(
		    @ModelAttribute PmtDcmVO dcmDetail, 
		    Errors errors
	){
        // JSON 응답을 위해 Map을 사용
        Map<String, Object> response = new HashMap<>();
        
        PmtDcmVO nowDcm = service.retrievePmtDcmDetail(dcmDetail.getPmtDcmNo());
        
		// staCode가 "DB06110"이 아닌 경우 처리
        if (!"DB01110".equals(nowDcm.getPmtDcmRecStano())) {
            response.put("success", false);
            if("DB01120".equals(dcmDetail.getPmtDcmStaNo())) {
                response.put("message", "결재 예정인 수신문서 입니다.");
            }else {
                response.put("message", "이미 처리한 수신문서 입니다.");
            }
            return ResponseEntity.ok(response);
        }

	    if (errors.hasErrors()) {
	    	response.put("success", false);
            response.put("message", "폼 유효성 검사에 실패했습니다.");
            return ResponseEntity.ok(response);
	    } else {
	        service.modifyPmtDcmRecEnd(dcmDetail.getPmtDcmNo());	        
            response.put("success", true);
            response.put("message", "문서 처리가 완료되었습니다.");
            alarmController.handleNewMessage("작성한 문서를 수신자가 처리완료 하였습니다.", nowDcm.getPmtDcmEmpno(), "문서결재 - 문서생성", 2, "gw/document/detail.do?what="+dcmDetail.getPmtDcmNo());
            return ResponseEntity.ok(response);
	    }
	}
	
	@GetMapping("/{dcmFormCode}.do")
    public String insertDocumentFrom(
    		@PathVariable("dcmFormCode") String dcmFormCode,
    		Model model
    ) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		String viewString = "redirect:/gw/login/logout.do";
		
		EmployeeVO employee = empService.retrieveEmployeeInfo(emp.getEmpNo());
		model.addAttribute("employee", employee);
		
		List<EmployeeVO> empList = empService.retrieveEmployeeComEmpList(emp.getComNo());
		model.addAttribute("empList", empList);
		
		if (!model.containsAttribute("dcmDetail")) {
	        PmtDcmInsertVO dcmDetail = new PmtDcmInsertVO();
	        model.addAttribute("dcmDetail", dcmDetail);
	    }
		
		CompanyVO company = comService.retrieveCompany(emp.getComNo());
		model.addAttribute("com", company);
		
		ComdcmFormVO comForm = service.retrieveComdcmForm(dcmFormCode);
		model.addAttribute("comForm", comForm);

        List<PmtDcmVO> relatedDcmList =  service.retrieveRelatedDcmAll(emp.getEmpNo());
        model.addAttribute("relatedDcmList", relatedDcmList);     
        
        List<PositionVO> posComList =  service.retrievePosComAll(emp.getComNo());
        model.addAttribute("posComList", posComList);     
		
        log.info("Received dcmFormCode: " + dcmFormCode);

        if(emp.getEmpRole().equals("ROLE_EMPLOYEE")) {
        	viewString = "tiles:document/"+dcmFormCode;
        }
        return viewString;
    }
	@GetMapping("empRecList")
	public @ResponseBody List<EmployeeVO> empRecListJsonData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    List<EmployeeVO> empRecList = empService.retrieveEmployeeComEmpList(emp.getComNo());
		return empRecList;
	}
	
//	@PostMapping("/{dcmFormCode}.do")
//	public ResponseEntity<?> insertDocument(
//	    @PathVariable("dcmFormCode") String dcmFormCode,
//	    @RequestBody @Validated(InsertGroup.class) PmtDcmInsertVO dcmDetail,
//	    BindingResult bindingResult
//	) {
//		log.info("Received PmtDcmInsertVO------------------------------------???dfsdfdsf:\n {}", dcmDetail);
//		
//		 if (dcmDetail == null || dcmDetail.getPmtDcm() == null) {
//		        log.error("PmtDcmInsertVO or PmtDcmVO is null");
//		        return ResponseEntity.badRequest().body("PmtDcmInsertVO or PmtDcmVO is null");
//		    }
//		
//		if (bindingResult.hasErrors()) {
//			log.info("BindingResult has errors: {}", bindingResult.getAllErrors());
//	        return ResponseEntity.badRequest().body("Validation errors");
//	        //return ResponseEntity.badRequest().body(bindingResult.getAllErrors());
//	    }
//	    
//		try {
//			int pmtDcmNo = service.createPmtDcmAll(dcmDetail);
//		    URI location = URI.create("/gw/document/detail.do?what=" + pmtDcmNo);
//	        // JSON 응답 본문 추가
//	        Map<String, Object> response = new HashMap<>();
//	        response.put("status", "success");
//	        response.put("pmtDcmNo", pmtDcmNo);
//		    return ResponseEntity.created(location).body(response);
//	        //return ResponseEntity.ok("Success");
//	    } catch (Exception e) {
//	        log.error("Exception occurred: ", e);
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Internal Server Error");
//	    }
//		
//	    
//	}
	
	
	@PostMapping("/{dcmFormCode}.do")
	public ResponseEntity<?> insertDocument(
		@PathVariable("dcmFormCode") String dcmFormCode
	    , @RequestPart(value = "jsonData") @Validated(InsertGroup.class) PmtDcmInsertVO dcmDetail
	    , BindingResult bindingResult
	    , @RequestPart(value = "atchFile", required = false) List<MultipartFile> files
	    //, @RequestPart(value = "atchFile", required = false) AtchFileVO files
	) {
	    log.info("Received PmtDcmInsertVO: {}", dcmDetail);
	    log.info("Received PmtDcmInsertVO: {}", files);
	    
	    // 데이터 검증
	    if (bindingResult.hasErrors()) {
	        log.info("BindingResult has errors: {}", bindingResult.getAllErrors());
	        return ResponseEntity.badRequest().body("Validation errors");
	    }


	    try {
	    	AtchFileVO atchFiles = convertToAtchFileVO(files);
	        int pmtDcmNo = service.createPmtDcmAll(dcmDetail, atchFiles);
	        URI location = URI.create("/gw/document/detail.do?what=" + pmtDcmNo);
	         
	        Map<String, Object> response = new HashMap<>();
	        response.put("status", "success");
	        response.put("pmtDcmNo", pmtDcmNo);
	        
	        return ResponseEntity.created(location).body(response);
	    } catch (Exception e) {
	        log.error("Exception occurred: ", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Internal Server Error");
	    }
	}

	// MultipartFile을 AtchFileVO로 변환하는 메서드
	private AtchFileVO convertToAtchFileVO(List<MultipartFile> files) throws IOException {
	    AtchFileVO atchFileVO = new AtchFileVO();
	    if (files != null && !files.isEmpty()) {
	        List<AtchFileDetailVO> fileDetails = new ArrayList<>();
	        for (MultipartFile file : files) {
	            AtchFileDetailVO fileDetail = new AtchFileDetailVO(file);
	            
	            // 파일 저장
	            // fileDetail.uploadFileSaveTo(saveFolder);
	            
	            fileDetails.add(fileDetail);
	        }
	        atchFileVO.setFileDetails(fileDetails);
	    }
	    return atchFileVO;
	}
}
