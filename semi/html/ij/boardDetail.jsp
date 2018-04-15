
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
					<li><a href="/semi/html/ij/exercise.jsp">운동정보</a></li>
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
						<h4>관리자님 환영합니다</h4>
						<a href="/semi/html/yn/another_page.html">마이페이지</a>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>메뉴</h3>
						<ul>
							<li><a href="/semi/html/ij/exercisequestionnaire.jsp">몸상태설문조사</a></li>
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
				<table>
					<tr>
						<td>운동부위</td>
						<td><%=board.getSportbody()%></td>
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
				<input type="button" value="목록삭제" id="delete">
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