package kr.or.ddit.groupware.conference.controller;

import java.io.IOException;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import okhttp3.*;

@Controller
public class ConferenceInsertController {

    private static final String API_URL = "https://openapi.gooroomee.com/api/v1/room";
    private static final String AUTH_TOKEN = "12056163501988613cf51b7b51cdd8140bb172761d02211a8b"; // 여기에 실제 인증 토큰을 사용하세요

    @RequestMapping(value = "/gw/conference/createRoom", method = RequestMethod.POST)
    @ResponseBody
    public RedirectView createRoom(@RequestParam Map<String, String> params) {
        OkHttpClient client = new OkHttpClient();

        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        String formData = params.entrySet().stream()
            .map(entry -> entry.getKey() + "=" + entry.getValue())
            .collect(Collectors.joining("&"));
        RequestBody body = RequestBody.create(formData, mediaType);

        Request request = new Request.Builder()
            .url(API_URL)
            .post(body)
            .addHeader("accept", "application/json")
            .addHeader("content-type", "application/x-www-form-urlencoded")
            .addHeader("X-GRM-AuthToken", AUTH_TOKEN)
            .build();

        try {
            Response response = client.newCall(request).execute();
            if (response.isSuccessful()) {
                // 방 생성 성공 시 리다이렉트
                return new RedirectView("/connect/gw/conference/conferenceList.do"+ "?&success=true");
                
            } else {
                // 방 생성 실패 시 에러 페이지로 리다이렉트
                return new RedirectView("/errorPage.do");
            }
        } catch (IOException e) {
            return new RedirectView("/errorPage.do");
        } catch (Exception e) {
            return new RedirectView("/errorPage.do");
        }
    }
}
