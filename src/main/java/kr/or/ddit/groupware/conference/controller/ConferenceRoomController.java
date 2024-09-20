package kr.or.ddit.groupware.conference.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
@RequestMapping("/gw/conference")
public class ConferenceRoomController {

    private static final String API_URL = "https://openapi.gooroomee.com/api/v1/room/";

    @GetMapping("/room/{roomUrlId}")
    public ResponseEntity<String> getRoomInfo(
            @PathVariable String roomUrlId,
            @RequestParam(value = "type", defaultValue = "roomUrlId") String type) {

        String urlString = API_URL + roomUrlId;
        if ("roomId".equals(type)) {
            urlString += "?type=roomId";
        }

        try {
            URL url = new URL(urlString);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("accept", "application/json");
            connection.setRequestProperty("X-GRM-AuthToken", "12056163501988613cf51b7b51cdd8140bb172761d02211a8b");

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            String roomId = extractRoomIdFromResponse(response.toString());

            return ResponseEntity.ok(roomId);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred: " + e.getMessage());
        }
    }

    private String extractRoomIdFromResponse(String response) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response);

            JsonNode roomNode = jsonNode.path("data").path("room");
            return roomNode.path("roomId").asText();
        } catch (Exception e) {
            return "Error parsing roomId";
        }
    }
}
