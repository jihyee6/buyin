package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PwReCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String passwd = request.getParameter("pw");
		String rewrite_passwd = request.getParameter("pwRe");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		PwCheck model = new PwCheck();
		
		String regexPwReCheck = model.rePw(passwd, rewrite_passwd);
		Boolean regexPwReCheckBoolean = model.rePwSession(passwd, rewrite_passwd);

		out.write(regexPwReCheck);
		session.setAttribute("PwReCheck", regexPwReCheckBoolean);
		
	}

}