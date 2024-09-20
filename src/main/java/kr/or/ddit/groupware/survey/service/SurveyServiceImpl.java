package kr.or.ddit.groupware.survey.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.chi.dao.ChiMapper;
import kr.or.ddit.groupware.cls.dao.ClsMapper;
import kr.or.ddit.groupware.svy.dao.SvyAnsListMapper;
import kr.or.ddit.groupware.svy.dao.SvyAnsMapper;
import kr.or.ddit.groupware.svy.dao.SvyAskMapper;
import kr.or.ddit.groupware.svy.dao.SvyMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.ChiVO;
import kr.or.ddit.vo.ClsVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.SvyAnsListVO;
import kr.or.ddit.vo.SvyAnsVO;
import kr.or.ddit.vo.SvyAskVO;
import kr.or.ddit.vo.SvyVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SurveyServiceImpl implements SurveyService {
	private final SvyMapper mapper;
	private final SvyAnsMapper ansMapper;
	private final SvyAnsListMapper ansListMapper;
	private final ChiMapper chiMapper;
	private final ClsMapper clsMapper;
	private final SvyAskMapper svyAskMapper;
	private final AlarmService alarmService;
	private final NotificationWebSocketHandler notificationWebSocketHandler;

	@Override
	public List<SvyVO> retrieveComSvyList(int comNo) {
		mapper.updateSvyList();
		return mapper.selectComSvyList(comNo);
	}

	@Override
	public List<SvyVO> retrieveMySvyList(int empNo) {
		mapper.updateSvyList();
		return mapper.selectMyAskSvyList(empNo);
	}

	@Override
	public List<SvyVO> retrieveMyAnsSvyList(int empNo) {
		mapper.updateSvyList();
		return mapper.selectMyAnsSvyList(empNo);
	}

	@Override
	public List<SvyAnsVO> retrieveSvyAnsDetailList(SvyAnsVO svyAns) {
		mapper.updateSvyList();
		return ansMapper.selectSvyAnsDetailList(svyAns);
	}

	@Override
	public SvyVO retrieveSvyDetail(int svyNo) {
		mapper.updateSvyList();
		return mapper.selectSvy(svyNo);
	}

	@Override
	public List<SvyAnsVO> retrieveSvyAnsList(int svyNo) {
		mapper.updateSvyList();
		return ansMapper.selectSvyAnsList(svyNo);
	}

	@Override
	public List<SvyVO> retrieveSvyList(int svyNo) {
		mapper.updateSvyList();
		return mapper.selectSvyList(svyNo);
	}

	@Override
	public List<SvyVO> retrieveSvyInsertContent(int svyNo) {
		mapper.updateSvyList();
		return mapper.selectSvyInsertContent(svyNo);
	}

	@Override
	public void modifySvyAns(int svyAnsNo) {
		mapper.updateSvyList();
		ansMapper.updateSvyAns(svyAnsNo);
	}

	@Override
	public void createSvyAnsList(SvyAnsListVO svyAnsList) {
		ansListMapper.insertSvyAnsList(svyAnsList);
	}

	@Override
	public void modifySvy(int svyNo) {
		mapper.updateSvy(svyNo);
		
	}

	@Override
	public int retrieveSvyAnsNo(SvyAnsVO svyAns) {
		mapper.updateSvyList();
		return ansMapper.selectSvyAnsNo(svyAns).getSvyAnsNo();
	}

	@Override
	@Transactional
	public int createSvy(SvyVO svy) {		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		EmployeeVO emp = empAuth.getRealUser();
		
		svy.setSvyTemYn("N");
		
		svy.setSvyImpYn(svy.getSvyImpYn() != null ? "Y":"N");
		svy.setSvyAnyYn(svy.getSvyAnyYn() != null ? "Y":"N");
		svy.setSvyAllYn(svy.getSvyAllYn() != null ? "Y":"N");
		
		if(svy.getSvyAllYn().equals("Y")) {
			svy.setSvyEndDate(null);
		}
		
		LocalDate today = LocalDate.now();
		
		LocalDate svyStrDate = svy.getSvyStrDate();
		
		if(svyStrDate.isEqual(today)) {
			svy.setSvyStatus("진행중");
		}else if(svyStrDate.isAfter(today)) {
			svy.setSvyStatus("대기");
		}else {
			svy.setSvyStatus("종료");
		}
		
		mapper.insertSvy(svy);
		int svyNo = svy.getSvyNo();

        sendApproval(emp.getEmpNo(),emp.getComNo(),"새로운 설문이 [생성]되었습니다.","만든 설문",svyNo );
		
		SvyAskVO svyAsk = new SvyAskVO();
		svyAsk.setSvyNo(svyNo);
		svyAsk.setEmpNo(emp.getEmpNo());
		
		svyAskMapper.insertSvyAsk(svyAsk);
		
		for (ChiVO chi : svy.getChiList()) {
			chi.setSvyNo(svyNo);
			chi.setChiOvlYn(chi.getChiOvlYn() !=null ? "Y":"N");			
			chiMapper.insertChi(chi);
			int chiNo = chi.getChiNo();
			
			for (ClsVO cls : chi.getClsList()) {
				cls.setChiNo(chiNo);
				clsMapper.insertCls(cls);
			}
		}
		
		// JSONArray 생성
        JSONArray jsonArray = new JSONArray(svy.getSvyAnsListString());
        
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            SvyAnsVO svyAns = new SvyAnsVO();
            
            svyAns.setSvyNo(svyNo);
            svyAns.setEmpNo(jsonObject.getInt("pmtDcmRefEmpNo"));
            ansMapper.insertSvyAns(svyAns);
            sendApproval(jsonObject.getInt("pmtDcmRefEmpNo"),emp.getComNo(),"새로운 설문에 [답변] 해주세요.","받은 설문",svyNo );
		}
		
		return svyNo;
	}
	
	public void sendApproval(int empNo, int comNo, String comn, String header, int svyNo) {
	    // Alarm 객체 생성 및 값 설정
	    AlarmVO alarm = new AlarmVO();
	    alarm.setEmpNo(empNo);
	    alarm.setComNo(comNo);
	    alarm.setAlarmComncode(comn);
	    alarm.setAlarmChk("N");
	    alarm.setAlarmDate(LocalDateTime.now());
	    alarm.setAlarmHeader("설문 - "+header);
	    alarm.setAlarmCode(5);
	    alarm.setAlarmLink("gw/survey/detail.do?what=" + svyNo);
	    
	    // Alarm 생성
	    alarmService.createAlarm(alarm);

	    // WebSocket을 통한 알림 전송
	    String notificationMessage = alarm.getAlarmComncode();
	    notificationWebSocketHandler.sendNotification(empNo, notificationMessage);
	}

	@Override
	public SvyAskVO retrieveSvyAsk(int svyNo) {
		return svyAskMapper.selectSvyAsk(svyNo);
	}

}
