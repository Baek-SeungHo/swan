<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<style type="text/css">
*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
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
  width: 100%;
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

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

}
</style>
<script type="text/javascript">
function checkId(){
	$.ajax({
		url : "/semi/idchk",
		type: "post",
		data: {userid : $('#userid').val()},
		success:function(data){			
			if(data == "ok"){
				alert("사용 가능한 아이디입니다");
				$('#username').focus();
			}else{
				alert("이미 존재하는 아이디입니다. \n다시 입력하십시오");
				$('#userid').select();
			}
			},
			error : function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
			}
		});
		
		return false;
}

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
<form action="<%= request.getContextPath() %>/uinsert.me" method="post">
<h1>회원가입</h1>
<fieldset>
<label for="name">ID:</label>
<input type="text" id="userid" name="userid" style="width:65%;" required > &nbsp;
<button onclick="return checkId();" style="align:right; width:30%">중복확인</button>

<label for="name">NAME:</label>
<input type="text" id="username" name="username" required>

<label for="name">PASSWORD:</label>
<input type="password" name="userpwd" id="upwd1" required>

<label for="name">CONFIRM PASSWORD:</label>
<input type="password" name="userpwd" id="upwd2" style="margin-bottom:5px"required>

<div style="height:25px;"><input type="text" id="confirm" style="display:none; background:#f4f7f8; box-shadow:none; font-size:12px; height:12px; padding-left:0;" readonly></div>

<label for="job">GENDER:</label>
        <select id="usergender" name="usergender">
            <option value="M">M</option>
            <option value="F">F</option>
        </select>

<label for="name">AGE:</label>
<input type="number" id="userage" name="userage" min="20" max="100" required>

<label for="name">EMAIL:</label>
<input type="email" id="useremail" name="useremail" required>

<label for="name">PHONE:</label>
<input type="tel" id="userphone" name="userphone" required>

<button type="submit" id="submit" style="width:100%;">회원가입</button>
</fieldset>
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