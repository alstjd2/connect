package kr.or.ddit.groupware.grboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.grboard.service.GrbGubunService;
import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.GrbGubunVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/gw/board")
@Controller
public class GrbGubunRetriveController {
	
	@Autowired
	private GrbService gservice;
	
	@Autowired
	private GrbGubunService service;
	
	//어드민 게시판
	@GetMapping("gubun.do")
	public String GubunAdminBoard(
			@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
	) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int comNo = emp.getComNo();
		
	    PaginationInfo<GrbGubunVO> paging = new PaginationInfo<>(10, 5);
		GrbGubunVO grb = new GrbGubunVO();
		grb.setComNo(emp.getComNo());
		
		paging.setSearchVO(grb);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		List<GrbGubunVO> grbGubunList = service.retrieveGrbGubunPagingList(paging);

		model.addAttribute("grbGubunList", grbGubunList);
		 
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		return "tiles:groupware-admin/board/adminboard";
	}
	
	
	@GetMapping("gubunInsert.do")
	public String errDetail(@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model ) {
		
		PaginationInfo<GrbGubunVO> paging = new PaginationInfo<GrbGubunVO>();
		List<GrbGubunVO> grbGubunList = service.retrieveGrbGubunPagingList(paging);
		model.addAttribute("grbGubunList", grbGubunList);
		return "tiles:groupware-admin/board/adminInsertgubun";
	}
	
	@PostMapping("toggleGubunY.do")
	@ResponseBody
	public ResponseEntity<Map<String, String>> toggleBookmarkorg(@RequestBody Map<String, Object> requestData) {
		System.out.println(requestData);
		Map<String, String> response = new HashMap<>();
	    try {
//	        삭제로직
	        service.removeGrbGubun(requestData);
	        response.put("status", "Restored");
	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("status", "Error");
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
	    }
	}
	
}
	
