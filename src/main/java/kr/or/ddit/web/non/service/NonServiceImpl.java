package kr.or.ddit.web.non.service;

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
import kr.or.ddit.vo.NonVO;
import kr.or.ddit.web.non.dao.NonMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
@Service
@RequiredArgsConstructor
@Log4j2
public class NonServiceImpl implements NonService {
	
	
	@Autowired
	AtchFileService atchFileService;
	
    @Autowired
	NonMapper mapper;
    
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
	public NonVO retrieveNon(Integer nonNo) throws PkNotFoundException {
		return mapper.selectNon(nonNo);
	}

	@Override
	public NonVO removeNon(Integer nonNo) {
		return null;
	}

	@Override
	public List<NonVO> retrieveNonList() {
		return mapper.selectNonList();
	}
	
	 public void updateNonStatus(Map<String, Object> params) {
	        mapper.updateNonStatus(params);
	    }

	@Override
	public List<NonVO> retrieveBoardListPaging(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectBoardListPaging(paging);
	}

	@Override
	public List<NonVO> retrieveBoardListByType(String boardType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NonVO> selectBoardByGuideType(String guideType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyNon(NonVO non) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createNon(NonVO non) {
	    // nonAttachFileNo가 0이 아니면 파일이 존재한다고 간주
	    if (non.getNonAttachFileNo() > 0) {
	        AtchFileVO atchFile = non.getAtchFile();
	        if (atchFile != null) {
	            try {
	                // 파일 생성 로직 실행
	                atchFileService.createAtchFile(atchFile, saveFolder);
	                non.setAtchFileId(atchFile.getAtchFileId());
	                // 파일이 있을 경우의 데이터베이스 삽입
	                mapper.insertNon(non);
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
	        mapper.insertNotAtchNon(non);
	    }
	}
	
	
	@Override
	public AtchFileDetailVO download(int atchFileId, int fileSn) {
		return Optional.ofNullable(atchFileService.readAtchFileDetail(atchFileId, fileSn, saveFolder))
						.filter(fd->fd.getSavedFile().exists())
						.orElseThrow(()->new AtchFileException(String.format("[%d, %d]해당 파일이 없음.", atchFileId, fileSn)));
	}


	@Override
	public void createNotAtchNon(NonVO non) {
		
	}


}
