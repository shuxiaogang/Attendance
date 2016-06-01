<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>工作愉快</title>
<style>
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

body {
	background: url(<%=request.getContextPath()%>/static/images/4.jpg) 50%
		50% no-repeat;
}

#tou {
	width: 600px;
	margin: 50px auto;
	font-size: 50px;
}

#ka {
	width: 1100px;
	height: 550px;
	margin: 30px auto;
	position: relative;
}

#qian {
	width: 400px;
	height: 540px;
	float: left;
	position: absolute;
}

#qian ul {
	float: right;
	position: absolute;
}

#qian li {
	width: 290px;
	height: 60px;
	margin-top: 5px;
	border-radius: 15px;
	line-height: 60px;
	text-align: center;
	padding-right: 100px;
}

#yi {
	background: #eff770;
	position: absolute;
	left: 0;
	top: 0;
}

#er {
	background: #50d877;
	position: absolute;
	left: 0;
	top: 70px;
}

#san {
	background: #f7707a;
	position: absolute;
	left: 0;
	top: 140px;
}

#si {
	background: #ee48f0;
	position: absolute;
	left: 0;
	top: 210px;
}

#ti {
	width: 800px;
	height: 540px;
	border: 3px solid yellow;
	border-radius: 5px;
	position: absolute;
	right: 0;
	top: 0;
	background: white;
	z-index: 1;
}

#xuan>li {
	display: none;
}

#ti .zhong {
	display: block;
}

#xuan>li>div {
	width: 795px;
	height: 535px;
	position: relative;
}

#geren {
	line-height: 40px;
	position: absolute;
	left: 40px;
	top: 50px;
}

#geren li {
	width: 500px;
}

#geren li input {
	float: right;
	margin-top: 12px;
	display: none;
}

button {
	width: 90px;
	height: 30px;
}

#button-yi {
	position: absolute;
	left: 90px;
	top: 440px;
}

#button-er {
	position: absolute;
	left: 200px;
	top: 440px;
	display: none;
}

#mima {
	display: none;
}

#sex {
	position: absolute;
	top: 105px;
	left: 380px;
	display: none;
}

#div-er table {
	margin: 50px auto;
}

#div-er td {
	text-align: center;
	width: 70px;
	height: 30px;
}

#div-san>div {
	width: 100%;
	height: 250px;
	position: relative;
}

#div-san button {
	position: absolute;
	top: 80px;
	left: 345px;
}

#div-san .er {
	width: 240px;
	height: 180px;
	position: absolute;
	top: 40px;
	left: 550px;
	border: 1px solid black;
}

#div-san .san {
	width: 240px;
	height: 180px;
	position: absolute;
	top: 140px;
	left: 20px;
	border: 1px solid black;
}

#div-san input {
	position: absolute;
	top: 180px;
	left: 280px;
	line-height: 30px;
	width: 220px;
	font-size: 25px;
	border: 1px solid blue;
}

#div-si textarea {
	font-size: 25px;
}

#div-si button {
	position: absolute;
	left: 330px;
	top: 450px;
}

