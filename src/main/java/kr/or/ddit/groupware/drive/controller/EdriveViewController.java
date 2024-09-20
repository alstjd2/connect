  package kr.or.ddit.groupware.drive.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gw/edrive")
public class EdriveViewController {
	@Autowired
	private AtchFileService atchService;
	@Value("#{appInfo.saveFolderPath}")
	private String saveFolderPath;

	@GetMapping("edrivePage.do")
	public String drivePage(
			String sfPath 
			, @ModelAttribute("reSfPath") String reSfPath
			, String backSfPath
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {

		
		// 뒤로가기로 sfPath를 넘겨줄경우 backSfPath로 값 전달
		// 마지막 경로 삭제 후 sfPath에 입력
		if(StringUtils.isNotBlank(backSfPath)) {
			String[] str = backSfPath.split("/");
			StringBuilder strBuilder = new StringBuilder();
			if(str.length > 3) {
				List<String> strList = new ArrayList<>(Arrays.asList(str));
				strList.remove(str.length-1);
				strList.remove(0);
				str = strList.toArray(new String[0]);
				
				for(int i=0; i<str.length; i++) {
					strBuilder.append("/"+str[i]);
				}
				sfPath = strBuilder.toString();
			}else {
				sfPath = backSfPath;
			}
		}
		
		// redirect로 sfPath를 넘겨줄경우 reSfPath로 값 전달
		if(StringUtils.isNotBlank(reSfPath)) {
			sfPath = reSfPath;
		}
		// 경로가 안넘어올경우 기본경로 표현
		if(StringUtils.isBlank(sfPath)) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
			EmployeeVO employee = empAuth.getRealUser();
			sfPath = "/edrive/" + employee.getEmpNo();
		}
		
		log.info("최종 sfPath 경로 => {}", sfPath);
		
		File folder = new File(saveFolderPath+sfPath);
		File[] files = folder.listFiles();
		List<AtchFileDetailVO> fileList = new ArrayList<>();
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("sfPath", sfPath);
		model.addAttribute("drivePath",sfPathReplace(sfPath));
		
		if (folder.exists()) {
			log.info("디렉토리가 존재합니다.");
			for (int i = 0; i < files.length; i++) {
				AtchFileDetailVO file = atchService.retrieveAtchFileDetailByUUID(files[i].getName());
				log.info("file 정보 => {}", file);
				// 파일에 대한 정보를 가져오고 후처리
				// null -> db에 정보가 없으므로 폴더이고 폴더 데이터를 새로 추출하여 넣어줌
				// not null -> db에 메타데이터가 있으므로 필요한 정보(마지막 수정일, 확장자 제거한 파일명) 추가
				if(file!=null) {
					file.setFileLastModify( new SimpleDateFormat("yyyy-MM-dd a hh:mm").format(files[i].lastModified()));
					file.setFileExeRemoveNm(FilenameUtils.removeExtension(file.getOrignlFileNm()));
					
					file.setSfPath(sfPath);
					fileList.add(file);
				}else{
					if(files[i].isDirectory()) {
						file = new AtchFileDetailVO();
						file.setFolderData(files[i]);
						
						file.setSfPath(sfPath);
						fileList.add(file);
					}else {
						log.info("파일은 존재하지만 검색되지 않으며 디렉토리가 아님 => {}", files[i]);
					}
				}
			}
		} else {
			if (folder.mkdirs()) {
				log.info("디렉토리가 생성되었습니다.");
			} else {
				log.info("디렉토리를 생성하지 못했습니다.");
			}
		}
		
		return "tiles:groupware-member/drive/edrive";
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
