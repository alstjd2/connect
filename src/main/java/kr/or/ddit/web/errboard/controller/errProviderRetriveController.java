package kr.or.ddit.web.errboard.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ErrAdminVO;
import kr.or.ddit.vo.ErrBoardVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.errboard.service.ErrService;
@RequestMapping("/w/err")
@Controller
public class errProviderRetriveController {
	
	@Autowired
	private ErrService service;

	@GetMapping("/errList.do")
	public String Boardlist(@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model, @RequestParam(defaultValue = "작업전")String errWorkProgress
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
		MemberVO member = memberAuth.getRealUser();
		
		PaginationInfo<ErrBoardVO> paging = new PaginationInfo<ErrBoardVO>();
		ErrBoardVO errBoard = new ErrBoardVO();
		errBoard.setMemNo(member.getMemNo());
		errBoard.setErrWorkProgress(errWorkProgress);
		paging.setSearchVO(errBoard);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		List<ErrBoardVO> errList = service.retrieveErrAdminPagingList(paging);
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		System.out.println(errList);
		model.addAttribute("errBoardList", errList);
		model.addAttribute("pagingHTML", pagingHTML);
		return "tiles:web-provider/inquiry/inquiry-err";
}
	
	
	@GetMapping("inquiryErrDetail.do")
	public String errDetail(
			@RequestParam("what") Integer errNo, Model model
	) {
		model.addAttribute("err",service.retrieveErr(errNo));
	
		return "tiles:web-provider/inquiry/inquiry-err-view";
	}
	
	
	
	@PostMapping("updateErrStatus.do")
	public String updateErrStatus(
	        @RequestParam("what") Integer errNo,
	        @RequestParam("errStatus") String errStatus,
	        @RequestParam("errContent") String errContent,
	        @ModelAttribute("err") ErrAdminVO err,
	        Model model
	        ) {
	
		
	    // Map을 생성하여 파라미터를 담습니다.
		
	    Map<String, Object> params = new HashMap<>();
	    params.put("errNo", errNo);
	    params.put("errWorkProgress", errStatus);
	    params.put("errContent", errContent);
	    params.put("errWorkProgress", errStatus);
	    
	    
	    service.updateErrStatus(params);
	    service.createErrStatus(params);
	    System.out.println(params);
	    // 업데이트 후 다시 해당 문의의 상세 정보 페이지로 리다이렉트
	    return "redirect:/w/err/errList.do";
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
	
	
}
