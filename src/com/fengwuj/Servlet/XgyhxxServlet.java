package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.Dao.Dao;
import com.fengwuj.entity.User;
import com.fengwuj.factory.Factory;

public class XgyhxxServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		String xm = req.getParameter("xm");
		String dw = req.getParameter("dw");
		String bm = req.getParameter("bm");
		String dh = req.getParameter("dh");
		Dao dao = Factory.createMysqlDao();
		User user = dao.selectUser(username);
		user.setBm(bm);
		user.setXm(xm);
		user.setDw(dw);
		user.setDh(dh);
		int i = dao.updateUser(user);
		PrintWriter printWriter = resp.getWriter();
		if (i > 0) {
			printWriter.print("success");
		}else {
			printWriter.print("fail");
		}
		
	}

}
