package kr.or.ddit.groupware.mail.service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.google.api.client.auth.oauth2.BearerToken;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.BasicAuthentication;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.Value;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.model.ListMessagesResponse;
import com.google.api.services.gmail.model.Message;
import com.google.api.services.gmail.model.MessagePart;
import com.google.api.services.gmail.model.MessagePartHeader;

import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.groupware.alarm.controller.NotificationWebSocketHandler;
import kr.or.ddit.groupware.alarm.service.AlarmService;
import kr.or.ddit.groupware.employee.dao.EmployeeMapper;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.MailVO;
import kr.or.ddit.vo.mailSerchVO;
import lombok.extern.slf4j.Slf4j;


/**
 * Gmail API 활용 로직
 */
@Slf4j
@Service
public class GmailService  {
	@Autowired
	private OAuthService oAuthService;
	@Autowired
	private EmployeeMapper empMapper;
	@Autowired
	private CredentialManager credentialManager;

	@Autowired
	private AlarmService alarmService;
	@Autowired
	private NotificationWebSocketHandler notificationWebSocketHandler;

	@Value("#{appInfo.gmailPath}")
	private String applicationName;

	private static final String TOKENS_DIRECTORY_PATH = "tokens";
	private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();

	private NetHttpTransport HTTP_TRANSPORT;

	@PostConstruct
	public void init() throws GeneralSecurityException, IOException {
		HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
	}

	private Gmail createGmailService(Credential credential) {
		return new Gmail.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(applicationName).build();
	}

	public static Credential createCredentialWithRefreshToken(HttpTransport transport, JsonFactory jsonFactory,
			TokenResponse tokenResponse) {
		return new Credential.Builder(BearerToken.authorizationHeaderAccessMethod()).setTransport(transport)
				.setJsonFactory(jsonFactory).setTokenServerUrl(new GenericUrl("https://server.example.com/token"))
				.setClientAuthentication(new BasicAuthentication("a-123456@connectapi-433302.iam.gserviceaccount.com", "9437506887074621931")).build()
				.setFromTokenResponse(tokenResponse);
	}



    public void delteEmail(String userId, Credential credential, String mesaggeId) throws Exception {

    	// 액세스 토큰 유효성 검사
    	if (!credential.refreshToken()) {
    		// 액세스 토큰 갱신 시도
    		if (credential.getExpiresInSeconds() < 60) {
    			try {
    				credential.refreshToken();
    				// 갱신된 토큰을 저장
    				// ...
    			} catch (IOException e) {
    				// 갱신 실패 시 처리
    				System.err.println("Token refresh failed.");
    				e.printStackTrace();
    			}
    		}
    	}

    	// 자격증명 가져오기
    	Gmail gmail = createGmailService(credential);
    	gmail.users().messages().delete(userId, mesaggeId).execute();
    }


    /**
     * 보낸사람 이름 제작
     * @return[HDC - 인사1팀 / 대리] 황혜원
     */
    private String creatName() {
    	String to="[";
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();

	    String comNm = empAuth.getRealUser().getCompany().getComNm();
	    String empNm = empAuth.getRealUser().getEmpNm();
	    String dep = empAuth.getRealUser().getEmpOneposName();
	    String pos = empAuth.getRealUser().getEmpPosName();

	    to +=comNm +"-"+dep+"/"+pos+"] "+empNm;
    	return to;
    }


    public void sendEmail(MailVO mailInfo, Credential credential) throws Exception {

		 boolean valid =  credentialManager.validateCredential(credential);
		 Gmail gmail = createGmailService(credential);

		 int size = mailInfo.getAdd().length;

		 String userMailAddress = oAuthService.getUserEmail(credential);
		 String userId = "me";
		 String emailAddress = userMailAddress;
		 String subject = mailInfo.getTitle();
		 String bodyText = mailInfo.getContent();

		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
		 String comNm = empAuth.getRealUser().getCompany().getComNm();
		 int comNo = empAuth.getRealUser().getComNo();

		 for(int i=1; i<= size; i++) {
			 log.info("i : {}",i);

			 String to = mailInfo.getAdd()[i-1];
			 String sendAsEmail = to.split("_")[1];
			 to = to.split("_")[0];
			 log.info("to : {}",to);

			 MimeMessage emailContent = createEmail(to, emailAddress, subject, bodyText, sendAsEmail);

			 log.info("emailContent : {}",emailContent);
			 Message message = createMessageWithEmail(emailContent);
			 log.info("message : {}",message);
			 gmail.users().messages().send(userId ,message).execute();

			 if(sendAsEmail.contains(comNm)) {
				 //알람을 위한
				 mailSerchVO vo = createVo(sendAsEmail,comNo);
				 int empNo = empMapper.selectEmpNo(vo);
				 alarmSet(empNo, comNo, sendAsEmail,subject);
			 }
		 }
	}

    private void alarmSet(int empNo, int comNo, String from, String title) {

    	AlarmVO alarm = new AlarmVO();
    	alarm.setEmpNo(empNo);
    	alarm.setComNo(comNo);
    	alarm.setAlarmComncode(from+" 님의 메일 (미리보기:"+title+")");
    	alarm.setAlarmChk("N");
    	alarm.setAlarmDate(LocalDateTime.now());
    	alarm.setAlarmHeader("메일");
    	alarm.setAlarmCode(11);
    	alarm.setAlarmLink("gw/gmail");

    	alarmService.createAlarm(alarm);

    	String notificationMessage = alarm.getAlarmComncode();
    	notificationWebSocketHandler.sendNotification(empNo, notificationMessage);

    }


