package kr.or.ddit.web.non.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.NonVO;
import kr.or.ddit.web.non.service.NonService;

@RequestMapping("/w/non")
@Controller
public class NonAdminController {
	@Autowired
	private NonService service;
	
	@Autowired
	private AtchFileService atchfileService;
	
	@Value("#{appInfo.saveFolderPath}")
	private String saveFolderPath;
	
	@GetMapping("inquiryNonDetail.do")
	public String NonDetail(
			@RequestParam("what") Integer nonNo, Model model
	) {
		
		model.addAttribute("non",service.retrieveNon(nonNo));
		System.out.println(nonNo);
		return "tiles:web-provider/inquiry/inquiry-non-view";
	}
	
	/**
	 * 파일 다운로드 컨트롤러
	 * saveFolerPath와 sfPath경로를 결합하여 실제 파일 경로를 찾아감
	 * @param target
	 * @param sfPath
	 * @return
	 * @throws IOException
	 */
	
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
	
	@PostMapping("updateNonStatus.do")
	public String updateNonStatus(
	        @RequestParam("what") Integer nonNo,
	        @RequestParam("nonStatus") String nonStatus,
	        Model model) {
	    
	    // Map을 생성하여 파라미터를 담습니다.
	    Map<String, Object> params = new HashMap<>();
	    params.put("nonNo", nonNo);
	    params.put("nonStatus", nonStatus);
	    
	    // 서비스 계층으로 Map을 전달하여 nonStatus 업데이트
	    service.updateNonStatus(params);
	    System.out.println(params);
	    // 업데이트 후 다시 해당 문의의 상세 정보 페이지로 리다이렉트
	    return "redirect:/w/non/inquiryNonDetail.do/?what=" + nonNo;
	}
	
	@GetMapping("nonList.do")
	public String Boardlist(@RequestParam(required = false, defaultValue="1") int page,
			@ModelAttribute("condition") SimpleCondition simpleCondition,
			Model model
			) {
		PaginationInfo<BoardVO> paging = new PaginationInfo<BoardVO>();
		NonVO nonBoard = new NonVO();
		nonBoard.setNonNo(2);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<NonVO> nonList = service.retrieveBoardListPaging(paging);
		
		model.addAttribute("nonList", nonList);
		
		PaginationRenderer renderer = new DefaultPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
	return "tiles:web-provider/inquiry/inquiry-non";
	}
}
