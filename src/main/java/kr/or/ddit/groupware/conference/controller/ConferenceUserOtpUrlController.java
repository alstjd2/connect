package kr.or.ddit.groupware.conference.controller;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.RequestBody;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

import java.io.IOException;

@RestController
@RequestMapping("gw/conference/meeting")
public class ConferenceUserOtpUrlController {

    private final OkHttpClient client = new OkHttpClient();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @PostMapping("/join")
    public ResponseEntity<String> joinMeetingRoom(
            @RequestParam String roomId,
            @RequestParam String username,
            @RequestParam String roleId,
            @RequestParam(defaultValue = "gooroomee-tester") String apiUserId,
            @RequestParam(defaultValue = "false") boolean ignorePasswd) {

        // 미팅룸 접속 URL을 가져오기 위해 외부 API 호출 준비
        MediaType mediaType = MediaType.get("application/x-www-form-urlencoded");
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
        
        apiUserId = emp.getEmpNm();
        String bodyContent = "roomId=" + roomId +
                "&username=" + username +
                "&roleId=" + roleId +
                "&apiUserId=" + apiUserId +
                "&ignorePasswd=" + ignorePasswd;

        RequestBody body = RequestBody.create(bodyContent, mediaType);
        Request request = new Request.Builder()
                .url("https://openapi.gooroomee.com/api/v1/room/user/otp/url")
                .post(body)
                .addHeader("accept", "application/json")
                .addHeader("content-type", "application/x-www-form-urlencoded")
                .addHeader("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b")
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (response.isSuccessful()) {
                String responseData = response.body().string();

                // 응답 데이터에서 URL 추출
                JsonNode jsonNode = objectMapper.readTree(responseData);
                JsonNode urlNode = jsonNode.path("data").path("url");
                if (urlNode.isTextual()) {
                    return ResponseEntity.ok(urlNode.asText());
                } else {
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                            .body("Error: URL not found in response");
                }
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("Error: " + response.message());
            }
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error occurred: " + e.getMessage());
        }
    }
}
