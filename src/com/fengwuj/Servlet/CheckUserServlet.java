package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.util.DBConnection;

public class CheckUserServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String sql = "select username from user where username = ?";
		resp.setCharacterEncoding("utf-8");
		Connection connection;
		PrintWriter printWriter = resp.getWriter();
		try {
			connection = DBConnection.getConnection();
			PreparedStatement psmt = connection.prepareStatement(sql);
			psmt.setString(1, username);
			ResultSet rs = psmt.executeQuery();
			
			if (rs.next()) {
				printWriter.print("用户名已存在");
			}else {
				printWriter.print("可以使用该用户名");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
