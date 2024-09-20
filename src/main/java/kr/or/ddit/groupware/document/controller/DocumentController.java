package kr.or.ddit.groupware.document.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.comdcmNum.dao.ComdcmNumMapper;
import kr.or.ddit.groupware.company.service.CompanyService;
import kr.or.ddit.groupware.document.service.DocumentService;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.ComdcmFormVO;
import kr.or.ddit.vo.ComdcmNumVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PmtDcmAppVO;
import kr.or.ddit.vo.PmtDcmRefNoVO;
import kr.or.ddit.vo.PmtDcmVO;
import lombok.RequiredArgsConstructor;
import lombok.experimental.var;

/**
 * 그룹웨어 결재문서 리스트 및 디테일
 * @author 정윤지
 */
@Controller
@RequestMapping("/gw/document")
@RequiredArgsConstructor
public class DocumentController {
	private final DocumentService service;
	private final EmployeeService empService;
	private final CompanyService comService;
	
	@GetMapping("list.do")
	public String documentList(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		String viewString = "redirect:/gw/login/logout.do";
		if(emp.getEmpRole() == null) {
			viewString = "redirect:/gw/login/logout.do";
		}else if(emp.getEmpRole().equals("ROLE_EMPLOYEE")) {
			viewString = "tiles:groupware-member/document/document-list";
		}else if(emp.getEmpRole().equals("ROLE_ADMIN")) {
			viewString = "tiles:groupware-admin/document/document-list";
		}
		return viewString;	
	}
	@GetMapping("list")
	public @ResponseBody List<PmtDcmVO> listJsonData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    
	    List<PmtDcmVO> documentList = new ArrayList<PmtDcmVO>();
	   
		if(emp.getEmpRole().equals("ROLE_EMPLOYEE")) {
			documentList = service.retrieveEmpPmtDcmAll(emp.getEmpNo());
			//List<PmtDcmVO> documentList = service.retrieveEmpPmtDcmAll(14);
		}else if(emp.getEmpRole().equals("ROLE_ADMIN")) {
			documentList = service.retrievePmtDcmList(emp.getComNo());
		}
	   
		return documentList;
	}
	
	@GetMapping("detail.do")
	public String detail(
		@RequestParam("what") int pmtDcmNo,
		Model model
	) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		//직원정보에 값이 없다면 로그아웃
		String viewString = "redirect:/gw/login/logout.do";
		
		PmtDcmVO dcmDetail = service.retrievePmtDcmDetail(pmtDcmNo);
		List<PmtDcmAppVO> dcmAppList = service.retrievePmtDcmAppList(pmtDcmNo);
		List<PmtDcmRefNoVO> refList = service.retrievePmtDcmRefNoAll(pmtDcmNo);
		
		CompanyVO company = comService.retrieveCompany(dcmDetail.getComNo());
		
		if(dcmDetail.getPmtRetDcmNo() != null) {
			PmtDcmVO refDcm = service.retrievePmtDcmDetail(dcmDetail.getPmtRetDcmNo());
			model.addAttribute("refDcm", refDcm);
		}  
		
		//문서정보
		model.addAttribute("dcmDetail", dcmDetail);
		//결재리스트
		model.addAttribute("dcmAppList", dcmAppList);
		//참조리스트
		model.addAttribute("refList", refList);
		//회사정보
		model.addAttribute("com", company);
		
		if(emp.getEmpRole().equals("ROLE_EMPLOYEE")) {
			int empAppNo = 0;
			
			for (PmtDcmAppVO app : dcmAppList) {
				
				int appEmpNo = app.getPmtDcmAppEmpId();
				//결재리스트 중에 내 결재건을 확인하는 작업 
				if(appEmpNo == emp.getEmpNo()) {
					empAppNo = app.getPmtDcmAppNo();
				}				
			}
			
			PmtDcmAppVO app = service.retrievePmtDcmApp(empAppNo);
			model.addAttribute("app", app);
			viewString = "tiles:groupware-member/document/document-detail";
		}else if(emp.getEmpRole().equals("ROLE_ADMIN")) {
			viewString = "tiles:groupware-admin/document/document-detail";
		}
		
		return viewString;	
	}
	
	@GetMapping("insert.do")
	public String documentInsert(Model model) {
		return "tiles:groupware-member/document/document-insert-list";	
	}
	@GetMapping("insertList")
	public @ResponseBody List<ComdcmFormVO> insertListJsonData(){
	    List<ComdcmFormVO> insertList = service.retrieveComdcmFormAll();
		return insertList;
	}
	
	
	@GetMapping("reference.do")
	public String documentReference(Model model) {
		return "tiles:groupware-member/document/document-ref-list";	
	}

	@GetMapping("refList")
	public @ResponseBody List<PmtDcmVO> refListJsonData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    List<PmtDcmVO> documentList = new ArrayList<PmtDcmVO>();
	    documentList = service.retrieveRefEmpPmtDcmAll(emp.getEmpNo());
		return documentList;
	}
	
	@GetMapping("receive.do")
	public String documentReceive(Model model) {
		return "tiles:groupware-member/document/document-rec-list";	
	}

	@GetMapping("recList")
	public @ResponseBody List<PmtDcmVO> recListJsonData(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    List<PmtDcmVO> documentList = new ArrayList<PmtDcmVO>();
	    documentList = service.retrieveRecEmpPmtDcmAll(emp.getEmpNo());
		return documentList;
	}
	
	@GetMapping("storage.do")
	public String documentStorage(Model model) {
		return "tiles:groupware-member/document/document-list";	
	}
	
	@GetMapping("empList")
	public @ResponseBody EmployeeVO empInfo(@RequestParam("what") int empNo){
		EmployeeVO employee = empService.retrieveEmployeeInfo(empNo);
		return employee;
	}
	
	@PostMapping("documentPrint.do")
	public String documentPrint( @RequestParam("data") String data,	Model model) {
		model.addAttribute("data", data);
		return "groupware-admin/document/document-print";	
	}
	
	@GetMapping("documentNumber.do")
	public String documentNumber(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    ComdcmNumVO comDcmNum = service.retrieveComdcmNum(emp.getComNo());
		
	    model.addAttribute("comDcmNum", comDcmNum);
		return "tiles:groupware-admin/document/document-number";	
	}
	
	@PostMapping("documentNumber.do")
	public String documentNumberMod(
		ComdcmNumVO comdcmNum
	) {
		service.modifyComdcmNum(comdcmNum);
		return "redirect:/gw/document/documentNumber.do";
	}
}
