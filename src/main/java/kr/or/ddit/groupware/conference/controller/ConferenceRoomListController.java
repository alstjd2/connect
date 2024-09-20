package kr.or.ddit.groupware.conference.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import java.io.IOException;

@Controller
@RequestMapping("gw/conference/api")
public class ConferenceRoomListController {
	private static final String BASE_URL = "https://openapi.gooroomee.com/api/v1/room/list";
    private static final String AUTH_TOKEN = "12056163501988613cf51b7b51cdd8140bb172761d02211a8b";  // 실제 인증 토큰
 
    @GetMapping("/listMeetings")
    @ResponseBody
    public String listMeetings() {
        OkHttpClient client = new OkHttpClient();

        // URL 쿼리 파라미터 설정
        String url = String.format("%s?page=%d&limit=%d&sortCurrJoinCnt=%b", BASE_URL, 1, 35, true);

        // GET 요청
        Request request = new Request.Builder()
                .url(url)
                .get()
                .addHeader("accept", "application/json")
                .addHeader("X-GRM-AuthToken", AUTH_TOKEN)  // 인증 헤더 추가
                .build();

        // 요청 실행 및 응답 처리
        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected code " + response);
            }
            return response.body().string();  // JSON 문자열 반환
        } catch (IOException e) {
            e.printStackTrace();
            return "{\"error\": \"Failed to fetch meetings\"}";
        }
    }
}
