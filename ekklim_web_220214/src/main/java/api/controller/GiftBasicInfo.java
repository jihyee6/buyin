package api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

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
import api.model.TotalDAO;

@WebServlet("/gift-basic-info")
public class GiftBasicInfo extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		String isGiftCard = request.getParameter("isGiftcard");
		
		if (isGiftCard.equals("true")) {
			String giftcardID = request.getParameter("giftcard");
			GiftDAO giftDAO = new GiftDAO();
			JSONObject object = giftDAO.searchGiftcardBasicInfo(user, giftcardID);
			
			returnObject("Success", "200", object);
		} else {
			String room = request.getParameter("room");
			String isWeekend = request.getParameter("isWeekend");
			
			GiftDAO giftDAO = new GiftDAO();
			JSONObject object = giftDAO.searchGiftRoomBasicInfo(user, room, Boolean.parseBoolean(isWeekend));
			
			returnObject("Success", "200", object);
		}
	}
}
