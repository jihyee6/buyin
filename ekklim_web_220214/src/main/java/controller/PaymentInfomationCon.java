package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PaymentInfomationCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String OID = request.getParameter("OID");
		String payment_state = request.getParameter("payment_state");
		String payment_message = request.getParameter("payment_message");
		String payTotalCharge = request.getParameter("payTotalCharge");
		String TID = request.getParameter("TID");
		
		System.out.println(OID);
		System.out.println(payment_state);
		System.out.println(payment_message);
		System.out.println(payTotalCharge);
		System.out.println(TID);
		
		session.setAttribute("OID", OID);
		session.setAttribute("payment_state", payment_state);
		session.setAttribute("payment_message", payment_message);
		session.setAttribute("payTotalCharge", payTotalCharge);
		session.setAttribute("TID", TID);
		
		script.print("Success");
		script.flush();
		
	}

}
