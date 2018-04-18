<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact us</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<script type="text/javascript">

</script>
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
						<%   
   							if(loginUser == null) {   
   						 %>
						<a href="/semi/html/yn/userLoginPage.jsp">로그인</a>&nbsp;
						<a href="/semi/html/yn/userEnroll.jsp">회원가입</a>
						<% } else {%>
						<h4><%=loginUser.getUserName()%>님 환영합니다
						</h4>
						<a href="/semi/exedetail?userid=<%=loginUser.getUserId()%>">마이페이지</a>&nbsp;&nbsp;&nbsp;
						<a href="/semi/ulogout"><input type="button" value="로그아웃"></a>
						<% } %>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Memu</h3>
						<ul>
							<li><a href="/semi/html/sh/contact.jsp">Contact to Us</a></li>
							<li><a href="/semi/html/sh/contact3.jsp">1:1 문의</a></li>
							<li><a href="/semi/qnalist?page=1">자주묻는질문</a></li>

							<!-- /semi/html/sh/contact2.html -->
						</ul>
					</div>
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
						</form>
					</div> -->
					<!-- <div class="sidebar_base"></div> -->
				</div>
			</div>
			<div id="content">
				<!-- insert the page content here -->
				<h1>1:1 문의</h1>
				<h5>관리자에게 메일을 보내 상담을 받으실 수 있습니다.</h5>
				<div>
					
					<!-- 제목 -->
					제목<br>
					<input type="text" style="width: 400px;"><br><br>
					
					<!-- 보내는사람(비 로그인시 로그인하라고 창뜨고 안보냄) -->
					<input type="hidden">
					
					<!-- 내용 --> 
					내용<br>
					<textarea rows="8" cols="61"></textarea><br><br>
					
					<!-- 보내기버튼 -->
					<input type="submit" value="보내기">
					
					
					
					
				</div>
				<!-- <div class="form_settings">
					<form method=get action="Mailto:hi_back@naver.com" enctype="text/plain">
						<p style="padding-top: 15px">
							<span>&nbsp;</span>
							<input class="submit" type="submit" name="contact_submitted" value="Mail to Amdin" />
						</p>
					</form>
				</div> -->
				<p>
					<br />
				</p>
			</div>
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a
					href="/semi/html/ij/boardlistview.jsp">운동정보</a> | <a
					href="/semi/html/jh/sikdanInfo.jsp">식단정보</a> | <a
					href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
			</p>
		</div>
	</div>
</body>
</html>