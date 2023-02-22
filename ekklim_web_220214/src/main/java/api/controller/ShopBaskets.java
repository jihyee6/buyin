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
import api.model.ShopBasketsDAO;
import api.model.TotalDAO;

@WebServlet("/shopbaskets")
public class ShopBaskets extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		if (method.equals("GET")) {			
			ShopBasketsDAO shopBasketDAO = new ShopBasketsDAO();
			JSONObject object = shopBasketDAO.searchShopBaskets(user);
			
			returnObject("Success", "200", object);
		
		} else if (method.equals("POST")) {
			String bodyString = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			JSONObject bodyJson = (JSONObject) JSONValue.parse(bodyString);
			
			ShopBasketsDAO shopBasketDAO = new ShopBasketsDAO();
		
			String room = bodyJson.get("room").toString();
			String lodgeType = bodyJson.get("lodgeType").toString();
			String roomPrice = bodyJson.get("roomPrice").toString();
			String checkInDate = bodyJson.get("checkInDate").toString();
			String checkOutDate = bodyJson.get("checkOutDate").toString();
			String justReserve = bodyJson.get("justReserve").toString();
			
			if(justReserve.equals("false")) {
				String checkResult = shopBasketDAO.checkShopBasket(room, user, lodgeType, checkInDate, checkOutDate);
				
				if(!checkResult.equals("Success")) {
					returnResult(checkResult, "500");
					return;
				}
			}
			
			String weekdayGiftCount = bodyJson.get("weekdayGiftCount").toString();
			String weekdayGiftPrice = bodyJson.get("weekdayGiftPrice").toString();
			String weekendGiftCount = bodyJson.get("weekendGiftCount").toString();
			String weekendGiftPrice = bodyJson.get("weekendGiftPrice").toString();
			String roomOptions = bodyJson.get("roomOptions").toString();
			String amenities = bodyJson.get("amenities").toString();
			String totalPrice = bodyJson.get("totalPrice").toString();
			String reservePrice = bodyJson.get("reservePrice").toString();
			
			String addResult = shopBasketDAO.addShopBasket(room, user, lodgeType, roomPrice, checkInDate, checkOutDate, 
					weekdayGiftCount, weekdayGiftPrice, weekendGiftCount, weekendGiftPrice, roomOptions, amenities, totalPrice, reservePrice, justReserve);
			
			if(addResult.equals("Success")) {
				returnResult(addResult, "200");
			} else {
				returnResult(addResult, "500");
			}
		} else if (method.equals("PUT")) {
			String shopbasketID = request.getParameter("shopbasket");
			
			String bodyString = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			JSONObject bodyJson = (JSONObject) JSONValue.parse(bodyString);
			
			ShopBasketsDAO shopBasketDAO = new ShopBasketsDAO();
			
			String weekdayGiftCount = bodyJson.get("weekdayGiftCount").toString();
			String weekendGiftCount = bodyJson.get("weekendGiftCount").toString();
			String roomOptions = bodyJson.get("roomOptions").toString();
			String amenities = bodyJson.get("amenities").toString();
			String totalPrice = bodyJson.get("totalPrice").toString();
			String reservePrice = bodyJson.get("reservePrice").toString();
			
			shopBasketDAO.updateShopBasket(shopbasketID, weekdayGiftCount, weekendGiftCount, roomOptions, amenities, totalPrice, reservePrice);
			
			returnResult("Success", "200");
		} else if (method.equals("DELETE")) {
			String shopbasketID = request.getParameter("shopbasket");
			
			ShopBasketsDAO shopBasketDAO = new ShopBasketsDAO();
			
			shopBasketDAO.deleteShopBasket(shopbasketID);
			
			returnResult("Success", "200");
		}
	}
}
