package kr.or.ddit.groupware.grboard.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.atchfile.exception.AtchFileException;
import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.grboard.dao.GrBoardMapper;
import kr.or.ddit.groupware.grboard.dao.GrbReplyMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.GrBoardVO;
import kr.or.ddit.vo.GrbGubunVO;
import kr.or.ddit.vo.GrbReplyVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class GrbReplyServiceImpl implements GrbReplyService {
	@Autowired
	GrbReplyMapper mapper;
	
	@Autowired
	AtchFileService atchFileService;
	
	@Autowired
	GrBoardMapper grbmapper;
	
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
	public int createGrbReply(GrbReplyVO reply) {

		// 게시글 정보 가져오기
		GrBoardVO grboard = grbmapper.selectGrBoard(reply.getGrbNo());
		String grboardTitle = grboard.getGrbTitle();
		String replyContent = reply.getReplyContent();  // 작성된 댓글 내용 가져오기
		String writerName = reply.getEmpNm();  // 댓글 작성자의 이름

		// 알람 생성 및 전송
		AlarmVO alarm = new AlarmVO();
		alarm.setEmpNo(reply.getEmpNo());  // 인증된 사용자의 empNo 사용
		alarm.setComNo(reply.getComNo());
		alarm.setAlarmComncode(writerName + "님이 [" + grboardTitle + "] 게시글에 '" + replyContent + "' 댓글을 작성하였습니다.");
		alarm.setAlarmChk("N");
		alarm.setAlarmDate(LocalDateTime.now());
		alarm.setAlarmHeader("그룹 게시판");
		alarm.setAlarmCode(3);

		// 알람 저장
		alarmService.createAlarm(alarm);
		
		mapper.insertGrbReply(reply);
		System.out.println(reply);
		return reply.getGrbReplyNo();
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
	public List<GrbReplyVO> retrieveGrb(int grbNo) throws PkNotFoundException {
		return mapper.selectGrbReplyList(grbNo);
	}

	@Override
	public List<GrbGubunVO> retrieveGrbGubunByComNo(int comNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeGrbReply(Map<String, Object> params) {
		mapper.updateGrbReplyDelynToY(params);
		
	}
	
}
