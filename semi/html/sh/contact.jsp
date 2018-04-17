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
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript">
function initialize() {
  var mapProp = {
    center:new google.maps.LatLng(37.499, 127.03286),
    zoom:18,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
    
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
  
  var uluru = {lat: 37.499, lng: 127.03286};
  
  var marker = new google.maps.Marker({
	  position: uluru,
	  map: map
	});
}
google.maps.event.addDomListener(window, 'load', initialize);
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
				<h1>Contact to Us</h1>
				<h5>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F (T: 1544-9970 / F: 070-8290-2889)</h5>
				<div>
					<div id="googleMap" style="width:500px; height:380px;"></div>
				</div>
				<div class="form_settings">
					<form method=get action="Mailto:hi_back@naver.com" enctype="text/plain">
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Mail to Amdin" />
						</p>
					</form>
				</div>
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