    /**
     * empNo 조회를 위한 기본정보 분할하여 세팅
     * @param str
     * @return
     */
    private mailSerchVO createVo(String str, int comNo) {

    	mailSerchVO serchInfo = new mailSerchVO();
    	// [HDC - 인사1팀 / 대리]
    	str = str.replace("[", "");
		str = str.replace("]", "_");
		str = str.replace("-", "_");
		str = str.replace("/", "_");

		String[] info = str.split("_", 4);

		String comNm= info[0];
		String posNm= info[1];
		String orgDep= info[2];
		String empNm= info[3];

		serchInfo.setComNm(comNm.trim());
		serchInfo.setPosNm(posNm.trim());
		serchInfo.setOrgDep(orgDep.trim());
		serchInfo.setEmpNm(empNm.trim());
		serchInfo.setComNo(comNo);

    	return serchInfo;
    }






	private MimeMessage createEmail(String toEmailAddress, String fromEmailAddress, String subject, String bodyText ,String sendAsEmail)
			throws MessagingException, UnsupportedEncodingException {
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);

		MimeMessage email = new MimeMessage(session);
		email.setFrom(new InternetAddress(fromEmailAddress,creatName()));
		email.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(toEmailAddress,sendAsEmail));
		email.setSubject(subject);
		email.setText(bodyText);

		return email;
	}

	private Message createMessageWithEmail(MimeMessage emailContent)
		      throws MessagingException, IOException {
	    ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	    emailContent.writeTo(buffer);
	    byte[] bytes = buffer.toByteArray();
	    String encodedEmail = com.google.api.client.util.Base64.encodeBase64URLSafeString(bytes);
	    Message message = new Message();
	    message.setRaw(encodedEmail);
	    return message;
	}


	/**
	 * 메일 서버로부터의 동기화 주기 설정 및 배치 처리를 활용한 비동기 조회가 필요함. 메일 목록 불러오기
	 *
	 * @param credential
	 * @param userId
	 * @return
	 * @throws IOException
	 */
	public List<Map<String, String>> mailList(Credential credential, String userId) throws IOException {
		Gmail gmail = createGmailService(credential);
		// MetaData 만 조회
		ListMessagesResponse listMessageResponse = gmail.users().messages().list(userId).execute();
		List<Map<String, String>> mailList = new ArrayList<Map<String, String>>();

		int cnt = 0;
		for (Message mailMessage : listMessageResponse.getMessages()) {
			cnt++;

			Map<String, String> rowData = new HashMap<String, String>();
			// 내용 요약본
			String snippets = gmail.users().messages().get(userId, mailMessage.getId()).execute().getSnippet();

			snippets = snippets.replaceAll("&#39;", "'");
			snippets = snippets.replaceAll("&quot;", "\"");

			// 송수신 날짜+시간 포맷
			long date = gmail.users().messages().get(userId, mailMessage.getId()).execute().getInternalDate();
			Instant instant = Instant.ofEpochMilli(date);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime localDateTime = instant.atZone(ZoneId.systemDefault()).toLocalDateTime();
			String dateTime = localDateTime.format(formatter);

			List<MessagePartHeader> mail = gmail.users().messages().get(userId, mailMessage.getId()).execute()
					.getPayload().getHeaders();

			// Delivered-To 받은 메일 , MIME-Version 보낸 메일
			String type = mail.get(0).getName();
			String from = "";
			String to = "";
			String subject = "";
			String messageId = "";
			String contentType = "";
			String content = "";
			String sent="false";
			cnt++;

			// 헤더에서 보낸사람, 받은사람
			for (MessagePartHeader mul : gmail.users().messages().get(userId, mailMessage.getId()).execute()
					.getPayload().getHeaders()) {
				//헤더 정보 다 가져오기
//				log.info(" {}  :  {}" , mul.getName(), mul.getValue());

				if (mul.getName().equals("From"))
					from = mul.getValue(); // 보낸사람
				if (mul.getName().equals("To")) {
					to = mul.getValue(); // 받는사람
					if( to.contains(userId)) sent="true";
				}
				if (mul.getName().equals("Subject"))
					subject = mul.getValue(); // 제목
				if (mul.getName().equals("Message-ID"))
					messageId = mul.getValue(); // 메세지ID
				if (mul.getName().equals("Content-Type"))
					contentType = mul.getValue().split(";")[0];
			}

			rowData.put("type", type);	// 받는 메일인지 보낸 메일인지
			rowData.put("to", to);		// 받는 사람
			rowData.put("sent", sent);	// 내가 보냈는지 false가 내가 보냄(초기 잘못설정)
			rowData.put("from", from);	// 보낸 사람
			rowData.put("subject", subject);	// 메일 제목
			rowData.put("dateTime", dateTime);	// 보낸 일시
			rowData.put("snippets", snippets);	// 메일 짧은 내용
			rowData.put("messageId", messageId);	// 메세지 일련ID
			rowData.put("contentType", contentType);	//메세지 타입

			//본문 읽기
			List<String> contents = new ArrayList();
			List<MessagePart> parts = gmail.users().messages().get(userId, mailMessage.getId()).execute().getPayload().getParts();

//			log.info("parts 시작");
			if( parts != null) {
				for(MessagePart part : parts) {
					String base64 = part.getBody().getData();
					if(part.getMimeType().equals("text/plain") && part.getBody().getData() != "" && part.getBody().getData() != null) {
					     byte[] decodedBytes = Base64.getUrlDecoder().decode(base64.getBytes());
					     content = new String(decodedBytes);
					}else  {
//						part.getMimeType().contains("multipart") 는 생략
						//본문이 없거나 content-type이 multipart/mixed , multipart/alternative 일 경우 생략
						content = snippets;
					}
				}
				rowData.put("content", content);	// 메일 본문
			}
			mailList.add(rowData);
			if (cnt == 20) break;
		}

		return mailList;
	}

}