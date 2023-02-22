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

@WebServlet("/gift-send-detail")
public class GiftSendDetail extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String gift = request.getParameter("gift");
		String giftType = request.getParameter("type");
		
		GiftDAO giftDAO = new GiftDAO();
		JSONObject object = giftDAO.searchGiftSendDetail(user, gift, giftType);
		
		returnObject("Success", "200", object);
	}
}
