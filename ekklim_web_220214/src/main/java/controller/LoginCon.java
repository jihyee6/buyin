package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if (id.length() == 0) {
			script.write("loginId");
//			System.out.println("idnull");
		} else if (pw.length() == 0) {
			script.write("loginPw");
//			System.out.println("pwnull");
		} else if (id.equals("inipay") && pw.equals("inipay00!")) {
			script.write("inipay");
			session.setAttribute("id", id);
		} else if (id.equals("buyinhotel") && pw.equals("buyinhotel00!")) {
			script.write("login");
//			session.setAttribute("id", "AppIDEtest");
			session.setAttribute("id", "AppIDE00807557670");
		}  else {
			script.write("loginFailed");
		}
		
	}

}
