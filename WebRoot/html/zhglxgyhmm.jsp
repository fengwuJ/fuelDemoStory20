<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 修改密码 */
		.xgmm {
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

        .weak {background: red;}
        .medium {background: blue;}
        .strong {background: green;}
        span {
	        display: inline-block;
	        width: 47px;
	        height: 16px;
        }
</style>

<script type="text/javascript" src="../frame/jquery.min.js"></script>
<script type="text/javascript" src="../frame/checksession.js"></script>

<script type="text/javascript">
	getsession();
</script>

<%
	String username = request.getParameter("username");
	String xm = request.getParameter("xm");
	String oldpassword = request.getParameter("oldpassword");
%>

<script type="text/javascript">
        window.onload = function(){
	
            var oInput = document.getElementById('xmm');
            oInput.value = '';
            var spans = document.getElementsByTagName('span');
            
            oInput.onkeyup = function(){
                spans[0].className = spans[1].className = spans[2].className = "default";  // 默认
                var xmm = this.value; // 取值                
            	var level = 0;
    			var type1 = 0;
    			var type2 = 0;
    			var type3 = 0;
    			var type4 = 0;
                for(var i = 0; i < xmm.length; i++){  // 获取种类
                	
                	switch(charType(xmm.charCodeAt(i))){
                    	case 1:
                    		type1 = 1;
                    		break;
                    	case 2:
                    		type2 = 1;
                    		break;
                    	case 3:
                    		type3 = 1;
                    		break;
                    	default:
                    		type4 = 1;
                    		break;
                	}   
                }

    			level = type1 + type2 + type3 + type4;  // 计算种类
    			
    			
    			if(xmm.length > 0){  // 设置颜色
    	        	switch (level) {
    	        	case 0:
    	        		spans[0].className = "weak";
    	                break;
    	            case 1:                       	
    	                spans[0].className = "weak";
    	                break;
    	            case 2:
    	                spans[0].className = "medium";
    	                spans[1].className = "medium";
    	                break;
    	            case 3:
    	                spans[0].className = "strong";
    	                spans[1].className = "strong";
    	                spans[2].className = "strong";
    	                break;
    	            case 4:
    	                spans[0].className = "strong";
    	                spans[1].className = "strong";
    	                spans[2].className = "strong";
    	                break;
    	        	}
            	}
    			
            }
            
        }

        /*
	            定义一个函数，对给定的数分为四类(判断密码类型)，返回等级
				等级		level
	            数字		type1                       
	            小写字母	type2 
	            大写字母	type3 
	            特殊字符	type4 
        */
        function charType(num){
            if(num >= 48 && num <= 57){
            	return 1;
            }else if (num >= 97 && num <= 122) {
                return 2;
            }else if (num >= 65 && num <= 90) {
                return 3;
            }else{
            	return 4;
            }
            
        }     
    </script>
</head>
<body>
<div class = "frame">
		<div class = "top">
			<jsp:include page="top.html" flush="true"/>
		</div>
		
		<div class = "bottom">
			<jsp:include page="left.html" flush="true"/>
			<div class = "right">
			<div class = "xgmm">修改密码</div>
			<div class = "line"></div>
			<form method = "post" action="../zhglxgyhmm">
				<div class = "bg">		
					<p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input class = "wbk" name="username" value = "<%=username %>" type="text" readonly = "readonly" /></p>
					<p>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input class = "wbk" name="xm" value = "<%=xm %>" type="text" readonly = "readonly" /></p>
					<p>旧&nbsp;&nbsp;密&nbsp;&nbsp;码：<input class = "wbk" value = "<%=oldpassword %>" type="text" id="jmm" /></p>
					<p>新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input  name="xmm" value = "" type="text" id = "xmm" placeholder="请输入新密码,长度至少为6位"/></p>
					<p>密码强度：<span></span><span></span><span></span></p>
					<p>确认密码：<input  name="xmm" value = "" type="text" id="qrmm" placeholder="请再次输入新密码"/></p>
				</div>
				<div class = "bg1">
					<button class = "an" value = "修改" id="save">保存</button>
					<button class = "an" type = "button" value = "返回" onclick="window.location.href='zhglyhgl.jsp'">返回</button>
				</div>
			</form>
		</div>		
		</div>>
	</div>
	
	<script type="text/javascript">
	
		$(function(){
			$("#save").click(function(){
				var flag = true;
				var oldPasswd = $("#jmm").val();
				var newPasswd = $("#xmm").val();
				var confirmPasswd = $("#qrmm").val();
				if(newPasswd.length == 0 || confirmPasswd.length == 0){
					flag = false;
					alert("请输入完整信息");
				}else if(oldPasswd == newPasswd){
					flag = false;
					alert("新密码不能与旧密码相同");
				}else if(newPasswd != confirmPasswd){
					flag = false;
					alert("两次输入密码不一致");
				}
				
				if(newPasswd.length < 6 ){
					flag = false;
					alert("密码长度至少为6位");
				}
			
				for(i = 0; i < newPasswd.length; i++) {
					if(newPasswd.charCodeAt(i) > 128){
						flag = false;
						alert("不支持中文密码");
						break;
					}
				}
				
				return flag;
			});
		});
	
		
		
	</script>
	
</body>
</html>