package kr.or.ddit.groupware.company.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.vo.CompanyVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyMapper mapper;
	@Autowired
	private AtchFileService atchFileService;
	@Autowired
	private AuthenticationProvider memberProvider;
	
	@Value("#{appInfo.atchSavePath}")
	private Resource folder;
	private File saveFolder;
	
	// 업로드 파일이 없는경우 기본적으로 등록해줄 파일
	@Value("#{appInfo.connectDefaultClogo}")
	private Resource clogo;
	private File connectDefaultClogo;
	@Value("#{appInfo.connectDefaultClogo}")
	private Resource favicon;
	private File connectDefaultFavicon;
	
	@PostConstruct
	public void init() throws IOException {
	    saveFolder = folder.getFile();
	    if (!saveFolder.exists()) {
	        saveFolder.mkdirs();
	    }
	}

	@Override
	public CompanyVO retrieveCompany(int comNo) throws PkNotFoundException {
		CompanyVO company = mapper.selectCompany(comNo);
		if(company==null)
			throw new PkNotFoundException(comNo);
		return company;
	}
	
	/**
	 * @author 이희진
	 * 기업 정보 조회
	 */
	@Override
	public CompanyVO retrieveCompanyInfo(int comNo) throws PkNotFoundException {
		CompanyVO company = mapper.selectCompanyInfo(comNo);
		if(company==null)
			throw new PkNotFoundException(comNo);
		return company;
	}

	/**
	 * @author 이희진
	 * 기업 정보 수정
	 */
	@Override
	public void modifyCompanyInfo(CompanyVO company) {
		mapper.updateCompanyInfo(company);
	}
	/**
	 * @author 이희진
	 * 기업 레이아웃 수정
	 */
	@Override
	public void modifyCompanyLayout(CompanyVO company) {
		mapper.updateCompanyLayout(company);
		
	}
	/**
	 * @author 이희진
	 * 기업 테마 수정
	 */
	@Override
	public void modifyCompanyTheme(CompanyVO company) {
		mapper.updateCompanyTheme(company);
		
	}
	
	/**
	 * @author 이희진
	 * 기업 브랜드 수정
	 */
	@Override
	public void modifyCompanyBrand(CompanyVO company) {

	    AtchFileVO atchFile = company.getAtchFile();
	    if (atchFile != null && atchFile.getFileDetails() != null) {
	        List<?> fileDetailsList = atchFile.getFileDetails(); // List<?>로 가져오기
	        if (!fileDetailsList.isEmpty()) {
	            // 첫 번째 파일이 존재하는 경우
	            try {
	                AtchFileDetailVO fileDetail = (AtchFileDetailVO) fileDetailsList.get(0); // 첫 번째 파일 상세 정보 가져오기
	                if (fileDetail.getFileSize() > 0) {
	                    atchFileService.createAtchFile(atchFile, saveFolder);
	                    company.setComClogo(atchFile.getAtchFileId());
	                    log.info("첫 번째 파일 (Company Logo) 처리 완료: {}", atchFile.getAtchFileId());
	                } else {
	                    log.info("첫 번째 파일 (Company Logo) 업로드되지 않음.");
	                }
	            } catch (Exception e) {
	                log.error("첫 번째 파일 처리 중 예외 발생: ", e);
	            }
	        } else {
	            log.warn("첫 번째 파일 (Company Logo) 정보가 없습니다.");
	        }
	    } else {
	        log.warn("첫 번째 파일 (Company Logo) 정보가 없습니다.");
	    }

	    // 두 번째 파일 처리 (Favicon)
	    AtchFileVO atchFile2 = company.getAtchFile2();
	    if (atchFile2 != null && atchFile2.getFileDetails() != null) {
	        List<?> fileDetailsList2 = atchFile2.getFileDetails(); // List<?>로 가져오기
	        if (!fileDetailsList2.isEmpty()) {
	            // 두 번째 파일이 존재하는 경우
	            try {
	                AtchFileDetailVO fileDetail2 = (AtchFileDetailVO) fileDetailsList2.get(0); // 첫 번째 파일 상세 정보 가져오기
	                if (fileDetail2.getFileSize() > 0) {
	                    atchFileService.createAtchFile(atchFile2, saveFolder);
	                    company.setComFavicon(atchFile2.getAtchFileId());
	                    log.info("두 번째 파일 (Favicon) 처리 완료: {}", atchFile2.getAtchFileId());
	                } else {
	                    log.info("두 번째 파일 (Favicon) 업로드되지 않음.");
	                }
	            } catch (Exception e) {
	                log.error("두 번째 파일 처리 중 예외 발생: ", e);
	            }
	        } else {
	            log.warn("두 번째 파일 (Favicon) 정보가 없습니다.");
	        }
	    } else {
	        log.warn("두 번째 파일 (Favicon) 정보가 없습니다.");
	    }

	    // 데이터베이스 업데이트
	    mapper.updateCompanyBrand(company);
	    log.info("회사 브랜드 정보 업데이트 완료: {}", company.getComNo());
    
		
	}

	@Override
	@Transactional
	public ServiceResult createCompany(CompanyVO company) {
		ServiceResult result;
		AtchFileVO atchFile = new AtchFileVO();
		AtchFileDetailVO clogoFileVO = new AtchFileDetailVO();
		AtchFileDetailVO faviconFileVO = new AtchFileDetailVO();
		List<AtchFileDetailVO> atchList = new ArrayList<>();
		
		if(company.getComClogoFile() == null || company.getComClogoFile().isEmpty() ) {
			try {
				connectDefaultClogo = clogo.getFile();
				MultipartFile mulConnectDefaultClogo = clogoFileVO.setFileToMultipartFile(connectDefaultClogo);
				clogoFileVO.setUploadFile(mulConnectDefaultClogo);
			} catch (IOException e) {
				log.info("기업등록 => 그룹로고 기본파일 업로드 실패");
				e.printStackTrace();
			}
		}else {
			clogoFileVO.setUploadFile(company.getComClogoFile());
		}
		if(company.getComFaviconFile() == null || company.getComFaviconFile().isEmpty()) {
			try {
				connectDefaultFavicon = favicon.getFile();
				MultipartFile mulConnectDefaultFavicon = clogoFileVO.setFileToMultipartFile(connectDefaultFavicon);
				faviconFileVO.setUploadFile(mulConnectDefaultFavicon);
			} catch (IOException e) {
				log.info("기업등록 => 파티콘 기본파일 업로드 실패");
				e.printStackTrace();
			}
		}else {
			faviconFileVO.setUploadFile(company.getComFaviconFile());
		}
		atchList.add(clogoFileVO);
		atchFile.setFileDetails(atchList);
		atchFileService.createAtchFile(atchFile, saveFolder);
		company.setComClogo(atchFileService.retrieveAtchFileMaxId());
		
		atchList.clear();
		
		atchList.add(faviconFileVO);
		atchFile.setFileDetails(atchList);
		atchFileService.createAtchFile(atchFile,saveFolder);
		company.setComFavicon(atchFileService.retrieveAtchFileMaxId());
		
		int cnt = mapper.insertCompany(company);
		
		if(cnt>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIED;
		}
		return result;
	}

}
