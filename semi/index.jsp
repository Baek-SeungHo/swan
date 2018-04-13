<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
    User loginUser = (User)session.getAttribute("loginUser");    
%>    

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>Swan</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
 
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

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
					<li><a href="/semi/html/ij/exercise.html">운동정보</a></li>
					<li><a href="/semi/html/jh/sikdan.html">식단정보</a></li>
					<li><a href="/semi/html/sh/contact.jsp">고객센터</a></li>
				</ul>
			</div>        
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<!--       <div id="banner"></div> -->
			<img id="banner" src="/semi/style/banner.jpg">
			<div id="sidebar_container">
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<!-- insert your sidebar items here -->
						 <%   
   							if(loginUser == null) {   
   						 %>
						<a href="/semi/html/yn/userLoginPage.jsp">로그인</a>
						<% } else {%>
						<h4><%= loginUser.getUserName() %>님 환영합니다</h4>
						<a href="/semi/udetail?userid=<%= loginUser.getUserId() %>">회원정보수정</a>
						<a href="/semi/ulogout"><input type="button" value="로그아웃"></a>
						<a href="/semi/html/yn/input.jsp">운동기록</a>
						<a href="/semi/html/yn/goal.jsp">추가입력</a>
						<a href="/semi/exedetail?userid=<%= loginUser.getUserId() %>">마이페이지</a>
						<% } %>
					</div>
					<!--메뉴바부분-->
					<!--           <div class="sidebar_base"></div>
        </div>
        <div class="sidebar">
          <div class="sidebar_top"></div> -->    

					<!--           <div class="sidebar_item">
          </div> -->
					<!--메뉴바부분끝  -->
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<!-- <div class="sidebar_top"></div> -->
					<!-- <div class="sidebar_item">
						<h3>검색</h3>
						<form method="post" action="#" id="search_form">
							<p>
								<input class="search" type="text" name="search_field"
									value="Enter keywords....." /> <input name="search"
									type="image" style="border: 0; margin: 0 0 -9px 5px;"
									src="style/search.png" alt="Search" title="Search" />
							</p>
						</form> -->
					</div>
					<div class="sidebar_base"></div>
				</div>
			</div>
			<!--내용시작-->
			<div id="content">
			
			
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdan.html">식단정보</a> | <a href="/semi/html/sh/contact.html">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>
