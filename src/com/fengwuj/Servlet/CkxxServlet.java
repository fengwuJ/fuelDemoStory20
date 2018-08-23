package com.fengwuj.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.Dao.Dao;
import com.fengwuj.entity.User;
import com.fengwuj.factory.Factory;

public class CkxxServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		Dao dao = Factory.createMysqlDao();
		User user = dao.selectUser(username);
		req.setAttribute("user", user);
		req.getRequestDispatcher("html/zhglckxx.jsp").forward(req, resp);
	}

}
