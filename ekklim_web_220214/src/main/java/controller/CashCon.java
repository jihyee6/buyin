package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.inicis.std.util.SignatureUtil;

public class CashCon implements Command{

	// 결제 관련 연산 모델
	JSONObject jsonn = new JSONObject();
	JSONValue jsonv = new JSONValue();
	
	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		// 결제에 필요한 인자는 사용자와 가격
		String user_id = (String) session.getAttribute("id");
		
		if (user_id == null) {
			script.print((JSONObject) JSONValue.parse("{\"result\":\"Fail\"}"));
			script.flush();
			
			return;
		}
		
		String price = request.getParameter("price");
		
		String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)
		String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

		String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)

		
		//###############################################
		// 2.signature 생성
		//###############################################
		Map<String, String> signParam = new HashMap<String, String>();

		signParam.put("oid", oid); 					// 필수
		signParam.put("price", price);				// 필수
		signParam.put("timestamp", timestamp);		// 필수

		// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
		String signature;
		try {
			signature = SignatureUtil.makeSignature(signParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			script.print((JSONObject) JSONValue.parse("{\"message\":\"Fail\"}"));
			script.flush();
			
			return;
		}
		
//		String payMethod = request.getParameter("payMethod");
//		
//		String goodsName = "요금충전" + price;
//		
//		// cashmodel에 있는 사용자 정보 가져오는 함수 이용해야 함
//		String buyerName = (String) session.getAttribute("name");
//		String buyerTel = (String) session.getAttribute("phone");
//		String buyerEmail = (String) session.getAttribute("email");
		
		
//		String ediDate = cashmodel.getyyyyMMddHHmmss();
//		String merchantKey = "EYzu8jGGMfqaDEp76gSckuvnaHHu+bC4opsSN6lHv3b2lurNYkVXrZ7Z1AoqQnXI3eLuaUFyoRNC6FkrzVjceg==";
//		String merchantID = "nicepay00m"; 	
//		String hashString = cashmodel.encrypt(ediDate + merchantID + price + merchantKey);
//		
//		// cashmodel에 있는 결제번호 함수 이용해야 함
//		String moid = cashmodel.moid(user_id, payMethod, ediDate);
//		System.out.println(moid);
		
//		CashDTO cashDTO = new CashDTO(goodsName, price, buyerName, buyerTel, buyerEmail, moid, ediDate, hashString);
		
		System.out.println("{\"message\":\"Success\", \"signature\":" + signature + ", \"oid\":" + oid + ", \"timestamp\":" + timestamp + "}");
		
		script.print((JSONObject) JSONValue.parse("{\"message\":\"Success\", \"signature\":\"" + signature + "\", \"oid\":\"" + oid + "\", \"timestamp\":\"" + timestamp + "\"}"));
		script.flush();
	}
	
	

}
