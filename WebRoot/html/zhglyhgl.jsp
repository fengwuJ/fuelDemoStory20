<%@page import="java.awt.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fengwuj.entity.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.fengwuj.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../frame/jquery.min.js"></script>
<script type="text/javascript" src="../frame/checksession.js"></script>

<script type="text/javascript">
	getsession();
</script>

<style>
	/* 设置总体布局 */
	.frame {
		margin:0 auto;
		width:1200px;
		}

	
	/* 设置下层布局 */
	.bottom {
		width:1200px;
		height:600px;
	}
	/* 设置下层右侧布局 */
	.right {
		float:left;
		width:960px;
		height:600px;
	}	
	/* 信息修改 */
	.xxxg {
		font-size:30px;
		width:200px;
		font-family:宋体;
		color:#FFFAFA;
		background-color:#87CEFA;
		margin-bottom:10px;
		text-align:center;
		margin-top:20px;
	}
	.line {
		height:1px;
		border:none;
		border-top:5px solid #87CEFA;
		margin-top:-10px;
	}
	.table {
		border-collapse: collapse;
		text-align:center;
		margin-top:10px;
		margin-left:5px;
	}
	.table tr td {
		border:1px solid #0094ff;
	}
	.input {
		text-align:center;
		border:none;
		width:135px;
	}
</style>

<%
	ArrayList<User> list = new ArrayList();
	if(session.getAttribute("user") != null){
		Connection connection = DBConnection.getConnection();
		String sql = "select * from user";
		PreparedStatement psmt = connection.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		while(rs.next()){
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setXm(rs.getString("xm"));
			user.setDw(rs.getString("dw"));
			user.setBm(rs.getString("bm"));
			user.setDh(rs.getString("dh"));
			user.setJs(rs.getString("js"));
			list.add(user);
		}
		
		
	}
	
%>


</head>
<body>
	<div class = "frame">
			<jsp:include page="top.html" flush="true"/>
			<div class = "bottom">
				<jsp:include page="left.html" flush="true"/>
				<div class = "right">
					<div class = "xxxg">信息修改</div>
					<div class = "line"></div>
					<div> <button style="margin-left: 830px;margin-top: -40px;border-radius: 10px;background:#9AC0CD;" id="adduser" onclick="addUser()">添加新用户</button></div>
					
					<div>
						<table class = "table">
							<tr>
								<td>序号</td>
								<td>姓名</td>
								<td>用户名</td>
								<td>单位</td>
								<td>部门</td>
								<td>角色</td>
								<td>操作</td>						
							</tr>
							
							<%
								for(int i = 0; i < list.size(); i++){
									User user = list.get(i);
									if("管理人员".equals(user.getJs())){%>
										<tr>
											<td><input class = "input" name="" type="text" value="<%=i+1 %>" readonly="readonly"></input></td>
											<td><input class = "input" name="xm" type="text" value="<%=user.getXm() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="username" type="text" value="<%=user.getUsername() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="dw" type="text" value="<%=user.getDw() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="bm" type="text" value="<%=user.getBm() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="js" type="text" value="<%=user.getJs() %>" readonly="readonly"></input></td>
											<td><a href = "../zhglckxx?username=<%=user.getUsername() %>">查看</a></td>						
										</tr>
									<%}else{%>
										<tr>
											<td><input class = "input" name="" type="text" value="<%=i+1 %>" readonly="readonly"></input></td>
											<td><input class = "input" name="xm" type="text" value="<%=user.getXm() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="username" type="text" value="<%=user.getUsername() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="dw" type="text" value="<%=user.getDw() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="bm" type="text" value="<%=user.getBm() %>" readonly="readonly"></input></td>
											<td><input class = "input" name="js" type="text" value="<%=user.getJs() %>" readonly="readonly"></input></td>
											<td><a href = "zhglxgyhxx.jsp?username=<%=user.getUsername()%>&password=<%=user.getPassword()%>">修改&nbsp;</a><a href = "../zhgldeleteUser?username=<%=user.getUsername() %>" onclick="return confirm('是否删除本条记录？')">删除&nbsp;</a><a href = "zhglxgyhmm.jsp?username=<%=user.getUsername()%>&xm=<%=user.getXm() %>&oldpassword=<%=user.getPassword()%>">密码</a></td>						
										</tr>
									<%}
								}
							%>
						</table>
					</div>
				</div>						
			</div>
		</div>
</body>

<script type="text/javascript">
	function addUser(){
		window.location.href="zhgltjyh.jsp";
	}
</script>

</html>