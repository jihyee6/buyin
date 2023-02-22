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

import api.model.CommonInfoDAO;
import api.model.GiftcardsDAO;
import api.model.LodgementsDAO;
import api.model.TotalDAO;

@WebServlet("/common-info")
public class CommonInfo extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		CommonInfoDAO commonInfoDAO = new CommonInfoDAO();
		JSONObject info = commonInfoDAO.searchCommonInfo(user);
		
		returnObject("Success", "200", info);
	}
}
