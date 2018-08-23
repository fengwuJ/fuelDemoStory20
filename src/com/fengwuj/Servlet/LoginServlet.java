package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fengwuj.Dao.Dao;
import com.fengwuj.entity.User;
import com.fengwuj.factory.Factory;

public class LoginServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		Dao dao = Factory.createMysqlDao();
		User user = dao.selectUser(username);
		PrintWriter printWriter = resp.getWriter();
		if (username.equals(user.getUsername()) && password.equals(user.getPassword()) && "管理人员".equals(user.getJs())) {
			HttpSession session = req.getSession();
			session.setAttribute("user",user);
			printWriter.print("success");
		}else {
			printWriter.print("fail");
		}
		printWriter.flush();
		printWriter.close();
	}
}
