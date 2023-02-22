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
import api.model.ReservationDAO;
import api.model.TotalDAO;

@WebServlet("/reservation-basic-info")
public class ReservationBasicInfo extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		String shopbaskets = request.getParameter("shopbaskets");
		
		System.out.println("shopbaskets: "+shopbaskets);
		
		if (user != null) {
			ReservationDAO reservationDAO = new ReservationDAO();
			JSONObject object = reservationDAO.searchReservationBasicInfo(user, shopbaskets);
			returnObject("Success", "200", object);
		} else {
			returnResult("Fail", "500");
		}
	}
}
