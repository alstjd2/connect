package kr.or.ddit.groupware.grboard.controller;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;

@RequestMapping("/gw/board")
@Controller
public class GrbImpRetriveController {

	@Autowired
	private GrbService service;
	
	@GetMapping("grbImp.do")
	public String boardList(
			@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
	) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		PaginationInfo<GrBoardVO> paging = new PaginationInfo<GrBoardVO>();
		GrBoardVO grb = new GrBoardVO();
		grb.setEmpNo(emp.getEmpNo());
		grb.setComNo(emp.getComNo());
		grb.setEmpNm(emp.getEmpNm());
		paging.setSearchVO(grb);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<GrbGubunVO> gubunList = service.retrieveGrbGubunByComNo(emp.getComNo());
		List<GrBoardVO> grBoardList = service.retrieveGrbImpPagingList(paging);
		model.addAttribute("grBoardList", grBoardList);
		model.addAttribute("gubunList", gubunList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "tiles:groupware-member/board/gbrImpBoard";
		
	}

//
//	@GetMapping("grbBoardDetail.do")
//	public String errDetail(@RequestParam("what") Integer grbNo, @ModelAttribute("condition") SimpleCondition simpleCondition,
//			Model model ) {
//		
//		GrBoardVO grb = service.retrieveGrb(grbNo);
//		model.addAttribute("grbNo", grb);
//		return "tiles:groupware-member/board/board";
//	}
}
