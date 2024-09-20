package kr.or.ddit.groupware.document.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.comdcmForm.dao.ComdcmFormMapper;
import kr.or.ddit.groupware.comdcmNum.dao.ComdcmNumMapper;
import kr.or.ddit.groupware.employee.dao.EmployeeMapper;
import kr.or.ddit.groupware.pmtDcm.dao.PmtDcmMapper;
import kr.or.ddit.groupware.pmtDcmApp.dao.PmtDcmAppMapper;
import kr.or.ddit.groupware.pmtDcmRefNo.dao.PmtDcmRefNoMapper;
import kr.or.ddit.groupware.position.dao.PositionMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AtchFileVO;
import kr.or.ddit.vo.ComdcmFormVO;
import kr.or.ddit.vo.ComdcmNumVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.PmtDcmAppVO;
import kr.or.ddit.vo.PmtDcmInsertVO;
import kr.or.ddit.vo.PmtDcmRefNoVO;
import kr.or.ddit.vo.PmtDcmVO;
import kr.or.ddit.vo.PositionVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;


@Service
@RequiredArgsConstructor
@Slf4j
public class DocumentServiceImpl implements DocumentService {

	private final PmtDcmMapper mapper;
	private final PmtDcmAppMapper appMapper;
	private final PmtDcmRefNoMapper refMapper;
	private final ComdcmFormMapper formMapper;
	private final PositionMapper positionMapper;
	private final ComdcmNumMapper comdcmNumMapper;
	private final EmployeeMapper empMapper;
	private final AtchFileService atchFileService;
	private final AlarmService alarmService;
	private final NotificationWebSocketHandler notificationWebSocketHandler;

	
	@Value("#{appInfo.atchSavePath}")
	private Resource folder;
	private File saveFolder;


	@PostConstruct
	public void init() throws IOException {
		saveFolder = folder.getFile();
		log.info("이미지 저장 경로 : {}",saveFolder.getAbsolutePath());
	}
	
	@Override
	public List<PmtDcmVO> retrievePmtDcmList(int comNo) {
		List<PmtDcmVO> documentList = mapper.selectPmtDcmAll(comNo);
		documentList.forEach(vo -> replaceNullWithEmptyString(vo));
		
		return documentList;
	}
	
	private void replaceNullWithEmptyString(PmtDcmVO vo) {
        if (vo.getPmtDcmAttno() == null) {
            vo.setPmtDcmAttno(0);
        }
        if (vo.getPmtRetDcmNo() == null) {
            vo.setPmtRetDcmNo(0);
        }
    }

	@Override
	public PmtDcmVO retrievePmtDcmDetail(int pmtDcmNo) {
		return mapper.selectPmtDcmDetail(pmtDcmNo);
	}

	@Override
	public List<PmtDcmAppVO> retrievePmtDcmAppList(int pmtDcmNo) {
		return appMapper.selectPmtDcmAppAll(pmtDcmNo);
	}


	@Override
	public List<PmtDcmRefNoVO> retrievePmtDcmRefNoAll(int pmtDcmNo) {
		return refMapper.selectPmtDcmRefNoAll(pmtDcmNo);
	}

	@Override
	public List<PmtDcmVO> retrieveEmpPmtDcmAll(int pmtDemAppEmpId) {
		return mapper.selectEmpPmtDcmAll(pmtDemAppEmpId);
	}

	@Override
	public List<PmtDcmVO> retrieveRefEmpPmtDcmAll(int pmtDemRefEmpNo) {
		return mapper.selectRefEmpPmtDcmAll(pmtDemRefEmpNo);
	}

	@Override
	public List<PmtDcmVO> retrieveRecEmpPmtDcmAll(int pmtDemRecEmpno) {
		return mapper.selectRecEmpPmtDcmAll(pmtDemRecEmpno);
	}

	@Override
	public PmtDcmAppVO retrievePmtDcmApp(int pmtDcmAppNo) {
		return appMapper.selectPmtDcmApp(pmtDcmAppNo);
	}

