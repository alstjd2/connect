package kr.or.ddit.groupware.drive.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.groupware.drive.service.EdriveService;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.AtchFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gw/edrive")
@Transactional
public class EdriveFileController {
	@Autowired
	private AtchFileService atchfileService;
	@Value("#{appInfo.saveFolderPath}")
	private String saveFolderPath;
	@Autowired
	private EdriveService edriveService;
	
	/**
	 * 파일 업로드 컨트롤러
	 * saveFolerPath와 sfPath경로를 결합하여 실제 파일 경로를 찾아감
	 * @param sfPath
	 * @param uploadFile
	 * @param req
	 * @return
	 */
	@PostMapping("fileUpload.do")
	public String fileUploadProcess(
			String sfPath
			, RedirectAttributes redirectAttributes
			, @RequestPart MultipartFile uploadFile
			) {
		if(uploadFile.isEmpty()) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "업로드 파일 없음");
		}
		
		File folder = new File(saveFolderPath + sfPath);
		
		AtchFileDetailVO fileDetailVO = new AtchFileDetailVO(uploadFile);
		AtchFileVO fileVO = new AtchFileVO();
		List<AtchFileDetailVO> fileList = new ArrayList<>();
		fileList.add(fileDetailVO);
		fileVO.setFileDetails(fileList);
		atchfileService.createAtchFile(fileVO, folder);
		edriveService.createEdrivelogByFile(fileDetailVO, "FB02110", sfPathReplace(sfPath));
		
		redirectAttributes.addFlashAttribute("reSfPath", sfPath);
		
		return "redirect:/gw/edrive/edrivePage.do";
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
	public ResponseEntity<Resource> download(AtchFileDetailVO target, @RequestParam("sfPath") String sfPath ) throws IOException {
		File folder = new File(saveFolderPath + sfPath);
		
		AtchFileDetailVO atch = atchfileService.download(target.getAtchFileId(), target.getFileSn(), folder);
		edriveService.createEdrivelogByFile(atch, "FB02140", sfPathReplace(sfPath));
		
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
	
	/**
	 * 새로운 폴더 생성
	 * @param sfPath
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("newFolderInsert.do")
	public String folderMake(String sfPath, RedirectAttributes redirectAttributes) {
		int cnt = 1;
		while(cnt<1000){
			String newFolderPath = "/새폴더"+cnt;			
			cnt++;
			File folder = new File(saveFolderPath + sfPath + newFolderPath);

			if(folder.exists()) {
				log.info("폴더가 이미 존재합니다.");
			}else {
				if(folder.mkdir()) {
					log.info("새폴더 생성 완료");
					AtchFileDetailVO file = new AtchFileDetailVO();
					file.setFolderData(folder);
					edriveService.createEdrivelogByFile(file, "FB02110", sfPathReplace(sfPath));
					break;
				}else {
					log.info("새폴더 생성 실패");
				}
			}
		}
		
		redirectAttributes.addFlashAttribute("reSfPath", sfPath);
		
		return "redirect:/gw/edrive/edrivePage.do";
	}
	
	@DeleteMapping("{atchFileId}/{fileSn}")
	public void fileDelete(
			@PathVariable int atchFileId, @PathVariable int fileSn, String sfPath
			, Model model
			) {
		File folder = new File(saveFolderPath + sfPath);
		
		AtchFileDetailVO file = atchfileService.readAtchFileDetail(atchFileId, fileSn, folder);
		atchfileService.removeAtchFileDetail(atchFileId, fileSn, folder);
		edriveService.createEdrivelogByFile(file, "FB02130", sfPathReplace(sfPath));
		
		model.addAttribute("sfPath", sfPath);
	}
	
	@DeleteMapping("{orignlFileNm}/folderDelete.do")
	public void folderDelete(@PathVariable String orignlFileNm, String sfPath, Model model) {
		
		File deleteFolder = new File(saveFolderPath + sfPath + "/" + orignlFileNm);
		
		try {
			if(deleteFolder.exists()) {
				AtchFileDetailVO file = new AtchFileDetailVO();
				file.setFolderData(deleteFolder);
				FileUtils.cleanDirectory(deleteFolder);
				if(deleteFolder.isDirectory()) {
					deleteFolder.delete();
					edriveService.createEdrivelogByFile(file, "FB02130", sfPathReplace(sfPath));
					log.info("대상폴더와 하위파일, 폴더 모두 삭제");
				}else {
					log.info("삭제하려는 파일이 폴더가 아님. => ", deleteFolder);
				}
			}else {
				log.info("삭제하려는 폴더가 존재하지 않음. => {}", deleteFolder);
			}
		} catch (IOException e) {
			log.info("삭제하다 오류 발생. => {}", e);
		}
		model.addAttribute("sfPath", sfPath);
	}
	
	@PostMapping("folderRename.do")
	public String folderRename(
			String folderRename
			, String sfPath
			, String folderDefaultname
			, RedirectAttributes redirectAttributes) {
		log.info("folderRename 잘들어옴? => {}", folderRename);
		File defaultFolder = new File(saveFolderPath + sfPath + "/" + folderDefaultname);
		File changeFolder = new File(saveFolderPath + sfPath + "/" + folderRename);
		if(defaultFolder.renameTo(changeFolder)) {
			AtchFileDetailVO file = new AtchFileDetailVO();
			file.setFolderData(changeFolder);
			file.setOrignlFileNm(folderDefaultname);
			String con = "폴더명: " + folderDefaultname + " -> " + folderRename;
			edriveService.createEdrivelogByFile(file, "FB02120", sfPathReplace(sfPath), con);
			log.info("폴더명 변경 성공 => 경로: {}, 기존폴더명: {}, 변경폴더명: {})", sfPath, folderDefaultname, folderRename);
		}else {
			log.info("폴더명 변경 실패 => 경로: {}, 기존폴더명: {}, 변경폴더명: {})", sfPath, folderDefaultname, folderRename);
		}
		
		redirectAttributes.addFlashAttribute("reSfPath", sfPath);
		
		return "redirect:/gw/edrive/edrivePage.do";
	}
	
	
	/**
     * sfPath의 경로명을 회원드라이브에서 표시하는 방식으로 변환
     * drivePath에 저장됨
     * @param sfPath
     * @return
     */
    private String sfPathReplace(String sfPath) {
    	String[] sfPathReplace = sfPath.split("/");
    	StringBuilder result = new StringBuilder();
    	if("edrive".equals(sfPathReplace[1])) {
    		sfPathReplace[1] = "내드라이브";
    	}else if("tdrive".equals(sfPathReplace[1])) {
    		sfPathReplace[1] = "공용 드라이브";
    	}
    	
    	List<String> strList = new ArrayList<>(Arrays.asList(sfPathReplace));
    	strList.remove(0);
    	strList.remove(1);
    	sfPathReplace = strList.toArray(new String[0]);
    	
    	for(int i=0; i<sfPathReplace.length; i++) {
    		result.append(sfPathReplace[i]+"/");
    	}
    	
    	return result.toString();
    }
}







