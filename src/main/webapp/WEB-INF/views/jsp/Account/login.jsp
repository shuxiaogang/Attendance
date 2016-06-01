<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>欢迎使用考勤系统</title>
<style>
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

#wai {
	width: 100%;
	height: 100%;
	background: #1ca2f7;
	position: absolute;
}

#tou {
	width: 400px;
	height: 30px;
	margin: 100px auto;
	font: 50px "叶根友毛笔行书2.0版";
}

#tu {
	width: 340px;
	height: 110px;
	margin: 50px auto;
	display: block;
}

#di {
	width: 700px;
	margin: 50px auto;
	line-height: 50px;
}

#zuo {
	width: 330px;
	height: 330px;
	border: 1px solid red;
	border-radius: 15px;
	margin-right: 10px;
	background: #50d877;
}

#di>div {
	float: left;
}

h3 {
	text-align: center;
	margin-top: 50px;
}

#you {
	width: 330px;
	height: 330px;
	border: 1px solid red;
	border-radius: 15px;
	background: #50d877;
}

ul {
	margin: 30px 0 0 50px;
}

button {
	width: 80px;
	height: 25px;
}
#you .btn1{
	width: 80px;
	height: 25px;
}
#zuo button {
	margin: 30px auto;
	display: block;
}

#niu {
	text-align: center;
	margin-top: 10px;
}
#you p{
	text-align: center;
}
</style>
</head>
<body>

	<div id="wai">
		<div id="tou">欢迎使用考勤系统</div>
		<img src="<%=request.getContextPath() %>/static/images/2.png" alt=""
			id="tu">
		<div id="di">
			<div id="zuo">
				<h3>管理员登录</h3>
				<ul>
					<li>用户名: <input type="text">
					</li>
					<li>密&nbsp;&nbsp;码: <input type="password">
					</li>
				</ul>
				<button>登录</button>
			</div>
			<div id="you">
				<form action="login.do" method="post">
					<h3>员工登录</h3>
					<ul>
						<li>用户名: <input type="text" name="userID">
						</li>
						<li>密&nbsp;&nbsp;码: <input type="password" name="password">
						</li>
					</ul>
					<div id="niu">
						<input type="submit" value="登陆" class="btn1"/>
						<input class="btn1" type="button" value="注册" onclick="window.location.href='rmain.do'"/>
					</div>
						<p><font color="red">
						<%=(request.getAttribute("info") == null ? "" : request  
					.getAttribute("info"))%></font> </p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>