	   @Override
	   @Transactional
	   public void modifyPmtDcmApp(PmtDcmAppVO app) {
	      List<PmtDcmAppVO> appList = appMapper.selectPmtDcmAppAll(app.getPmtDcmNo());
	      
	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	      EmployeeVO emp = empAuth.getRealUser();
	      int comNo = emp.getComNo();
	      
	      int nowAppTrun = app.getPmtDcmAppTrun();
	      String staCode = app.getPmtDcmStaNo();
	      int recEmp = mapper.selectPmtDcmDetail(app.getPmtDcmNo()).getPmtDcmRecEmpno();
	      int dcmEmp = mapper.selectPmtDcmDetail(app.getPmtDcmNo()).getPmtDcmEmpno();
	      
	      PmtDcmAppVO updateApp = new PmtDcmAppVO();
	      PmtDcmVO updateDcmVO = new PmtDcmVO();

	      int oneTime = 0;
	      for (PmtDcmAppVO pmtDcmApp : appList) {
	         int trun = pmtDcmApp.getPmtDcmAppTrun();
	         int no = pmtDcmApp.getPmtDcmAppNo();
	         
	         if(
	            (staCode.equals("DB06140") && trun >= nowAppTrun+1) || 
	            (staCode.equals("DB06150") && trun >= nowAppTrun+1)
	         ) {
	            updateApp.setPmtDcmAppNo(no);
	            updateApp.setPmtDcmStaNo(staCode);
	            
	            updateDcmVO.setPmtDcmNo(pmtDcmApp.getPmtDcmNo());
	            
	            updateDcmVO.setPmtDcmStaNo("DB01140");
	            if(staCode.equals("DB06140")) {
	               updateDcmVO.setPmtDcmRecStano("DB01140");
	            }else {
	               updateDcmVO.setPmtDcmRecStano("DB01110");
	            }
	            
	            appMapper.updatePmtDcmAppLine(updateApp);
	            
	            AlarmVO alarm = new AlarmVO();
	            alarm.setEmpNo(pmtDcmApp.getPmtDcmAppEmpId());
	            alarm.setComNo(comNo);
	             if(staCode.equals("DB06140")) alarm.setAlarmComncode("결재예정 문서가 [완료:반려]되었습니다.");
	             else if(staCode.equals("DB06150")) alarm.setAlarmComncode("결재예정 문서가 [완료:전결]되었습니다.");
	            alarm.setAlarmChk("N");
	            alarm.setAlarmDate(LocalDateTime.now());
	            alarm.setAlarmHeader("문서결재 - 결재문서");
	            alarm.setAlarmCode(2);
	            alarm.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	            alarmService.createAlarm(alarm);
	            String notificationMessage = alarm.getAlarmComncode();
	            notificationWebSocketHandler.sendNotification(pmtDcmApp.getPmtDcmAppEmpId(), notificationMessage);

	             updateDcmVO.setPmtDcmEndStaNo(staCode);
	            mapper.updatePmtDcmRec(updateDcmVO);
	            if(oneTime==0) {
	               oneTime++;

		            AlarmVO meAlarm = new AlarmVO();
		            meAlarm.setEmpNo(app.getPmtDcmAppEmpId());
		            meAlarm.setComNo(comNo);
		             if(staCode.equals("DB06140")) meAlarm.setAlarmComncode("결재문서를 [완료:반려] 하였습니다.");
		             else if(staCode.equals("DB06150")) meAlarm.setAlarmComncode("결재문서를 [완료:전결] 하였습니다.");
		             meAlarm.setAlarmChk("N");
		             meAlarm.setAlarmDate(LocalDateTime.now());
		             meAlarm.setAlarmHeader("문서결재 - 결재문서");
		             meAlarm.setAlarmCode(2);
		             meAlarm.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
		            alarmService.createAlarm(meAlarm);
		            String meNotificationMessage = meAlarm.getAlarmComncode();
		            notificationWebSocketHandler.sendNotification(app.getPmtDcmAppEmpId(), meNotificationMessage);
	               
	               AlarmVO alarm2 = new AlarmVO();
	               alarm2.setEmpNo(recEmp);
	               alarm2.setComNo(comNo);
	                if(staCode.equals("DB06140")) alarm2.setAlarmComncode("수신예정 문서가 반려되어 [처리완료] 상태입니다.");
	                else if(staCode.equals("DB06150")) alarm2.setAlarmComncode("수신예정 문서가 전결되어 [처리대기] 상태입니다.");
	                alarm2.setAlarmChk("N");
	                alarm2.setAlarmDate(LocalDateTime.now());
	                alarm2.setAlarmHeader("문서결재 - 수신문서");
	                alarm2.setAlarmCode(2);
	                alarm2.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	               alarmService.createAlarm(alarm2);
	               String notificationMessage2 = alarm2.getAlarmComncode();
	               notificationWebSocketHandler.sendNotification(recEmp, notificationMessage2);
	               
	               
	               AlarmVO alarm3 = new AlarmVO();
	               alarm3.setEmpNo(dcmEmp);
	               alarm3.setComNo(comNo);
	                if(staCode.equals("DB06140")) alarm3.setAlarmComncode("작성한 문서가 [완료:반려]되었습니다.");
	                else if(staCode.equals("DB06150")) alarm3.setAlarmComncode("작성한 문서가 [완료:전결]되었습니다.");
	                alarm3.setAlarmChk("N");
	                alarm3.setAlarmDate(LocalDateTime.now());
	                alarm3.setAlarmHeader("문서결재 - 문서생성");
	                alarm3.setAlarmCode(2);
	                alarm3.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	               alarmService.createAlarm(alarm3);
	               String notificationMessage3 = alarm3.getAlarmComncode();
	               notificationWebSocketHandler.sendNotification(dcmEmp, notificationMessage3);               
	               
	            }
	            
	            
	         }else if(staCode.equals("DB06130") && trun == nowAppTrun+1) {
	            updateApp.setPmtDcmAppNo(no);
	            updateApp.setPmtDcmStaNo("DB06110");
	            appMapper.updatePmtDcmAppLine(updateApp);
	            
	            AlarmVO alarm = new AlarmVO();
	            alarm.setEmpNo(pmtDcmApp.getPmtDcmAppEmpId());
	            alarm.setComNo(comNo);
	             alarm.setAlarmComncode("결재예정 문서가 [대기상태]가 되었습니다.");
	            alarm.setAlarmChk("N");
	            alarm.setAlarmDate(LocalDateTime.now());
	            alarm.setAlarmHeader("문서결재 - 결재문서");
	            alarm.setAlarmCode(2);
	            alarm.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	            alarmService.createAlarm(alarm);
	            String notificationMessage = alarm.getAlarmComncode();
	            notificationWebSocketHandler.sendNotification(pmtDcmApp.getPmtDcmAppEmpId(), notificationMessage);
	            
	            AlarmVO meAlarm = new AlarmVO();
	            meAlarm.setEmpNo(app.getPmtDcmAppEmpId());
	            meAlarm.setComNo(comNo);
	             meAlarm.setAlarmComncode("결재문서를 [승인처리] 하였습니다.");
	             meAlarm.setAlarmChk("N");
	             meAlarm.setAlarmDate(LocalDateTime.now());
	             meAlarm.setAlarmHeader("문서결재 - 결재문서");
	             meAlarm.setAlarmCode(2);
	             meAlarm.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	            alarmService.createAlarm(meAlarm);
	            String meNotificationMessage = meAlarm.getAlarmComncode();
	            notificationWebSocketHandler.sendNotification(app.getPmtDcmAppEmpId(), meNotificationMessage);
	            
	            AlarmVO alarm3 = new AlarmVO();
	            alarm3.setEmpNo(dcmEmp);
	            alarm3.setComNo(comNo);
	             alarm3.setAlarmComncode("작성한 문서가 [진행:승인]되었습니다.");
	             alarm3.setAlarmChk("N");
	             alarm3.setAlarmDate(LocalDateTime.now());
	             alarm3.setAlarmHeader("문서결재 - 문서생성");
	             alarm3.setAlarmCode(2);
	             alarm3.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	            alarmService.createAlarm(alarm3);
	            String notificationMessage3 = alarm3.getAlarmComncode();
	            notificationWebSocketHandler.sendNotification(dcmEmp, notificationMessage3);
	            
	            
	         }else if(appList.size() == nowAppTrun) {
	            if(oneTime==0) {
	               oneTime++;
	               
	               updateDcmVO.setPmtDcmStaNo("DB01140");
	               updateDcmVO.setPmtDcmNo(pmtDcmApp.getPmtDcmNo());
	               if((staCode.equals("DB06140"))) {   
	                  updateDcmVO.setPmtDcmRecStano("DB01140");
	                  
	                  AlarmVO alarm = new AlarmVO();
	                  alarm.setEmpNo(app.getPmtDcmAppEmpId());
	                  alarm.setComNo(comNo);
	                   alarm.setAlarmComncode("결재문서를 [완료:반려처리] 하였습니다.");
	                  alarm.setAlarmChk("N");
	                  alarm.setAlarmDate(LocalDateTime.now());
	                  alarm.setAlarmHeader("문서결재 - 결재문서");
	                  alarm.setAlarmCode(2);
	                  alarm.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	                  alarmService.createAlarm(alarm);
	                  String notificationMessage = alarm.getAlarmComncode();
	                  notificationWebSocketHandler.sendNotification(app.getPmtDcmAppEmpId(), notificationMessage);
	                  
	                  
	                  AlarmVO alarm2 = new AlarmVO();
	                  alarm2.setEmpNo(recEmp);
	                  alarm2.setComNo(comNo);
	                   alarm2.setAlarmComncode("수신예정 문서가 반려되어 [처리완료] 상태입니다.");
	                   alarm2.setAlarmChk("N");
	                   alarm2.setAlarmDate(LocalDateTime.now());
	                   alarm2.setAlarmHeader("문서결재 - 수신문서");
	                   alarm2.setAlarmCode(2);
	                   alarm2.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	                  alarmService.createAlarm(alarm2);
	                  String notificationMessage2 = alarm2.getAlarmComncode();
	                  notificationWebSocketHandler.sendNotification(recEmp, notificationMessage2);
	                  
	                  AlarmVO alarm3 = new AlarmVO();
	                  alarm3.setEmpNo(dcmEmp);
	                  alarm3.setComNo(comNo);
	                   alarm3.setAlarmComncode("작성한 문서가 [완료:반려]되었습니다.");
	                   alarm3.setAlarmChk("N");
	                   alarm3.setAlarmDate(LocalDateTime.now());
	                   alarm3.setAlarmHeader("문서결재 - 문서생성");
	                   alarm3.setAlarmCode(2);
	                   alarm3.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	                  alarmService.createAlarm(alarm3);
	                  String notificationMessage3 = alarm3.getAlarmComncode();
	                  notificationWebSocketHandler.sendNotification(dcmEmp, notificationMessage3);
	                  
	               }else if(staCode.equals("DB06130")) {
	                  updateDcmVO.setPmtDcmRecStano("DB01110");
	                  
	                  AlarmVO alarm = new AlarmVO();
	                  alarm.setEmpNo(app.getPmtDcmAppEmpId());
	                  alarm.setComNo(comNo);
	                   alarm.setAlarmComncode("결재문서를 [완료:승인처리] 하였습니다.");
	                  alarm.setAlarmChk("N");
	                  alarm.setAlarmDate(LocalDateTime.now());
	                  alarm.setAlarmHeader("문서결재 - 결재문서");
	                  alarm.setAlarmCode(2);
	                  alarm.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	                  alarmService.createAlarm(alarm);
	                  String notificationMessage = alarm.getAlarmComncode();
	                  notificationWebSocketHandler.sendNotification(app.getPmtDcmAppEmpId(), notificationMessage);
	                  
	                  
	                  AlarmVO alarm2 = new AlarmVO();
	                  alarm2.setEmpNo(recEmp);
	                  alarm2.setComNo(comNo);
	                   alarm2.setAlarmComncode("수신예정 문서가 승인되어 [처리대기] 상태입니다.");
	                   alarm2.setAlarmChk("N");
	                   alarm2.setAlarmDate(LocalDateTime.now());
	                   alarm2.setAlarmHeader("문서결재 - 수신문서");
	                   alarm2.setAlarmCode(2);
	                   alarm2.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	                  alarmService.createAlarm(alarm2);
	                  String notificationMessage2 = alarm2.getAlarmComncode();
	                  notificationWebSocketHandler.sendNotification(recEmp, notificationMessage2);
	                  
	                  AlarmVO alarm3 = new AlarmVO();
	                  alarm3.setEmpNo(dcmEmp);
	                  alarm3.setComNo(comNo);
	                   alarm3.setAlarmComncode("작성한 문서가 [완료:승인]되었습니다.");
	                   alarm3.setAlarmChk("N");
	                   alarm3.setAlarmDate(LocalDateTime.now());
	                   alarm3.setAlarmHeader("문서결재 - 문서생성");
	                   alarm3.setAlarmCode(2);
	                   alarm3.setAlarmLink("gw/document/detail.do?what="+app.getPmtDcmNo());
	                  alarmService.createAlarm(alarm3);
	                  String notificationMessage3 = alarm3.getAlarmComncode();
	                  notificationWebSocketHandler.sendNotification(dcmEmp, notificationMessage3);
	               }
	               updateDcmVO.setPmtDcmEndStaNo(staCode);
	               mapper.updatePmtDcmRec(updateDcmVO);
	            }
	         }
	      }
	      appMapper.updatePmtDcmApp(app);
	   }


