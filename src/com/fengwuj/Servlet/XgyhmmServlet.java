package com.fengwuj.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fengwuj.Dao.Dao;
import com.fengwuj.factory.Factory;

public class XgyhmmServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = resp.getWriter();
		
		String username = req.getParameter("username");
		String newpassword = req.getParameter("xmm");
		
		Dao dao = Factory.createMysqlDao();
		int i = dao.updateUserPassword(username, newpassword);
		
		if(i > 0){
			printWriter.print("<script type='text/javascript'>alert('修改成功');window.location.href='html/zhglyhgl.jsp';</script>");
		}else {
			printWriter.print("<script type='text/javascript'>alert('密码修改失败');</script>");
		}
		
	}
}
