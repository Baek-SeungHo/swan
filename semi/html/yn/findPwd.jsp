<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
			<!-- <div id="sidebar_container">
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						insert your sidebar items here
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
					<div class="sidebar_top"></div>
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
					<div class="sidebar_base"></div>
				</div>
			</div> -->
			<!--내용-->
			<div id="content">
  <form action="<%= request.getContextPath() %>/findpwd" method="post">			
  <div class="billing">
    <h2>비밀번호 찾기</h2><br><br><br><br><br>
     <p style="text-align:left; float:left">아이디</p>
    <p style="text-align:right"><input type="text" id="userid" name="userid" style="width:230px; margin-bottom: 0pt;"></p>
    <p style="text-align:left; float:left">이름</p>
    <p style="text-align:right"><input type="text" id="username" name="username" style="width:230px; margin-bottom: 0pt;"></p>
    <p style="text-align:left; float:left">이메일</p>
    <p style="text-align:right"><input type="text" id="useremail" name="useremail" style="width:230px; margin-bottom: 0pt;"></p>
    <p style="text-align:right"><input type="submit" value="submit"></p>
  </div>
  </form>
			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.jsp">메인</a> | <a href="/semi/html/ij/examples.html">운동정보</a> | <a
					href="/semi/html/jh/sikdanInfo.jsp">식단정보</a> | <a href="/semi/html/sh/contact.jsp">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>