#div-yi img {
	position: absolute;
	right: 20px;
	top: 40px;
	width: 120px;
	height: 170px;
}
</style>
</head>
<body>
	<div id="wai">
		<div id="tou">
			
			欢迎<P>${user.name}</P>
			<input type="hidden" id="userID"
				value="${user.userID}">
			<p></p>
		</div>
		<div id="ka">
			<div id="qian">
				<ul>
					<li id="yi">个人信息</li>
					<li id="er">排班查询</li>
					<li id="san">签到/签退</li>
					<li id="si">请假</li>
				</ul>
			</div>
			<div id="ti">
				<ul id="xuan">
					<li class="zhong" class="yi">
						<div id="div-yi">
							<ul id="geren">
								<li>姓名：<span>${user.name}</span>  </li>
								<li>年龄：<span>${user.age}</span></li>
								<li>电话：<span>${user.tel}</span></li>
								<li>地址：<span>${user.address}</span></li>
							</ul>
							<div id="sex">
								<input type="radio"> 男 <input type="radio"> 女
							</div>
							<button id="button-yi">修改</button>
							<button id="button-er">确定</button>

							<img src="/upload/${user.userID}.jpg" alt="">
						</div>
					</li>
					<li class="yi">
						<div id="div-er">
							<table border="2">
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>8</td>
									<td>9</td>
									<td>10</td>
									<td>11</td>
									<td>12</td>
									<td>13</td>
									<td>14</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>15</td>
									<td>16</td>
									<td>17</td>
									<td>18</td>
									<td>19</td>
									<td>20</td>
									<td>21</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>22</td>
									<td>23</td>
									<td>24</td>
									<td>25</td>
									<td>26</td>
									<td>27</td>
									<td>28</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>29</td>
									<td>30</td>
									<td>31</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
					</li>
					<li class="yi">
						<div id="div-san">

							<div id="dao">
								<button class="yi" id="signin">签到</button>
								<div id="daotu" class="er">
									<%
										if (request.getAttribute("signInTime") != null) {
									%>
									<img alt="" height="180" width="240"
										src="/upload/${user.userID}${workDay}in.jpg">
									<%
										} else {
									%>
									<canvas id="canvas1" width="640" height="480"
										style='width:240px;height:180px'></canvas>
									<%
										}
									%>


								</div>
								<%
									if (request.getAttribute("signInTime") != null) {
								%>
								<input type="text" id=signintime disabled="disabled"
									value="${signInTime}">
								<%
									} else {
								%>

								<input id="signintime" type="text" value="未签到"
									disabled="disabled">
								<%
									}
								%>

								<div class="san">
									<video id="video" autoplay="" style='width:240px;height:180px'></video>
								</div>

							</div>
							<div id="tui">
								<button class="yi" id=signout>签退</button>
								<div id="tuitu" class="er">
									<%
										if (request.getAttribute("signOutTime") != null) {
									%>
									<img alt="" height="180" width="240"
										src="/upload/${user.userID}${workDay}out.jpg">
									<%
										} else {
									%>
									<canvas id="canvas2" width="640" height="480"
										style='width:240px;height:180px'></canvas>

									<%
										}
									%>

								</div>
								<%
									if (request.getAttribute("signOutTime") != null) {
								%>
								<input type="text" id=signouttime disabled="disabled"
									value="${signOutTime}">
								<%
									} else {
								%>
								<input id="signouttime" type="text" value="未签退"
									disabled="disabled">
								<%
									}
								%>
							</div>
						</div>
					</li>
					<li class="yi">
						<div id="div-si">
							<textarea name="" id="" cols="60" rows="14"></textarea>
							<button>提交</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/static/js/jquery-1.9.1.min.js"></script>
	<script>
		// 对Date的扩展，将 Date 转化为指定格式的String 
		// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
		// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
		// 例子： 
		// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
		// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
		Date.prototype.format = function(fmt) { //author: meizz 
			var o = {
				"M+" : this.getMonth() + 1, //月份 
				"d+" : this.getDate(), //日 
				"h+" : this.getHours(), //小时 
				"m+" : this.getMinutes(), //分 
				"s+" : this.getSeconds(), //秒 
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
				"S" : this.getMilliseconds()
			//毫秒 
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
		$(function() {
			$("#qian li").on(
					"click",
					function() {
						$(this).addClass("zhong").siblings().removeClass(
								"zhong");
						$(this).animate({
							left : "-30px"
						}).siblings().animate({
							left : "0"
						})
						var index = $(this).index();
						$("#xuan>li:eq(" + index + ")").addClass("zhong")
								.siblings().removeClass("zhong");
					});
			$("#button-yi").on("click", function() {
				$("#button-er").addClass("zhong");
				$("#geren input").addClass("zhong");
				$("#mima").addClass("zhong");
				$("#sex").addClass("zhong");
				alert("如修改密码请认真确认");
			});
			$("#button-er").on("click", function() {
				$("#button-er").removeClass("zhong");
				$("#geren input").removeClass("zhong");
				$("#mima").removeClass("zhong");
				$("#sex").removeClass("zhong");
			});

		});
		var context1;
		var context2;
		var video = document.getElementById("video");
		if ($("#signintime").val() == "未签到") {
			context1 = canvas1.getContext("2d");
		}
		if ($("#signouttime").val() == "未签退") {
			context2 = canvas2.getContext("2d");
		}
		var errocb = function() {
			console.log("sth srong");
		}
		if (navigator.getUserMedia) {
			navigator.getUserMedia({
				"video" : true
			}, function(stream) {
				video.src = stream;
				video.play();
			}, errocb);
		} else if (navigator.webkitGetUserMedia) {
			navigator.webkitGetUserMedia({
				"video" : true
			}, function(stream) {
				video.src = window.webkitURL.createObjectURL(stream);
				video.play();
			}, errocb);
		}
		document
				.getElementById("signin")
				.addEventListener(
						"click",
						function() {

							if ($("#signintime").val() == "未签到") {
								context1.drawImage(video, 0, 0, 640, 480);
								// Generate the image data
								var Pic = document.getElementById("canvas1")
										.toDataURL("image/png");

								Pic = Pic.replace(
										/^data:image\/(png|jpg);base64,/, "")
								// Sending the image data to Server
								var userID = $("#userID").val();
								$
										.ajax({

											type : 'POST',
											url : 'signin.do',
											data : {
												'imageData' : Pic,
												'userID' : userID
											},
											dataType : 'json',
											success : function(data) {
												if (data.message.toString() == "success") {
													alert("签到成功")
													var now = new Date();
													var nowStr = now
															.format("hh:mm:ss");
													document
															.getElementById("signintime").value = nowStr;
												} else {
													alert("签到失败")
												}

											},

										});
							} else {
								alert("不能重复签到")
							}

						});
		document
				.getElementById("signout")
				.addEventListener(
						"click",
						function() {
							if ($("#signintime").val() == "未签到") {
								alert("未签到，不能签退")
								return;
							}
							if ($("#signouttime").val() == "未签退") {
								context2.drawImage(video, 0, 0, 640, 480);

								// Generate the image data
								var Pic = document.getElementById("canvas2")
										.toDataURL("image/png");

								Pic = Pic.replace(
										/^data:image\/(png|jpg);base64,/, "")
								// Sending the image data to Server
								var userID = $("#userID").val();
								$
										.ajax({

											type : 'POST',
											url : 'signout.do',
											data : {
												'imageData' : Pic,
												'userID' : userID
											},
											dataType : 'json',
											success : function(data) {
												if (data.message.toString() == "success") {
													alert("签退成功")
													var now = new Date();
													var nowStr = now
															.format("hh:mm:ss");
													document
															.getElementById("signouttime").value = nowStr;
												} else {
													alert("签退失败")
												}
											},
										});
							} else {
								alert("不能重复签退")
							}
						});
	</script>
</body>
</html>