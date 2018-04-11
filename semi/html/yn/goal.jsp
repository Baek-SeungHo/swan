<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="user.model.vo.User" %>
<%
	User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simplestyle_blue_trees - another page</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Oxygen:400,700);
@import url(https://fonts.googleapis.com/css?family=Knewave);
@import url(https://fonts.googleapis.com/css?family=Luckiest+Guy);

.shipping{
  float: left;
  text-align: center;
  width: 300px;
}
.billing{
  float: left;
  width: 300px;
}

h2{
  color: #0082C5;
  padding: 0px;
  float: left;
}

input{
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
select{
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
.checkBox{
  clear: left;
  float: left;
  height: 13px;
  margin: 13px 0px 0px 15px;
  width: 13px;
}
.checkBoxText{
  float: left;
  margin: 10px 0px 10px 15px;
  padding: 0px;
}

</style>
<script type="text/javascript">
$(function(){
	$('input[type=text]').blur(function(){
		var height = $("#userheight").val();
		var weight = $("#userweight").val();
		
		console.log(height);
		console.log(weight);
		
		$("#userbmi").val((1.1*weight)-(128*(weight/height)));
		/* if(loginUser.getUserGender().equals("M") ){
			$("#userbmi").val((1.1*weight)-[128*(weight/height)]);
		}else {
			$("#userbmi").val("(1.07*weight)-[128*(weight/height)]");
		} */
	});
});
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
					<li><a href="/semi/html/ij/examples.html">운동정보</a></li>
					<li><a href="/semi/html/jh/page.html">식단정보</a></li>
					<li><a href="/semi/html/sh/contact.html">고객센터</a></li>
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
						<ul>
							<li><a href="#">회원정보수정</a></li>
							<li><a href="#">운동기록</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<!-- <div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>검색</h3>
						<form method="post" action="#" id="search_form">
							<p>
								<input class="search" type="text" name="search_field"
									value="Enter keywords....." /> <input name="search"
									type="image" style="border: 0; margin: 0 0 -9px 5px;"
									src="style/search.png" alt="Search" title="Search" />
							</p>
						</form>
					</div>
					<div class="sidebar_base"></div> -->
				</div>
			</div>
			<!--내용-->
			<div id="content">
  <form action="<%= request.getContextPath() %>/exeinsert" method="post">			
  <div class="billing">
    <h2>추가 입력사항</h2><br><br><br>
    <input type="hidden" id="userid" name="userid" value="<%= loginUser.getUserId() %>">
     <p style="padding-bottom:2px;">신장</p>
    <input type="text" id="userheight" name="userheight" placeholder="cm">
     <p style="padding-bottom:2px;">체중</p>
    <input type="text" id="userweight" name="userweight" placeholder="kg">
     <p style="padding-bottom:2px;">BMI</p>  
    <input type="text" id="userbmi" name="userbmi">
     <p style="padding-bottom:2px;">목표체중</p>
    <input type="text" id="usergoal" name="usergoal" placeholder="kg">
    <p style="padding-bottom:2px;">시작날짜</p>
    <input type="date" id="userstartdate" name="userstartdate">
    <p style="padding-bottom:2px;">목표날짜</p>
    <input type="date" id="userenddate" name="userenddate">
    <br><br>
    <p><input type="submit" value="submit"></p>
  </div>
  </form>
				 
				</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/page.html">식단정보</a> | <a href="/semi/html/sh/contact.html">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>