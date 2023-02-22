package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 

public class PwCheckCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String passwd = request.getParameter("pw");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		PwCheck model = new PwCheck();

		String regexCheck = model.regexPw(passwd);
		Boolean regexCheckBoolean = model.regexPwSession(passwd);
		
		out.write(regexCheck);
		session.setAttribute("PwCheck", regexCheckBoolean);
		
	}

}