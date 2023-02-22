package api.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import api.model.ImageDAO;

@WebServlet("/lodgement/*")
public class Lodgement extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String lodgement_id = request.getRequestURI().substring(request.getContextPath().length()+request.getServletPath().length()+1);
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		
		Calendar today = Calendar.getInstance();
		int todayYear = today.get(Calendar.YEAR);
		int todayMonth = today.get(Calendar.MONTH) + 1;
		int todayDate = today.get(Calendar.DATE);
		
		String todayString = String.format("%04d.%02d.%02d", todayYear, todayMonth, todayDate);
				
		Calendar tomorrow = Calendar.getInstance();		
		tomorrow.set(todayYear, todayMonth, todayDate + 1);
		String tomorrowString = String.format("%04d.%02d.%02d", tomorrow.get(Calendar.YEAR), tomorrow.get(Calendar.MONTH), tomorrow.get(Calendar.DATE));
		
		//체크인,아웃값이 null 일때 오늘,내일 날짜 입력
		if(checkin == null) {
			
			checkin = todayString;
		}
		
		if(checkout == null) {
			
			checkout = tomorrowString;
		}
		
//		if (method.equals("GET")) {
		if (true) {
			HttpURLConnection conn = null; //api 요청을 위한 연결점 정의
			
			String id = (String) session.getAttribute("id");
			
			try {
				//http://localhost:8081/ekklim_web_220214
				String search_url = "https://www.buyinhotel.co.kr/lodgement/" + lodgement_id;
//				String web_url = "https://www.buyinhotel.co.kr/reserhotel/reservationhotel?hotel=" + lodgement_id + "&checkin="+ checkin + "&checkout=" + checkout; 
				String web_url = "http://ekklim.kr/reserhotel/reservationhotel?hotel=" + lodgement_id + "&checkin="+ checkin + "&checkout=" + checkout; 
//				String web_url = "http://localhost:8081/ekklim_web_220214/reserhotel/reservationhotel?hotel=" + lodgement_id + "&checkin="+ checkin + "&checkout=" + checkout; 
				
				URL url = new URL(web_url); //내가 요청하고 싶은 api 주소 넣기 (같은 프로젝트 안에 있으면 상대주소로 해도 가능 -> 안되면 절대주소로 변경)
				conn = (HttpURLConnection) url.openConnection(); // 위에 정의한 url로 연결함
				
				conn.setRequestMethod("GET"); //ajax method에 해당함
				//conn.setRequestProperty("content-Type", "text"); //내가 보낼 데이터의 형식
				conn.setRequestProperty("Accept", "text/html"); //내가 받아온 데이터 형식
				if(id != null) {
					conn.setRequestProperty("id", id); 
				}
				//conn.setRequestProperty("userid", "adiot4015"); //ajax에서 헤더 설정했던것처럼 미리 정의되어있지 않은 헤더값을 설정하는 것
				conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true
				
				//System.out.println("dd");
				//System.out.print(conn);
				// data 보내기
//				OutputStream os = conn.getOutputStream();
//				byte[] input = data.toString().getBytes("utf-8");
//				os.write(input, 0, input.length);	
				
	            int responseCode = conn.getResponseCode(); //진짜로 api를 요청하는 코드
	            
	            if (responseCode == 200) { //서버에 무언가를 요청했을 시 응답의 형식 <200: 정상, 401:권한없음, 404: 찾을수 없음, 500:서버내부에러>
	            	//조건문을 통해 응답이 정상인 경우, 오류인 경우로 나눠놓음 / 각 응답에 대해 처리하는 방식이 달라져야 한다면 조건 분기문을 늘림
	            	
	            	ImageDAO imageDAO = new ImageDAO();
	    			JSONObject info = imageDAO.searchLodgementImage(lodgement_id);
	    			
//	    			out.print("<html>");
//	    			out.print("<head>");
//	    			out.print("<body>");
//	    			out.print("<h1>hello word<h1>");
//	    			out.print("</body>");
//	    			out.print("</head>");
//	    			out.print("</html>");
	    			
	            	//System.out.println(TAG + "postMission " + responseCode);
					// 서버로부터 데이터 읽어오기 (받아온 응답을 받아들이기 위한 공간을 마련하는 코드 )
	            	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					StringBuilder sb = new StringBuilder();
					String line = null;
							
					out.print(
							"<!DOCTYPE html>\r\n"
	    					+ "<html>\r\n"
	    					+ "<head>\r\n"
	    					+ "<meta charset=\"UTF-8\">\r\n"
	    					+ "<meta property='og:title' content='" + info.get("title") + "'>\r\n"
	    					+ "<meta property='og:image' content='" + info.get("img_url") + "'>\r\n"
	    					+ "<meta property='og:url' content='" + search_url + "'>\r\n"
	    					+ "<meta name=\"keywords\" content=\"" + info.get("title") + "\">\r\n"
	    					+ "<meta property='og:description' content=''>\r\n"
	    					+ "<meta name=\"robots\" content=\"ALL, index, follow\">\r\n");
					
					while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
						sb.append(line + "\r\n"); //줄바꿈
					}
					
					//System.out.println(TAG + sb.toString());
					
					//JSONArray obj = (JSONArray) JSONValue.parse(sb.toString()); // json으로 변경 (역직렬화)
//					System.out.println("access_token= " + obj.get("access_token") + " / expires_in= " + obj.get("expires_in"));
					
					//script.print(obj); //받아온 응답을 뿌려줌
//					System.out.print(sb.toString());					
					out.print(sb.toString());
					//script.flush();
					
					
					
	            } else {
	            	//System.out.println(TAG + "postMission " + responseCode);
					// 서버로부터 데이터 읽어오기
					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
					StringBuilder sb = new StringBuilder();
					String line = null;
					
					while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
						sb.append(line);
					}
					
					//System.out.println(TAG + sb.toString());
					
					//JSONArray obj = (JSONArray) JSONValue.parse(sb.toString()); // json으로 변경 (역직렬화)
					
					//script.print(obj);
					System.out.print(sb.toString());
					out.print(sb.toString());
					//script.flush();
	            }
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.disconnect();
			}
			
		} 
	}
}