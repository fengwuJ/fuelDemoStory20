package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fengwuj.entity.User;
import com.mysql.cj.PingTarget;

public class GetSessionServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession mySession = req.getSession();
		User user = (User) mySession.getAttribute("user");
		PrintWriter printWriter = resp.getWriter();
		if (user == null) {
			printWriter.print("null");
		}else {
			printWriter.print(user.getUsername());
		}
	}

}
