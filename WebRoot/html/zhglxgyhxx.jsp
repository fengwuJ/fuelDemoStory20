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
	String username = request.getParameter("username");
	String password = request.getParameter("password");
%>
	<style>
		/* 信息修改 */
		.xxxg {
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
			margin-left:310px;
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
		/* 设置上层布局 */
		.top {
			width:1200px;
			height:200px;
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
			<div class = "xxxg">信息修改</div>
			<div class = "line"></div>
			<form id="form">
				<div class = "bg">		
					<p>账号：<input class = "wbk" name="username" value = "<%=username %>" type="text" readonly = "readonly" />
					<p>密码：<input class = "wbk" name="password" value = "<%=password %>" type="text" readonly = "readonly"/>
					<p>姓名：<input class = "wbk" name="xm" value = "" type="text" id="xm"/>
					<p>单位：<input class = "wbk" name="dw" value = "" type="text" id="dw"/>
					<p>部门：<input class = "wbk" name="bm" value = "" type="text" id="bm"/>
					<p>电话：<input class = "wbk" name="dh" value = "" type="text" id="dh"/>
				</div>
				<div class = "bg1">
					<button class = "an" type = "button" value = "保存" id="save">保存</button>
					<button class = "an" type = "button" value = "返回" onclick="window.location.href='zhglyhgl.jsp'">返回</button>
				</div>
			</form>
		</div>		
		</div>>
	</div>

	<script type="text/javascript">
		$(function(){
			$("#save").click(function(){
				var data = $("#form").serialize();
				var x1 = $("#xm").val();
				var x2 = $("#dw").val();
				var x3 = $("#bm").val();
				var x4 = $("#dh").val();
				var x5 = $(".select1").val();
				var re = /^[1][3,4,5,7,8][0-9]{9}$/;
				//校验手机号码
				if (!re.test(x4)) {
					alert("手机号格式错误");
					return false;
				}
	
				if (x1.length == 0 || x2.length == 0 || x3.length == 0 || x4.length == 0 || x5 == "请选择") {
					alert("请填写完整信息");
					return false;
				}
				$.ajax({
					dataType:'text',
					type:'post',
	           	 	url: "../zhglxgyhxx",
	            	data:data,
	            	success: function(result){
	              		if(result == "success"){
	              			alert("修改成功");
	              			window.location.href="zhglyhgl.jsp";
	              		}else{
	              			alert("修改失败");
	              		}
	           	 	},
	            	error:function(){ 
	     				alert("数据请求失败");
	    			}
				});
			});
		});
	</script>
</body>
</html>