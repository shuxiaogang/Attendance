<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>注册</title>
<style>
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
	margin-left: 20px;
	margin-top: 10px;
}

#wai {
	width: 100%;
	height: 100%;
	background: #4beb4b;
	position: absolute;
}

#ti {
	width: 800px;
	height: 580px;
	margin: 145px auto;
	border: 3px solid red;
	border-radius: 15px;
	background: #cbd1e3;
	position: relative;
}

li {
	line-height: 30px;
}

#sub {
	width: 90px;
	height: 25px;
	text-align: center;
	margin-top: 20px;
	margin-left: 50px;
}

img {
	position: absolute;
	right: 30px;
	top: 30px;
	width: 550px;
	border: 2px solid;
}
#pic{
	width: 160px;
}
</style>
</head>
<body>
	<div id="wai">
		<div id="ti">
			<form action="register.do" method="post" enctype="multipart/form-data">
				<ul>
					<li>用户名<br> <input type="text" name="userID">*</li>
					<li>密码<br> <input type="password" name="password">*</li>
					<li>确认密码<br> <input type="password" name="rePassword">*</li>
					<li>姓名<br> <input type="text" name="name">*</li>
					<li>年龄<br> <input type="text" name="age"></li>
					<li>联系方式<br> <input type="text" name="tel"></li>
					<li>地址<br> <input type="text" name="address"></li>
					<li>头像<br> <input type="file" id="pic"name="pic">*</li>
				</ul>
				<input id="sub"type="submit" value="提交">
				<br>
  				<p >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"><%=(request.getAttribute("info") == null ? "" : request  
					.getAttribute("info"))%>  </font></p>
			</form>
			<img src="<%=request.getContextPath()%>/static/images/3.jpg" alt="">
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/static/js/jquery-1.9.1.min.js"></script>
	<script>
		$(function() {
		
		});
	</script>
</body>
</html>