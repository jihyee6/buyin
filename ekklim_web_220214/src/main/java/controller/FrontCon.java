package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String reqURI = request.getRequestURI();
		String path = request.getContextPath();
		String resultURI = reqURI.substring(path.length() + 1);

		Command inter = null;

		if (resultURI.equals("LoginCon.do")) {
			inter = new LoginCon();
		} else if(resultURI.equals("LoginStateCheckCon.do")) {
			inter = new LoginStateCheckCon();
		} else if(resultURI.equals("CashCon.do")) {
			inter = new CashCon();
		} else if(resultURI.equals("LogoutCon.do")) {
			inter = new LogoutCon();
		} else if(resultURI.equals("PaymentInfomationCon.do")) {
			inter = new PaymentInfomationCon();
		} else if(resultURI.equals("PwCheckCon.do")) {
			inter = new PwCheckCon();
		} else if(resultURI.equals("PwReCon.do")) {
			inter = new PwReCon();
		}
			inter.command(request, response);
		
	}

}
