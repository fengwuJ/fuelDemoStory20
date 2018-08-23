package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter printWriter = resp.getWriter();
		
		HttpSession session = req.getSession(false);
		if (session == null) {
			printWriter.print("ok");
			return;
		}else {
			session.invalidate();
			printWriter.print("ok");
			return;
		}
		
	}
}
