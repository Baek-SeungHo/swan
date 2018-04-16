<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User"%>
<%
	User user = (User)request.getAttribute("user");
	User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<style type="text/css">
/* *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
} */

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 280px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 20px 0;
  text-align: center;
  color: rgb(190,190,190);
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 10px;
  width: 420px;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 20px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
  width: 100%;
}

button {
  padding: 9px 9px 9px 9px;
  color: #FFF;
  background-color: rgb(200,200,200);
  font-size: 14px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 50%;
  border: 1px solid rgb(180,180,180);
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 440px) {

  form {
    max-width: 440px;
  }

}
</style>
<script type="text/javascript">
$(function(){
	$('input[type=password]').blur(function(){
		var pwd1 = $("#upwd1").val();
		var pwd2 = $("#upwd2").val();
		
		if(pwd1 == pwd2 ){
			$("#confirm").css("display", "true");
			$("#confirm").val("");
		}else {
			$("#confirm").css("display", "block");
			$("#confirm").val("비밀번호가 일치하지 않습니다");
		}
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
						<%-- <h4><%= loginUser.getUserName() %>님 환영합니다</h4>
						<a href="/semi/exedetail?userid=<%= loginUser.getUserId() %>">마이페이지</a> --%>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<%-- <ul>
							<li><a href="/semi/udetail?userid=<%= loginUser.getUserId() %>">회원정보수정</a></li>
							<li><a href="/semi/html/yn/input.jsp">운동기록</a></li>
						</ul> --%>
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
<form action="<%= request.getContextPath() %>/uupdate.me" method="post">
<h1>회원정보수정</h1>
<fieldset>
<label for="name">ID:</label>
<input type="text" name="userid" value="<%= user.getUserId() %>" readonly>

<label for="name">NAME:</label>
<input type="text" name="username" value="<%= user.getUserName() %>" readonly>

<label for="name">PASSWORD:</label>
<input type="password" name="userpwd" id="upwd1" required>

<label for="name">CONFIRM PASSWORD:</label>
<input type="password" name="userpwd" id="upwd2" style="margin-bottom:0px" required>

<div style="height:25px;"><input type="text" id="confirm" style="display:none; background:#f4f7f8; box-shadow:none; font-size:13px; height:16px; padding-left:0; margin-bottom:10px" readonly></div>

<label for="job" style="margin-top:7px;">GENDER:</label>
  <select id="usergender" name="usergender">
  <% if(user.getUserGender().equals("M")) { %>
            <option value="M" selected>M</option>
            <option value="F">F</option> <% }else{ %>
            <option value="M">M</option>
             <option value="F" selected>F</option> <% } %>
        </select>

<label for="name">AGE:</label>
<input type="number" id="userage" name="userage" min="20" max="100" value="<%= user.getUserAge() %>" required>

<label for="name">EMAIL:</label>
<input type="email" name="useremail" value="<%= user.getUserEmail() %>">

<label for="name">PHONE:</label>
<input type="tel" name="userphone" value="<%= user.getUserPhone() %>">

<button type="submit" style="width:48%;">수정하기</button> &nbsp;
<a href="/semi/udelete?userid=<%= user.getUserId() %>"><button type="button" style="width:48%;">탈퇴하기</button></a>
</fieldset>
</form>	
				</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdan.html">식단정보</a> | <a href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>