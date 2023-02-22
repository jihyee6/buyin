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
import api.model.PaymentsDAO;
import api.model.ReservationDAO;
import api.model.ShopBasketsDAO;
import api.model.TotalDAO;

@WebServlet("/payments")
public class Payments extends CommonAPI {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		super.service(request, response);
		
		 if (method.equals("PUT")) {
			String bodyString = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			JSONObject bodyJson = (JSONObject) JSONValue.parse(bodyString);
		
			String OID = bodyJson.get("OID").toString();
			String state = bodyJson.get("payment_state").toString();
			String message = bodyJson.get("payment_message").toString();
			String TID = bodyJson.get("TID") == null ? null : bodyJson.get("TID").toString();
			System.out.println("TID: " + TID);
			
			PaymentsDAO paymentDAO = new PaymentsDAO();
			JSONObject object = paymentDAO.updatePayments(user, OID, state, message, TID);
			
			if(object == null) {
				returnResult("Fail", "500");
			} else {
				object.put("message", "success");
				object.put("code", "200");
				
				script.print(object);
				script.flush();
			}
		}
	}
}
