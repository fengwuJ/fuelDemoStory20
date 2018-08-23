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

public class DeleteUserServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String username = req.getParameter("username");
		Dao dao = Factory.createMysqlDao();
		int i = dao.deleteUser(username);
		PrintWriter printWriter = resp.getWriter();
		
		if (i > 0) {
			printWriter.print("<script type='text/javascript'>alert('用户删除成功');window.location.href='html/zhglyhgl.jsp';</script>");
			
		}else{
			printWriter.print("<script type='text/javascript'>alert('删除失败');</script>");
			
		}
		
	}

}
