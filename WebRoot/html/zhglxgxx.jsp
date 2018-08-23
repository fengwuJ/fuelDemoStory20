<%@page import="com.fengwuj.entity.User"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.fengwuj.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/zhglxgxx.css">
<script type="text/javascript" src="../frame/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		<div id = "frame">
		<!--
			<div id = "top">
				
				<div id = "img">					
					<img src="../images/icon.png"/>					
				</div>
				
				<div id = "title">
					<h1>分 公 司 业 务 管 理 中 心 </h1>
				</div>
				
				<div id = "navigation">	
					<div id = "navigation1">
						<button>首页中心</button>
						<button  class = "class">交易中心</button>
						<button class = "class">咨询中心</button>
						<button class = "class">服务中心</button>
					</div>
				</div>
				
			</div>
			-->
			<jsp:include   page="top.html" flush="true"/>
			<div id = "bottom">
			<jsp:include   page="left.html" flush="true"/>
				<!--
				<div id = "left">
					<div id = "navigation2">
						<button class = "button1">事务中心</button>
						<button class = "button1">采购申请管理</button>
						<button class = "button1">采购执行管理</button>
						<button class = "button1">供应商管理</button>
						<button class = "button1">账号管理</button>
					</div>
				</div>
				-->
				<div id = "right">
					<div class = "di ">信息修改</div>
					<div style="margin-top:-15px;"><hr/></div>
					<div>
						<form action="" id="form" method="post">
							<div id = "juzhong">
								<p>用户名：<input class = "input2 input" name="username" type="text" value="<%=user.getUsername()%>" readonly="readonly"></input></p>
								<p>密&nbsp;&nbsp;&nbsp;码：<input class = "input2 input" name="password" type="text" value="<%=user.getPassword() %>" readonly="readonly"></input></p>
								<p>姓&nbsp;&nbsp;&nbsp;名：<input class = "input2 input" id="xm" name="xm" type="text" value="<%=user.getXm() %>"></input></p>
								<p>单&nbsp;&nbsp;&nbsp;位：<input class = "input2 input" id="dw" name="dw" type="text" value="<%=user.getDw() %>"></input></p>
								<p>部&nbsp;&nbsp;&nbsp;门：<input class = "input2 input" id="bm" name="bm" type="text" value="<%=user.getBm() %>"></input></p>
								<p>电&nbsp;&nbsp;&nbsp;话：<input class = "input2 input" id="dh" name="dh" type="text" value="<%=user.getDh() %>"></input></p>
								<!-- <p>角&nbsp;&nbsp;&nbsp;色：<input class = "input2 input" name="" type="checkbox" value="1" name="sProblem"></input></p> -->
								<p>角&nbsp;&nbsp;&nbsp;色&nbsp;:
								<select class = "select1" name="js">
									<option value="请选择"  selected="selected">请选择</option>
									<option value="管理人员">管理人员</option>
									<option value="普通人员">普通人员</option>
					                                                   </select>
							</div>
							<div id = "baocun">
								<button id="save" class = "button2" type="button">保存</button>
							</div>
						</form>
					</div>
				</div>		
			</div>	
		</div>
		
		<script type="text/javascript">
			
			$(function(){
				$("#save").click(function(){
					var x1 = $("#xm").val();
					var x2 = $("#dw").val();
					var x3 = $("#bm").val();
					var x4 = $("#dh").val();
					var x5 = $(".select1").val();
					var re = /^[1][3,4,5,7,8][0-9]{9}$/;
					//校验手机号码
					if(!(re.test(x4))){
						alert("手机号格式错误");
						return false;
					}
					
					if(x1.length == 0 || x2.length == 0 || x3.length == 0 || x4.length == 0 || x5 == "请选择"){
						alert("请填写完整信息");
						return false;
					}else{
						var data = $("form").serialize();		
						$.ajax({
							dataType:'text',
							type:'post',
			           	 	url: "../xgxx",
			            	data:data,
			            	success: function(result){
			              		if(result == "success"){
			              			alert("信息修改成功");
			              			$(window).attr('location','main.jsp');
			              		}else{
			              			alert("信息修改失败");
			              		}
			           	 	},
			            	error:function(){ 
			     				alert("数据请求失败");
			    			}
						});
					};
				});
			});
		</script>
	</body>

</html>
