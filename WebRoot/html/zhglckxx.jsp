<%@page import="java.awt.Window"%>
<%@page import="com.fengwuj.entity.User"%>
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

<%
	User user = (User)request.getAttribute("user");
	if(user == null){
		user = new User();
	}
%>


<style>
		/* 个人信息 */
		.gexx {
			font-size: 26px;
			width: 200px;
			font-family: 宋体;
			color: #FFFAFA;
			background-color: #87CEFA;
			margin-bottom: 10px;
			text-align: center;
			margin-top: 20px;
		}
		/* 下划线 */
		.line {
			height: 1px;
			border: none;
			border-top: 5px solid #87CEFA;
			margin-left:60px;
			margin-top: -15px;
		}
		/* 表格 */
		.bg {
			margin-left:300px;
			margin-top:50px;
		}
		/* 表格1 */
		.bg1 {
			margin-left:330px;
			margin-top:30px;
		}
		/* 文本框 */
		.wbk {
			border:none;
			width:140px;
			background-color:#FFF8DC;
		}
		/* 按钮 */
		.an {
			background-color:#FFF8DC;
			margin-left:30px;
		}
		/* 设置总体布局 */
		.frame {
			margin:0 auto;
			width:1200px;
			background-image:linear-gradient(#FFF0F5,#FFFFF0);
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
	</style>

</head>
<body>

<div class = "frame">
		<div class = "top">
			<jsp:include page="top.html" flush="true"/>
		</div>
		
		<div class = "bottom">
			<jsp:include page="left.html" flush="true"/>
			<div class = "right">
			<div class = "gexx">查看用户信息</div>
			<div class = "line"></div>
			<form method = "post" >
				<div class = "bg">		
					<p>姓名：<input class = "wbk" name="xm" type="text" value="<%=user.getXm() %>" readonly="readonly"/>
					<p>账号：<input class = "wbk" name="zh" type="text" value="<%=user.getUsername() %>" readonly="readonly"/>
					<p>角色：<input class = "wbk" name="js" type="text" value="<%=user.getJs() %>" readonly="readonly"/>
					<p>电话：<input class = "wbk" name="dh" type="text" value="<%=user.getDh() %>" readonly="readonly"/>
					<p>单位：<input class = "wbk" name="dw" type="text" value="<%=user.getDw() %>" readonly="readonly"/>
					<p>部门：<input class = "wbk" name="bm" type="text" value="<%=user.getBm() %>" readonly="readonly"/>
				</div>
				<div class = "bg1">
					<button class = "an" type = "button" value = "返回" onclick="window.location='html/zhglyhgl.jsp'">返回</button>
				</div>
			</form>
		</div>		
		</div>>
	</div>

</body>
</html>