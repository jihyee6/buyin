package api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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

import api.model.LodgementsDAO;
import api.model.ReservationDAO;
import api.model.ShopBasketsDAO;
import api.model.TotalDAO;

@WebServlet("/reservations")
public class Reservations extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		if (method.equals("GET")) {			
			ReservationDAO reservationDAO = new ReservationDAO();
			JSONArray info = reservationDAO.searchReservations(user);
			
			returnArray("Success", "200", info);
		
		} else if (method.equals("POST")) {
			String bodyString = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			JSONObject bodyJson = (JSONObject) JSONValue.parse(bodyString);
			
			ReservationDAO reservationDAO = new ReservationDAO();
		
			String shopBaskets = bodyJson.get("shopBaskets") == null ? null : bodyJson.get("shopBaskets").toString();
			String bookerInfo = bodyJson.get("bookerInfo").toString();
			String lodgeUserInfo = bodyJson.get("lodgeUserInfo").toString();
			String coupon = bodyJson.get("coupon") == null ? null : bodyJson.get("coupon").toString();
			String couponCharge = bodyJson.get("couponCharge").toString();
			String pointCharge = bodyJson.get("pointCharge").toString();			
			String giftcard = bodyJson.get("giftcard") == null ? null : bodyJson.get("giftcard").toString();
			String giftcardCharge = bodyJson.get("giftcardCharge").toString();
			String paymentMethod = bodyJson.get("paymentMethod").toString();
			String paymentCharge = bodyJson.get("paymentCharge").toString();
			
			String addResult = reservationDAO.addReservation(user, shopBaskets, bookerInfo, lodgeUserInfo, coupon, couponCharge, pointCharge, 
					giftcard, giftcardCharge, paymentMethod, paymentCharge);
			
			if(addResult == null) {
				returnResult(addResult, "200");
			} else {
				JSONObject returnJSON = new JSONObject();
				
				returnJSON.put("message", "Success");
				returnJSON.put("code", "200");
				returnJSON.put("OID", addResult);
				
				script.print(returnJSON);
				script.flush();
			}
		}
	}
}
