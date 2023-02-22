package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginStateCheckCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		String id = (String) session.getAttribute("id");
		
		if (id == null) {
			script.write("loginFalse");
		} else {
			script.write("loginTrue");
		}
		
	}

}
