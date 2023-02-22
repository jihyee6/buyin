package api.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import api.model.LodgementsDAO;
import api.model.MainPageDAO;

@WebServlet("/mainpage")
public class MainPage extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		MainPageDAO mainpageDAO = new MainPageDAO();
		JSONObject info = mainpageDAO.searchMainPage();
		
		if(info == null) {
			returnObject("Fail", "500", info);
		} else {
			returnObject("Success", "200", info);
		}
	}
}