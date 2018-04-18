<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#sportupdate").click(function() {
			var select = $("#sportbody > option:selected").text();
			var sportname = $("#sportname").val();
			var sportcode = $("#sportcode").val();
			var sporturl = $("#sporturl").val();

			$.ajax({
				url : "/semi/einsert",
				type : "post",
				data : {
					select : select,
					sportname : sportname,
					sportcode : sportcode,
					sporturl : sporturl
				},
				success : function(data) {
					alert("게시물등록성공");
					location.href = "/semi/html/ij/boardlistview.jsp";
				},
				error : function(a, b, c) {
					console.log("error:" + a + b + c)
				}

			});

		});

	});

	function logincheck(url) {
		if (
<%=loginUser == null%>
	) {
			alert('로그인을 해주세요.');
			location.href = '/semi/html/yn/userLoginPage.jsp';
		} else
			location.href = url;

	}
</script>
<style type="text/css">
table {
	margin: 10px 0 30px 0;
	border-spacing: 2px;
	border-collapse: collapse;
	width: 90%
}

table tr th, table tr td {
	background: #fff;
	color: #fff;
	padding: 7px 4px;
	text-align: center;
	font-size: 14px;
}

table tr td {
	background: #fff;
	color: #47433F;
	border: 1px solid #ddd;
}

@import url(https://fonts.googleapis.com/css?family=Oxygen:400,700);

@import url(https://fonts.googleapis.com/css?family=Knewave);

@import url(https://fonts.googleapis.com/css?family=Luckiest+Guy);

.shipping {
	float: left;
	text-align: center;
	width: 300px;
}

.billing {
	float: left;
	width: 100%;
}

h2 {
	color: #0082C5;
	padding: 0px;
	float: left;
}

input {
	background-color: #f2f2f2;
	border: 1px solid #c8c8c8;
	font-family: 'Oxygen', sans-serif;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0px 0px 10px 0px;
	padding: 8px;
}

select {
	background-color: #f2f2f2;
	border: 1px solid #c8c8c8;
	font-family: 'Oxygen', sans-serif;
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0px 0px 10px 0px;
	padding: 8px;
	width: 90%;
}

.checkBox {
	clear: left;
	float: left;
	height: 13px;
	margin: 13px 0px 0px 15px;
	width: 13px;
}

.checkBoxText {
	float: left;
	margin: 10px 0px 10px 15px;
	padding: 0px;
}
</style>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="/semi/index.jsp"><span class="logo_colour">Swan</span></a>
					</h1>
				</div>

			</div>
			<div id="menubar">
				<ul id="menu">
					<li><a href="/semi/html/ij/boardlistview.jsp">운동정보</a></li>
					<li><a href="/semi/html/jh/sikdanInfo.jsp">식단정보</a></li>
					<li><a href="/semi/html/sh/contact.jsp">고객센터</a></li>
				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="sidebar_container">
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<!-- insert your sidebar items here -->
						<h4><%=loginUser.getUserName()%>님 환영합니다
						</h4>
						<a href="/semi/exedetail?userid=<%=loginUser.getUserId()%>">마이페이지</a>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>메뉴</h3>
						<ul>
							<!-- <li><a href="/semi/html/ij/exercisequestionnaire.jsp">몸상태설문조사</a></li> -->
							<li><a href="/semi/html/ij/boardlistview.jsp">운동검색기</a></li>
							<li><a href="#"
								onclick="logincheck('/semi/todayschedule?grade=C');">운동스케쥴</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar"></div>
			</div>
			<!--내용-->
			<div id="content">
				<h2 align="center">운동게시물등록</h2>
				<br> <br> <br> <br> <br>
				<table>
					<tr>
						<td>운동부위</td>
						<td><select id="sportbody" style="width: 100%">
								<option value="">부위선택</option>
								<option value="chest">가슴</option>
								<option value="shoulder">등</option>
								<option value="etc">어깨</option>
								<option value="abs">복근</option>
								<option value="lowerbody">하체</option>
								<option value="Thigh">허벅지</option>
								<option value="arm">팔</option>
						</select></td>
					</tr>
					<tr>
						<td>운동이름</td>
						<td><input type="text" placeholder="운동이름입력" id="sportname"
							style="width: 100%"></td>
					</tr>
					<tr>
						<td>운동코드</td>
						<td><input type="text" placeholder="운동코드입력" id="sportcode"
							style="width: 100%"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=loginUser.getUserId()%></td>
					</tr>
					<tr>
						<td>url코드</td>
						<td><input type="text" placeholder="URL소스코드입력" id="sporturl"
							style="width: 100%"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: right"><input
							type="button" value="업데이트" id="sportupdate"></td>
					</tr>
				</table>

			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdanInfo.jsp">식단정보</a> | <a
					href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>