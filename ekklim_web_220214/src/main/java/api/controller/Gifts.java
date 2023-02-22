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

import api.model.GiftDAO;
import api.model.GiftcardsDAO;
import api.model.LodgementsDAO;
import api.model.ReservationDAO;
import api.model.TotalDAO;

@WebServlet("/gifts")
public class Gifts extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		if (method.equals("GET")) {
			GiftDAO giftDAO = new GiftDAO();
			JSONObject object = giftDAO.searchGifts(user);
			System.out.println(object);
			returnObject("Success", "200", object);
		} else if (method.equals("POST")) {
			String bodyString = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			JSONObject bodyJson = (JSONObject) JSONValue.parse(bodyString);
			
			GiftDAO giftDAO = new GiftDAO();
		
			String giftTypeID = bodyJson.get("giftTypeID").toString();
			String isGiftcard = bodyJson.get("isGiftcard").toString();
			String isWeekend = bodyJson.get("isWeekend") == null ? null : bodyJson.get("isWeekend").toString();
			String senderInfo = bodyJson.get("senderInfo").toString();
			String receiverInfo = bodyJson.get("receiverInfo").toString();
			String paymentMethod = bodyJson.get("paymentMethod").toString();
			String paymentCharge = bodyJson.get("paymentCharge").toString();
			
			if(isGiftcard.equals("true")) {
				String addResult = giftDAO.addGiftcard(user, giftTypeID, senderInfo, receiverInfo, paymentMethod, paymentCharge);
				
				if(addResult == null) {
					returnResult("Fail", "500");
				} else {
					JSONObject returnJSON = new JSONObject();
					
					returnJSON.put("message", "Success");
					returnJSON.put("code", "200");
					returnJSON.put("OID", addResult);
					
					script.print(returnJSON);
					script.flush();
				}
			} else if(isGiftcard.equals("false")) {
				String addResult = giftDAO.addGiftRoom(user, giftTypeID, isWeekend, senderInfo, receiverInfo, paymentMethod, paymentCharge);
				
				if(addResult == null) {
					returnResult("Fail", "500");
				} else {
					JSONObject returnJSON = new JSONObject();
					
					returnJSON.put("message", "Success");
					returnJSON.put("code", "200");
					returnJSON.put("OID", addResult);
					
					script.print(returnJSON);
					script.flush();
				}
			} else {
				returnResult("Fail", "500");
			}
			
		}
	} 
}
