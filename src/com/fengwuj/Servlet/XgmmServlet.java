package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fengwuj.util.DBConnection;
import com.mysql.cj.Session;

public class XgmmServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String sql = "update user set password = ? where username = ?";
		Connection connection = null;
		PreparedStatement psmt = null;
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		try {
			connection = DBConnection.getConnection();
			psmt = connection.prepareStatement(sql);
			psmt.setString(1,password);
			psmt.setString(2, username);
			int i = psmt.executeUpdate();
			if (i >= 0) {
				req.getSession().invalidate();
				printWriter.print("<script type='text/javascript'>alert('修改成功，请重新登录');window.location.href='html/index.html';</script>");
			}else {
				printWriter.print("<script type='text/javascript'>alert('密码修改失败');</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
