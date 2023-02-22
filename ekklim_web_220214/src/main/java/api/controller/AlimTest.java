package api.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import api.model.GiftDAO;
import api.model.GiftcardsDAO;
import api.model.LodgementsDAO;
import api.model.ReservationDAO;
import api.model.TotalDAO;

@WebServlet("/alimtest")
public class AlimTest extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		String TAG = "alim : ";
		
		HttpURLConnection conn = null;
		
		JSONArray data = new JSONArray() {{
			add(new JSONObject() {{
				put("msgid", "TEST_20220412_1202");
				put("message_type", "AT");
				put("profile_key", "5f9838f16f933b6ca6b6b39fc70f692f4e99b1ca");
				put("receiver_num", "821022677688");
				put("template_code", "buyinhotel_get_gift");
				put("message", "(바이인호텔) 선물이 도착했습니다.\n김지훈님께서 정민규님께 선물을 보냈습니다.\n\n■상품명 : 상품이름\n■보낸분 : 김지훈\n\n자세한 내용은 아래 링크를 눌러 상세 내역을 확인하실 수 있습니다.");
				put("reserved_time", "00000000000000");
				put("button1", new JSONObject() {{
					put("name", "선물내역 확인");
					put("type", "AL");
					put("scheme_android", "https://buyinhotel.page.link/nMQh");
					put("url_mobile", "http://www.buyinhotel.co.kr/mypage/gift?type=1");
				}});
			}});
		}};
		
		System.out.println(TAG + "POST " + data.toString());
		
		try {
			URL url = new URL("https://alimtalk-api.sweettracker.net/v2/5f9838f16f933b6ca6b6b39fc70f692f4e99b1ca/sendMessage");
			conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("userid", "adiot4015");
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true

			// data 보내기
			OutputStream os = conn.getOutputStream();
			byte[] input = data.toString().getBytes("utf-8");
			os.write(input, 0, input.length);	
			
            int responseCode = conn.getResponseCode();
            
            if (responseCode == 200) {
            	System.out.println(TAG + "postMission " + responseCode);
				// 서버로부터 데이터 읽어오기
            	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				
				while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
					sb.append(line);
				}
				
				System.out.println(TAG + sb.toString());
				
				JSONArray obj = (JSONArray) JSONValue.parse(sb.toString()); // json으로 변경 (역직렬화)
//				System.out.println("access_token= " + obj.get("access_token") + " / expires_in= " + obj.get("expires_in"));
				
				script.print(obj);
				script.flush();
				
            } else if (responseCode == 401) {
            	System.out.println(TAG + "postMission " + responseCode);
				// 서버로부터 데이터 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				
				while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
					sb.append(line);
				}
				
				System.out.println(TAG + sb.toString());
				
				JSONArray obj = (JSONArray) JSONValue.parse(sb.toString()); // json으로 변경 (역직렬화)
				
				script.print(obj);
				script.flush();
				
            } else {
            	System.out.println(TAG + "postMission " + responseCode);
				// 서버로부터 데이터 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				
				while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
					sb.append(line);
				}
				
				System.out.println(TAG + sb.toString());
				
				JSONArray obj = (JSONArray) JSONValue.parse(sb.toString()); // json으로 변경 (역직렬화)
				
				script.print(obj);
				script.flush();
            }
            
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}
		
		script.print(new JSONObject());
		script.flush();
	} 
}
