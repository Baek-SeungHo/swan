
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="exeboard.model.vo.ExeBoard,user.model.vo.User"%>
<%
	ExeBoard board = (ExeBoard) request.getAttribute("board");
	User loginUser = (User) session.getAttribute("loginUser");
%>
<html>
<meta charset="UTF-8">
<head>
<title>simplestyle_blue_trees - examples</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#delete").click(function() {
			var sportcode = $("#sportcode").val();

			$.ajax({
				url : "/semi/edelete",
				type : "post",
				data : {
					sportcode : sportcode
				},
				success : function(data) {
					alert("게시물삭제성공");
					location.href = "/semi/html/ij/boardlistview.jsp";

				}

			});

		});

	});
</script>
<style type="text/css">
table {
	margin: 10px 0 30px 0;
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: "left";
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
					<li><a href="/semi/html/jh/sikdan.html">식단정보</a></li>
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
							<li><a
								href="/semi/todayschedule?grade=<%=loginUser.getUsergrade()%>">운동스케쥴</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar"></div>
			</div>
			<!--내용-->
			<div id="content">
				<!--게시글 상세보기-->
				<input type="hidden" value="<%=board.getSportcode()%>"
					id="sportcode">
				<table border="1" style="width: 40%;">
					<tr>
						<td>운동부위</td>
						<td><%=board.getSportbody()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=loginUser.getUserId()%></td>
					</tr>
					<tr>
						<td>운동이름</td>
						<td><%=board.getSportname()%></td>
					</tr>
					<tr>
						<td>작성날짜</td>
						<td><%=board.getSportdate()%></td>
					</tr>
					<tr>
						<td colspan="2"><%=board.getSporturl()%></td>
					</tr>
				</table>
				<!--게시글 삭제 -->
				<input type="button" value="목록삭제" id="delete" style="width: 65%">
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdan.html">식단정보</a> | <a
					href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>