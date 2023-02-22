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

import api.model.LodgementsDAO;
import api.model.TotalDAO;

public class CommonAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrintWriter script;
	String method;
	String user;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		script = response.getWriter();
		method = request.getMethod();
		
		user = request.getHeader("user");
	}
	
	protected void returnArray(String message, String code, JSONArray data) {
		JSONObject returnJSON = new JSONObject();
		
		returnJSON.put("message", message);
		returnJSON.put("code", code);
		returnJSON.put("data", data);
		
		script.print(returnJSON);
		script.flush();
	}
	
	protected void returnObject(String message, String code, JSONObject data) {
		JSONObject returnJSON = new JSONObject();
		
		returnJSON.put("message", message);
		returnJSON.put("code", code);
		returnJSON.put("data", data);
		
		script.print(returnJSON);
		script.flush();
	}
	
	protected void returnResult(String message, String code) {
		JSONObject returnJSON = new JSONObject();
		
		returnJSON.put("message", message);
		returnJSON.put("code", code);
		
		script.print(returnJSON);
		script.flush();
	}

}