	@Override
	public void modifyPmtDcmRecEnd(int dcmNo) {
		mapper.updatePmtDcmRecEnd(dcmNo);
		
	}

	@Override
	public List<ComdcmFormVO> retrieveComdcmFormAll() {
		return formMapper.selectComdcmFormAll();		
	}

	@Override
	public ComdcmFormVO retrieveComdcmForm(String dcmFormCode) {
		return formMapper.selectComdcmForm(dcmFormCode);
	}

	@Override
	public List<PmtDcmVO> retrieveRelatedDcmAll(int empNo) {
		return mapper.selectRelatedDcmAll(empNo);
	}

	@Override
	public List<PositionVO> retrievePosComAll(int comNo) {
		// TODO Auto-generated method stub
		return positionMapper.selectPosComAll(comNo);
	}

	@Override
	@Transactional
	public int createPmtDcmAll(PmtDcmInsertVO dcmDetail, AtchFileVO files) {
		log.debug("Received PmtDcmInsertVO: {}", dcmDetail);
		//PmtDcmInsertVO상의 결재문서vo만 등록
		PmtDcmVO newDcm = dcmDetail.getPmtDcm();
		if (newDcm == null) {
		    log.error("PmtDcmVO is null. Cannot proceed with document number generation.");
		    throw new IllegalStateException("PmtDcmVO is null.");
		}
		Integer comNo = newDcm.getComNo();
		if (comNo == null) {
		    log.error("COM_NO is null. Cannot proceed with document number generation.");
		    throw new IllegalStateException("COM_NO is null.");
		}
		log.debug("COM_NO value: {}", comNo);
		log.debug("COM_NO value: {}", newDcm.getComNo());
		//문서번호 생성을 위한 기존 문서번호 생성규칙 확인
		ComdcmNumVO dcmNum = comdcmNumMapper.selectComdcmNum(newDcm.getComNo());
		
		//문서번호 연원일 설정
		int year = LocalDate.now().getYear();
        int shortYear = year % 100;
		int month = LocalDate.now().getMonthValue();
		int day = LocalDate.now().getDayOfMonth();
		String dateCnf = "";
		if(dcmNum.getDateCnfNo().equals("DB03110")) {
			dateCnf = ""+shortYear;
		}else if(dcmNum.getDateCnfNo().equals("DB03120")) {
			dateCnf = ""+year;
		}else if(dcmNum.getDateCnfNo().equals("DB03130")) {
			dateCnf = ""+year+month;
		}else if(dcmNum.getDateCnfNo().equals("DB03140")) {
			dateCnf = ""+year+month+day;
		}
		
		//문서번호 구분자 설정
		String disCnf = "";
		if(dcmNum.getDcmDisCnfNo().equals("DB04110")) { 
			disCnf = "_";
		}else if(dcmNum.getDcmDisCnfNo().equals("DB04120")) {
			disCnf = "-";
		}else if(dcmNum.getDcmDisCnfNo().equals("DB04130")) {
			disCnf = "/";
		}else if(dcmNum.getDcmDisCnfNo().equals("DB04140")) {
			disCnf = "~";
		}else if(dcmNum.getDcmDisCnfNo().equals("DB04150")) {
			disCnf = " ";
		}
		
		//문서번호 일련번호 설정
		int number = dcmNum.getDcmNum();  
		String formattedNum = String.format("%0"+dcmNum.getDcmNumLen()+"d", number);
		
		//문서번호 구성 설정
		String newDcmNum = "";
		if(dcmNum.getDcmNumCnfNo().equals("DB02110")) {
			newDcmNum = dateCnf+disCnf+newDcm.getDcmFormCode()+disCnf+formattedNum;
		}else if(dcmNum.getDcmNumCnfNo().equals("DB02120")) {
			newDcmNum = newDcm.getDcmFormCode()+disCnf+formattedNum;
		}else if(dcmNum.getDcmNumCnfNo().equals("DB02130")) {
			newDcmNum = formattedNum;
		}else if(dcmNum.getDcmNumCnfNo().equals("DB02140")) {
			newDcmNum = dateCnf+disCnf+formattedNum;
		}

		//문서번호 일련번호 업데이트
		ComdcmNumVO updateComdcm = new ComdcmNumVO();
		updateComdcm.setComdcmNumNo(dcmNum.getComdcmNumNo());
		updateComdcm.setComdcmNumNo(number+1);
		comdcmNumMapper.updateComdcmCount(updateComdcm);
		
		//결재문서에 문서번호 등록
		newDcm.setComdcmNum(newDcmNum);
		


		Optional.ofNullable(files)
		.ifPresent(af->{
			atchFileService.createAtchFile(af, saveFolder);
			newDcm.setPmtDcmAttno(af.getAtchFileId());
		});

		
		//결재문서 생성
		mapper.insertPmtDcm(newDcm);
		
		int pmtDcmNo = newDcm.getPmtDcmNo();
	    
		AlarmVO newDcmAlarm = new AlarmVO();
		newDcmAlarm.setEmpNo(newDcm.getPmtDcmEmpno());
		newDcmAlarm.setComNo(comNo);
		newDcmAlarm.setAlarmComncode("결재문서를 [생성]하였습니다.");
		newDcmAlarm.setAlarmChk("N");
		newDcmAlarm.setAlarmDate(LocalDateTime.now());
		newDcmAlarm.setAlarmHeader("문서결재 - 문서생성");
		newDcmAlarm.setAlarmCode(2);
		newDcmAlarm.setAlarmLink("gw/document/detail.do?what="+pmtDcmNo);
		            
		alarmService.createAlarm(newDcmAlarm);

		String newDcmNotificationMessage = newDcmAlarm.getAlarmComncode();
		notificationWebSocketHandler.sendNotification(newDcm.getPmtDcmEmpno(), newDcmNotificationMessage);
	    
		AlarmVO newDcmAlarm2 = new AlarmVO();
		newDcmAlarm2.setEmpNo(newDcm.getPmtDcmRecEmpno());
		newDcmAlarm2.setComNo(comNo);
		newDcmAlarm2.setAlarmComncode("새로운 결재문서가 [수신예정]입니다.");
		newDcmAlarm2.setAlarmChk("N");
		newDcmAlarm2.setAlarmDate(LocalDateTime.now());
		newDcmAlarm2.setAlarmHeader("문서결재 - 수신문서");
		newDcmAlarm2.setAlarmCode(2);
		newDcmAlarm2.setAlarmLink("gw/document/detail.do?what="+pmtDcmNo);
		            
		alarmService.createAlarm(newDcmAlarm2);

		String newDcmNotificationMessage2 = newDcmAlarm2.getAlarmComncode();
		notificationWebSocketHandler.sendNotification(newDcm.getPmtDcmRecEmpno(), newDcmNotificationMessage2);
		
		for (int i = 1; i <= 5; i++) {
		    Integer empId = 0;
		    switch (i) {
		        case 1:
		            empId = dcmDetail.getPmtDcmAppEmpId1();
		            break;
		        case 2:
		            empId = dcmDetail.getPmtDcmAppEmpId2();
		            break;
		        case 3:
		            empId = dcmDetail.getPmtDcmAppEmpId3();
		            break;
		        case 4:
		            empId = dcmDetail.getPmtDcmAppEmpId4();
		            break;
		        case 5:
		            empId = dcmDetail.getPmtDcmAppEmpId5();
		            break;
		    }
		    if(empId == null) break;
		    
		    EmployeeVO empInfo = empMapper.selectEmployeeInfo(empId);

		    PmtDcmAppVO appEmp = new PmtDcmAppVO();
		    appEmp.setPmtDcmAppEmpId(empId);
		    if( i == 1) appEmp.setPmtDcmStaNo("DB06110");
		    else appEmp.setPmtDcmStaNo("DB06120");
		    appEmp.setPmtDcmAppEmpNm(empInfo.getEmpNm());
		    appEmp.setPmtDcmAppEmpPos(empInfo.getCompany().getPositionList().get(0).getPosNm());
		    appEmp.setPmtDcmAppEmpOnepos(empInfo.getCompany().getPositionList().get(0).getONEPOSNM());
		    appEmp.setPmtDcmAppEmpOneposNo(empInfo.getCompany().getPositionList().get(0).getPosNo());
		    appEmp.setPmtDcmAppEmpDep(empInfo.getCompany().getOrganizationList().get(0).getOrgDep());
		    appEmp.setPmtDcmNo(pmtDcmNo);
		    appEmp.setPmtDcmAppTrun(i);
		    
		    appMapper.insertPmtDcmApp(appEmp);
		    
			AlarmVO alarm = new AlarmVO();
			alarm.setEmpNo(empId);
			alarm.setComNo(comNo);
		    if( i == 1) alarm.setAlarmComncode("새로운 결재문서가 [대기상태]입니다.");
		    else alarm.setAlarmComncode("새로운 결재문서가 [예정상태]입니다.");
			alarm.setAlarmChk("N");
			alarm.setAlarmDate(LocalDateTime.now());
			alarm.setAlarmHeader("문서결재 - 결재문서");
			alarm.setAlarmCode(2);
			alarm.setAlarmLink("gw/document/detail.do?what="+pmtDcmNo);
			            
			alarmService.createAlarm(alarm);

			String notificationMessage = alarm.getAlarmComncode();
			notificationWebSocketHandler.sendNotification(empId, notificationMessage);

		}
		
		List<PmtDcmRefNoVO> pmtDcmPrfEmpList = dcmDetail.getPmtDcmPrfEmpList();
		
		for (PmtDcmRefNoVO dcmRef : pmtDcmPrfEmpList) {
			dcmRef.setPmtDcmNo(pmtDcmNo);
			refMapper.insertPmtDcmRefNo(dcmRef);
			
			AlarmVO alarm = new AlarmVO();
			alarm.setEmpNo(dcmRef.getPmtDcmRefEmpNo());
			alarm.setComNo(comNo);
			alarm.setAlarmComncode("새로운 결재문서에 [참조]되었습니다.");
			alarm.setAlarmChk("N");
			alarm.setAlarmDate(LocalDateTime.now());
			alarm.setAlarmHeader("문서결재 - 참조문서");
			alarm.setAlarmCode(2);
			alarm.setAlarmLink("gw/document/detail.do?what="+pmtDcmNo);
			            
			alarmService.createAlarm(alarm);

			String notificationMessage = alarm.getAlarmComncode();
			notificationWebSocketHandler.sendNotification(dcmRef.getPmtDcmRefEmpNo(), notificationMessage);

		}
		return pmtDcmNo;
	}

	@Override
	public PmtDcmVO retrieveMyDcmCount(int empNo) {
		return mapper.selectMyDcmCount(empNo);
	}
	
	@Override
	public ComdcmNumVO retrieveComdcmNum(int comNo) {
		return comdcmNumMapper.selectComdcmNum(comNo);
	};
	
	@Override
	public int modifyComdcmNum(ComdcmNumVO comdcm) {
		return comdcmNumMapper.updateComdcmNum(comdcm);
	};
	
}
