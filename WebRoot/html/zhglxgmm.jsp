<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.fengwuj.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.fengwuj.entity.User"%>



<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<script type="text/javascript" src="../frame/jquery.min.js"></script>
<title>My JSP 'zhglxgmm.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<style type="text/css">
/* 设置总体布局 */
div#frame {
	margin: 0 auto;
	width: 1200px;
}

/* 设置下层布局 */
div#bottom {
	width: 1200px;
	height: 600px;
}


/* 设置下层右侧布局 */
div#right {
	float: left;
	width: 960px;
	height: 600px;
}

/* 设置按钮特效 */
.button2 {
	padding: 0px;
	text-align: center;
	float: left;
	width: 80px;
	background-image: linear-gradient(#F0F8FF, #F0F8FF);
	border: 1px solid rgba(0, 0, 0, 0);
	border-radius: 0px;
	box-shadow: 0 1px white inset;
	text-shadow: 0 0px 0px black;
	color: black;
	font-weight: bold;
	margin-right: 20px;
	font-family: 宋体;
}

.di {
	font-size: 26px;
	width: 200px;
	font-family: 宋体;
	color: #FFFAFA;
	background-color: #87CEFA;
	margin-bottom: 10px;
	text-align: center;
	margin-top: 20px;
}

hr {
	height: 1px;
	border: none;
	border-top: 5px solid #87CEFA;
}


/* 设置居中 */
div#juzhong {
	padding-left: 300px;
	margin-top: 80px;
}

/* 设置保存与返回按钮的位置 */
div#baocun {
	padding-left: 330px;
	margin-top: 50px;
}

.noborder{
	border: none;
	text-align: center;
}

</style>

<script type="text/javascript">
	var mySession = <%=session.getAttribute("user")%>;
	if(mySession == null){
		alert("您还未登录，请先进行登录！");
		window.location.href = "index.html";
	}
</script>


<%
	User user = (User)session.getAttribute("user");
	String sql = "select * from user where username = ?";
	Connection connection = DBConnection.getConnection();
	PreparedStatement psmt = connection.prepareStatement(sql);
	
	if(user == null){
		psmt.setString(1, "root");
		user = new User();
	}else{
		psmt.setString(1, user.getUsername());
	}
	
	ResultSet rs = psmt.executeQuery();
	if(rs.next()){
		user.setId(rs.getInt("id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setXm(rs.getString("xm"));
		user.setDw(rs.getString("dw"));
		user.setBm(rs.getString("bm"));
		user.setDh(rs.getString("dh"));
		user.setJs(rs.getString("js"));
	}
	
%>

</head>

<body>
	<div id="frame">
	<jsp:include   page="top.html" flush="true"/>
		<div id="bottom">
		<jsp:include   page="left.html" flush="true"/>
			<div id="right">
				<div class="di ">信息修改</div>
					<div style="margin-top:-15px;">
						<hr/>
					</div>
					<div>
						<form action="../xgmm" id="myform" method="post">
							<div id="juzhong">
								<p>
									单&nbsp;&nbsp;&nbsp;位：<input class="noborder" name="dw"
										type="text" value="<%=user.getDw() %>" readonly="readonly"></input>
								</p>
								<p>
									部&nbsp;&nbsp;&nbsp;门：<input name="bm"  class="noborder"
										type="text" value="<%=user.getBm() %>" readonly="readonly"></input>
								</p>
								<p>
									姓&nbsp;&nbsp;&nbsp;名：<input name="xm"  class="noborder"
										type="text" value="<%=user.getXm() %>" readonly="readonly"></input>
								</p>
								<p>
									用户名：<input  class="noborder" name="username" type="text" value="<%=user.getUsername() %>"
										readonly="readonly"></input>
								</p>
								<p>
									新密码：<input name="password" type="text" placeholder="请输入新密码,长度至少为6位" id="newpasswd"></input>
								</p>
							</div>
							<div id="baocun">
								<button class="button2" id="qrxg">修改</button>
							</div>
						</form>
					</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		//alert(document.getElementById("yhmm").value);
		//alert($("#yhmm").val());
		$(function(){		
			$("#qrxg").click(function(){
				var flag = true;
				var passwd = $("#newpasswd").val();
				if(passwd.length == 0){
					flag = false;
					$("#newpasswd").val("");
					alert("请填写密码");
				}
				if(passwd.length < 6){
					flag = false;
					alert("密码长度至少为6位");
				}
				for(i = 0; i < passwd.length; i++) {
					if(passwd.charCodeAt(i) > 128){
						flag = false;
						alert("不支持中文密码");
						$("#passwd").val("");
						break;
					}
				}
				return flag;
			});
		});
	</script>
</body>
</html>
