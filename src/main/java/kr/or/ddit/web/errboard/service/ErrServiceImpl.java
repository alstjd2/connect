package kr.or.ddit.web.errboard.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import kr.or.ddit.atchfile.exception.AtchFileException;
import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.vo.ErrBoardVO;
import kr.or.ddit.web.errboard.dao.ErrAdminMapper;
import kr.or.ddit.web.errboard.dao.ErrBoardMapper;
import lombok.extern.log4j.Log4j2;
@Log4j2
@Service
public class ErrServiceImpl implements ErrService {
	
	@Autowired
	ErrBoardMapper mapper;
	
	@Autowired
	ErrAdminMapper adMapper;
	
	@Autowired
	AtchFileService atchFileService;
	
	@Value("#{appInfo.atchSavePath}")
	private Resource folder;
	private File saveFolder; 
	
	@PostConstruct
	public void init() throws IOException {
	    saveFolder = folder.getFile();
	    if (!saveFolder.exists()) {
	        saveFolder.mkdirs();
	    }
	}
	
	@Override
	public ErrBoardVO retrieveErr(Integer errNo) throws PkNotFoundException {
		return mapper.selectErrBoard(errNo);
	}

	@Override
	public void createErr(ErrBoardVO err) {
		// nonAttachFileNo가 0이 아니면 파일이 존재한다고 간주
	    if (err.getErrAttachFile() > 0) {
	        AtchFileVO atchFile = err.getAtchFile();
	        if (atchFile != null) {
	            try {
	                // 파일 생성 로직 실행
	                atchFileService.createAtchFile(atchFile, saveFolder);
	                err.setAtchFileId(atchFile.getAtchFileId());
	                // 파일이 있을 경우의 데이터베이스 삽입
	                mapper.insertErrBoard(err);
	            } catch (Exception e) {
	                // 파일 저장 실패 시 예외 처리
	                log.error("파일 저장 중 오류가 발생했습니다.", e);
	                throw new RuntimeException("파일 저장 실패", e);
	            }
	        } else {
	            // AtchFileVO가 null인 경우 예외 처리
	            log.warn("첨부 파일 객체가 null입니다.");
	            throw new RuntimeException("첨부 파일 객체가 null입니다.");
	        }
	    } else {
	        // nonAttachFileNo가 0 이하인 경우 파일이 없다고 간주하여 별도의 로직을 실행
	        log.warn("첨부 파일 번호가 없습니다.");
	        mapper.insertNotAtchErrBoard(err);
	    }
	}

	@Override
	public void modifyErr(ErrBoardVO err) {
		
	}

	@Override
	public ErrBoardVO removeErr(Integer errNo) {
		return null;
	}

	@Override
	public List<ErrBoardVO> retrieveErrList() {
		return mapper.selectErrBoardList();
	}

	@Override
	public List<ErrBoardVO> retrieveErrPagingList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectErrBoardListPaging(paging);
	}

	@Override
	public void updateErrStatus(Map<String, Object> params) {
		mapper.updateErrStatus(params);
		
	}

	@Override
	public void createErrStatus(Map<String, Object> params) {
		adMapper.insertErrAdmin(params);
		
	}

	@Override
	public List<ErrBoardVO> getErrBoardWithAdmin(Integer errNo) {
		
		return mapper.getErrBoardWithAdmin(errNo);
	}
	
	@Override
	public AtchFileDetailVO download(int atchFileId, int fileSn) {
		log.info("download->atchFileId : " + atchFileId);
		log.info("download->fileSn : " + fileSn);
		log.info("download->saveFolder : " + saveFolder);
		//															{atchFileId=278,fileSn=1,saveFolder=d:\connectSaveFiles}
		return Optional.ofNullable(atchFileService.readAtchFileDetail(atchFileId, fileSn, saveFolder))
						.filter(fd->fd.getSavedFile().exists())
						.orElseThrow(()->new AtchFileException(String.format("[%d, %d]해당 파일이 없음.", atchFileId, fileSn)));
	}

	@Override
	public List<ErrBoardVO> retrieveErrAdminPagingList(PaginationInfo paging) {
		int totalRecord = mapper.selectAdminTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectErrBoardAdminListPaging(paging);
	}

	@Override
	public void createNotAtchErr(ErrBoardVO err) {
		// TODO Auto-generated method stub
		
	}

}
