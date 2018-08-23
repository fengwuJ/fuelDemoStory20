<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../frame/jquery.min.js"></script>
<script type="text/javascript" src="../frame/checksession.js"></script>
<script type="text/javascript">
	getsession();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
	.line {
		margin-top:-10px;
		height: 1px;
		border: none;
		border-top: 5px solid #87CEFA;
	}
	
	.biaoge {
		margin-left:300px;
		margin-top:50px;
	}
	.biaoge1 {
		margin-left:330px;
		margin-top:30px;
	}
	.input {
		margin-left:8px;
		border:none;
		width:172px;
		height:23px;
	}
	.baocun {
		background-color:#FFF8DC;
		margin-left:20px;
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
					<div class = "xxxg">添加用户</div>
					<div class = "line"></div>
					<form method = "get" id="form">
						<div class = "biaoge">	
							<p>单&nbsp;&nbsp;&nbsp;&nbsp;位:
							<select class = "input" name="dw">
								<option value = "津能热电" selected="selected">津能热电</option>
								<option value = "中国国际">中国国际</option>
								<option value = "动力能源">动力能源</option>
							</select>	
							<p>角&nbsp;&nbsp;&nbsp;&nbsp;色:
							<select class = "input" name="js">
								<option value = "普通人员" selected="selected">普通人员</option>
								<option value = "管理人员">管理人员</option>	
							</select>		
							<p>部&nbsp;&nbsp;&nbsp;&nbsp;门：<input name="bm" type="text" value="" id="bm"/>
							<p>账&nbsp;&nbsp;&nbsp;&nbsp;号：<input name="username" type="text" value="" id="username"/>
							<p>密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="password" type="text" value="" id="password"/>
							<p>姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input name="xm" type="text" value="" id="xm"/>
							<p>电&nbsp;&nbsp;&nbsp;&nbsp;话：<input name="dh" type="text" value="" id="dh"/>
						</div>
						<div class = "biaoge1">
							<button id="save" class = "baocun" type = "button" value = "保存">保存</button>
							<button class = "baocun" type = "submit" value = "返回" onclick="javascrtpt:window.location.href='zhglyhgl.jsp'">返回</button>
						</div>
					</form>
				</div>	
			</div>
		</div>
	
	<script type="text/javascript">
			
			$(function(){
				$("#save").click(function(){
					var x1 = $("#bm").val();
					var x2 = $("#username").val();
					var x3 = $("#password").val();
					var x4 = $("#xm").val();
					var x5 = $("dh").val();
					var re = /^1\d{10}$/
					//校验手机号码
					if (!(re.test(x5))) {
						alert("手机号格式错误");
						return false;
					}
					if(x1.length == 0 || x2.length == 0 || x3.length == 0 || x4.length == 0 || x5 == 0){
						alert("请填写完整信息");
					}else{
						var data = $("form").serialize();		
						$.ajax({
							dataType:'text',
							type:'get',
			           	 	url: "../tjyh",
			            	data:data,
			            	success: function(result){
			              		if(result == "success"){
			              			alert("用户添加成功");
			              			$(window).attr('location','zhglyhgl.jsp');
			              		}else{
			              			alert("添加用户失败");
			              		}
			           	 	},
			            	error:function(XMLHttpRequest, textStatus, errorThrown){ 
			            		alert("数据请求失败");
			            		alert(XMLHttpRequest.status);
			    			}
						});
					};
				});
			});
		</script>
		
		<script type="text/javascript">
			$(function(){
				$("#username").blur(function(){
					var uname = $(this).val();
					if(uname.length == 0){
						alert("请输入用户名");
					}else{
						$.ajax({
	                        url:"../checkUser",
	                        type:"get",
	                        data:"username="+uname,
	                        dataType:"text",
	                        success:function(result){
	                            alert(result);
	                        },
	                        error:function(XMLHttpRequest, textStatus, errorThrown){ 
			            		alert("数据请求失败");
			            		alert(XMLHttpRequest.status);
			    			}
                   		 });
					}
				});
			});
		</script>

</body>
</html>