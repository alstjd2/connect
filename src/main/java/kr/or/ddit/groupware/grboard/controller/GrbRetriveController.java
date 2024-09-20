package kr.or.ddit.groupware.grboard.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.groupware.grboard.service.GrbReplyService;
import kr.or.ddit.groupware.grboard.service.GrbService;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.GrbReplyVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/gw/board")
@Slf4j
@Controller
public class GrbRetriveController {
	
	@Autowired
	private GrbReplyService reservice;
	
	@Autowired
	private GrbService service;

	@GetMapping("board.do")
	public String boardList(
			@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model,
			@RequestParam(required = false, defaultValue="true") boolean layout
	) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		
		PaginationInfo paging = new PaginationInfo(7, 5);
		GrBoardVO grb = new GrBoardVO();
		grb.setEmpNo(emp.getEmpNo());
		grb.setComNo(emp.getComNo());
		grb.setEmpNm(emp.getEmpNm());
		paging.setSearchVO(grb);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		String empNm = emp.getEmpNm();
		List<GrbGubunVO> gubunList = service.retrieveGrbGubunByComNo(emp.getComNo());
		List<GrBoardVO> grBoardList = service.retrieveGrPagingList(paging);

		model.addAttribute("grBoardList", grBoardList);
		model.addAttribute("gubunList", gubunList);
		model.addAttribute("empNm", empNm);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("empNo", emp.getEmpNo());
		if(layout) {
			return "tiles:groupware-member/board/board";
		}else {
			return "groupware-member/board/board";
		}
		
	}


	@GetMapping("grbBoardDetail.do")
	public String grbDetail(@RequestParam("what") int grbNo, @ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model,RedirectAttributes redirectAttributes ) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    String empNm = emp.getEmpNm();
	    GrBoardVO grb = service.retrieveGrb(grbNo);
		model.addAttribute("empNm", empNm);
		model.addAttribute("grbNo", grb);
		List<GrbReplyVO> reply = reservice.retrieveGrb(grbNo);
		redirectAttributes.addFlashAttribute("grbNo", grbNo);
		model.addAttribute("replyList",reply);
		model.addAttribute("empNo", emp.getEmpNo());
		return "groupware-member/board/boardTest";
	}
	
	
	@GetMapping("gubunList.do")
	public String gubunList(
			@RequestParam(required = false, defaultValue="1") int page,
			@RequestParam int grbGubunNo,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
	) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
		
	    GrBoardVO grb = new GrBoardVO();
		PaginationInfo<GrBoardVO> paging = new PaginationInfo<GrBoardVO>();
		grb.setEmpNo(emp.getEmpNo());
		grb.setComNo(emp.getComNo());
		grb.setEmpNm(emp.getEmpNm());
		grb.setGrbGubunNo(grbGubunNo);
		paging.setSearchVO(grb);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<GrbGubunVO> gubunList = service.retrieveGrbGubunByComNo(emp.getComNo());
		List<GrBoardVO> grBoardList = service.retrieveGrbGubunPagingList(paging);
		
		model.addAttribute("grBoardList", grBoardList);
		model.addAttribute("gubunList", gubunList);
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("empNo", emp.getEmpNo());
		model.addAttribute("grbGubunNo", grb.getGrbGubunNo());
		
		return "tiles:groupware-member/board/gubunBoardDetail";
		
	}
	
	@GetMapping("{atchFileId}/{fileSn}")
	public ResponseEntity<Resource> download(AtchFileDetailVO target, String sfPath ) throws IOException {
		
		AtchFileDetailVO atch = service.download(target.getAtchFileId(), target.getFileSn());
		
		Resource savedFile = atch.getSavedFile();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentLength(atch.getFileSize());
		ContentDisposition disposition = ContentDisposition.attachment()
											.filename(atch.getOrignlFileNm(), Charset.forName("UTF-8"))
											.build();
		headers.setContentDisposition(disposition);
		return  ResponseEntity.ok()
						.headers(headers)
						.body(savedFile);
	}
	
	   @GetMapping("/editPostForm.do")
	    public String editPostForm(@RequestParam("grbNo") int grbNo, Model model) {
	        // 게시글 번호를 통해 게시글 정보를 가져옴
	        GrBoardVO grBoard = service.retrieveGrb(grbNo);
	        // 모델에 게시글 정보를 추가하여 뷰에 전달
	        model.addAttribute("grBoard", grBoard);
	        // 수정 폼 뷰로 이동
	        return "tiles:groupware-member/board/boardUpdate"; // 실제 JSP 파일 경로에 맞게 수정
	    }
	}
	

