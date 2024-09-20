package kr.or.ddit.web.errboard.controller;

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

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.ErrBoardVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.web.errboard.service.ErrService;

@Controller
@RequestMapping("/w/mypage/")
public class errRetriveConteroller {

	@Autowired
	private ErrService service;

	@GetMapping("mypageError.do")
	public String ErrBoardlist(@RequestParam(required = false, defaultValue = "1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition, Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper memberAuth = (MemberVOWrapper)auth.getPrincipal();
		MemberVO member = memberAuth.getRealUser();
		
		
		PaginationInfo<ErrBoardVO> paging = new PaginationInfo<ErrBoardVO>();
		ErrBoardVO errBoard = new ErrBoardVO();
		errBoard.setMemNo(member.getMemNo());
		
		paging.setSearchVO(errBoard);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<ErrBoardVO> errList = service.retrieveErrPagingList(paging);
		model.addAttribute("memNo", member.getMemNo());	
		model.addAttribute("errList", errList);

		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		System.out.println(errList);
		model.addAttribute("pagingHTML", pagingHTML);
		return "tiles:web-user/inquiry/inquiry-error";
	}

//	@GetMapping()
//	public String ErrList(Model model) {
//
//		List<ErrBoardVO> errList = service.retrieveErrList();
//		System.out.println(errList);
//		model.addAttribute("errList", errList);
//		return "tiles:web-user/inquiry/inquiry-error";
//	}
	
	
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
	
	@GetMapping("inquiryErrorDetail.do")
	public String errDetail(
			@RequestParam("what") Integer errNo, Model model
	) {
		
		
		model.addAttribute("errAdminNo",service.getErrBoardWithAdmin(errNo));
		model.addAttribute("err",service.retrieveErr(errNo));
		return "tiles:web-user/inquiry/inquriy-error-view";
	}

}
