package kr.or.ddit.groupware.grboard.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.atchfile.exception.AtchFileException;
import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.grbattention.dao.GrbAttentionMapper;
import kr.or.ddit.groupware.grboard.dao.GrBoardMapper;
import kr.or.ddit.groupware.grboard.dao.GrbGubunMapper;
import kr.or.ddit.groupware.grboard.dao.GrbReplyMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class GrbServiceImpl implements GrbService {
	@Autowired
	GrbAttentionMapper attentionMapper;
	
	@Autowired
	GrBoardMapper mapper;
	
	@Autowired
	GrbGubunMapper guMappber;
	
	@Autowired GrbReplyMapper reMapper;
	
	@Autowired
	AtchFileService atchFileService;
	@Autowired
	private NotificationWebSocketHandler notificationWebSocketHandler;
	@Autowired
	private AlarmService alarmService;
	
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
	public GrBoardVO retrieveGrb(int grbNo) throws PkNotFoundException {
		return mapper.selectGrBoard(grbNo);
	}
	
	
	@Override
	public void createGr(GrBoardVO board) {
	    AtchFileVO atchFile = board.getAtchFile();

	    // 파일이 존재하고, 파일 세부 정보가 null이 아니며, 리스트가 비어있지 않은지 확인
	    if (atchFile != null && atchFile.getFileDetails() != null && !atchFile.getFileDetails().isEmpty()) {
	        // fileDetails 리스트의 첫 번째 파일을 가져와서 파일의 크기나 원본 파일명을 체크
	        AtchFileDetailVO fileDetail = atchFile.getFileDetails().get(0);

	        if (fileDetail.getFileSize() > 0 && fileDetail.getOrignlFileNm() != null && !fileDetail.getOrignlFileNm().isEmpty()) {
	            log.info("첨부 파일이 존재합니다. 파일 저장을 시작합니다. 저장 경로: " + saveFolder);

	            // 파일 저장 로직
	            atchFileService.createAtchFile(atchFile, saveFolder);
	            board.setAtchFileId(atchFile.getAtchFileId());
	            mapper.insertGrBoard(board);  // 첨부 파일이 있을 때 게시글 저장
	        } else {
	            log.warn("첨부 파일이 없거나, 파일 크기가 0입니다. 파일 없이 게시글을 등록합니다.");
	            mapper.insertNotAtchGrboard(board);  // 첨부 파일이 없을 때 게시글 저장
	        }
	    } else {
	        // 첨부 파일이 없으면 게시글만 등록
	        mapper.insertNotAtchGrboard(board);
	    }

	    // GRB_ATTENTION_YN 값이 "Y"인 경우에만 알림을 생성하고 전송
	    if ("Y".equals(board.getGrbAttentionYN())) {
	        // 인증된 사용자 정보 가져오기
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
	        EmployeeVO emp = empAuth.getRealUser();
	        int comNo = emp.getComNo();

	        // 게시글 분류(GRB_GUBUN_TITLE) 정보 가져오기
	        GrbGubunVO grbgubun = guMappber.selectGrbGubun(board.getGrbGubunNo());
	        String gutitle = grbgubun.getGrbGubunTitle();

	        // 게시글 작성자 이름과 게시글 제목
	        String boardTitle = board.getGrbTitle();
	        String writerName = emp.getEmpNm();
	        // 알람 생성 및 전송
	        AlarmVO alarm = new AlarmVO();
	        alarm.setEmpNo(board.getEmpNo());  // 게시글 작성자의 empNo 사용
	        alarm.setComNo(comNo);
	        alarm.setAlarmComncode(writerName + "님이 [" + gutitle + "] 게시판에 필독글을 작성했습니다.");
	        alarm.setAlarmChk("N");
	        alarm.setAlarmDate(LocalDateTime.now());
	        alarm.setAlarmHeader("그룹 게시판");
	        alarm.setAlarmCode(3);
	        alarm.setAlarmLink("gw/board/grbBoardDetail.do");
	        alarmService.createAlarm(alarm);

	        // WebSocket을 통한 실시간 알림 전송
	        String notificationMessage = alarm.getAlarmComncode();
	        notificationWebSocketHandler.sendNotification(board.getEmpNo(), notificationMessage);
	    }
	}
	@Override
	public void modifyGr(GrBoardVO grb) {
	    AtchFileVO atchFile = grb.getAtchFile();
	    // 파일이 존재하고, 파일 세부 정보가 null이 아니며, 리스트가 비어있지 않은지 확인
	    if (atchFile != null && atchFile.getFileDetails() != null && !atchFile.getFileDetails().isEmpty()) {
	        // fileDetails 리스트의 첫 번째 파일을 가져와서 파일의 크기나 원본 파일명을 체크
	        AtchFileDetailVO fileDetail = atchFile.getFileDetails().get(0);

	        if (fileDetail.getFileSize() > 0 && fileDetail.getOrignlFileNm() != null && !fileDetail.getOrignlFileNm().isEmpty()) {
	            log.info("첨부 파일이 존재합니다. 파일 저장을 시작합니다. 저장 경로: " + saveFolder);
	            // 파일 저장 로직
	            atchFileService.createAtchFile(atchFile, saveFolder);
	            grb.setAtchFileId(atchFile.getAtchFileId());
	            mapper.updateGrBoard(grb);  // 첨부 파일이 있을 때 게시글 저장
	        } else {
	            log.warn("첨부 파일이 없거나, 파일 크기가 0입니다. 파일 없이 게시글을 등록합니다.");
	             mapper.updateNotAttchFile(grb);
	        }
	    }
	   
	}

	@Override
	public GrBoardVO removeGr(Integer GrNo) {
		
		return null;
	}

	@Override
	public List<GrBoardVO> retrieveGrList() {

		return mapper.selectGrBoardListNonPaging();
	}

	@Override
	public List<GrBoardVO> retrieveGrPagingList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrBoardList(paging);
	}

	@Override
	public List<GrBoardVO> retrieveGrbAttentionPagingList(PaginationInfo paging) {
		int totalRecord = mapper.countGrBoardList(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrbAtenBoardList(paging);
	}

	@Override
	public List<GrBoardVO> retrieveGrbMyPostPagingList(PaginationInfo paging) {
		int totalRecord = mapper.countUserPosts(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrbMyPostBoardList(paging);
	}
	
	
	@Override
	public List<GrBoardVO> retrieveGrbImpPagingList(PaginationInfo paging) {
		int totalRecord = mapper.countImp(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrbImpList(paging);
	}
	
	@Override
	public List<GrBoardVO> retrieveGrbTrashPagingList(PaginationInfo paging) {
		int totalRecord = mapper.countTrash(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrbTrashList(paging);
	}

	@Override
	public List<GrBoardVO> retrieveGrbGubunPagingList(PaginationInfo paging) {
		int totalRecord = mapper.CountGubun(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrbGubunList(paging);
	}
	@Override
	public List<GrbGubunVO> retrieveGrbGubunByComNo(int comNo) {
		mapper.selectGrBoardListNonPaging();
		return guMappber.selectGubunByComNo(comNo);
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
	public void insertNotAtchGrboard(GrBoardVO grb) {
		
	}

	@Override
	public List<GrBoardVO> retrieveGrIndexList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGrBoardIndexPage(paging);
	}

	@Override
	public void updateNotAttchFile(GrBoardVO grb) {
		// TODO Auto-generated method stub
		
	}

}
