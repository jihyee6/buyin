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
import api.model.OptionsDAO;
import api.model.ReservationDAO;
import api.model.TotalDAO;

@WebServlet("/options")
public class Options extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		String room = request.getParameter("room");
		String checkInDate = request.getParameter("checkin");
		String checkOutDate = request.getParameter("checkout");
		
		OptionsDAO optionDAO = new OptionsDAO();
		JSONObject object = optionDAO.searchOptions(user, room, checkInDate, checkOutDate);
		
		returnObject("Success", "200", object);
	}
}