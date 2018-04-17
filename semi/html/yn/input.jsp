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
<title>Insert title here</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="/semi/style/style.css" />
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
table
{ margin: 10px 0 30px 0;
  border-spacing:0px;
  border-collapse:collapse;
}

table tr th, table tr td
{ background: #fff;
  color: #fff;
  padding: 7px 4px;
  text-align: center;
  font-size: 14px;
}
  
table tr td
{ background: #fff;
  color: #47433F;
  border: 1px solid #ddd;
}
  

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
  width: 100%;
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
}
</style>
<script type="text/javascript">
	$(function(){
		$('#sportbody').change(function(){
			$.ajax({
				url: "/semi/select.do",
				data: {sportbody: $("#sportbody option:selected").text()},
				type: "get",
				dataType: "json",
				success: function(data){
					 $("#sportname2").find("option").remove().end().append("<option value=''>- 선택 -</option>");
					
					 console.log(data.sportList);
					 
					 $.each(data.sportList, function(i){
						$("#sportname2").append("<option value='"+decodeURIComponent(data.sportList[i].sportName)+"'>"+decodeURIComponent(data.sportList[i].sportName)+"</option>")
					 });										 
				} 		
			}); 	
		});	//change	
		
		$("#chuga").click(function(){			
			$.ajax({
				url: "/semi/ueinsert",
				type: "get",
				data: { userid:$("#userid").val(),
						sportname:$("#sportname2 option:selected").text(),
						sportnum:$("#sportnum2").val(),
						sportdate:$("#sportdate").val(),
						sportbody:$("#sportbody option:selected").text()
					  },
				
				success: function(data){					
					 
					$("#sportbody").val("");
					$("#sportname2").val("");
					$("input[name=sportnum2]").val("");					 									 
				} 		
			});						
		
		}); //chuga
		
		$("#rere").click(function(){			
			$.ajax({
				url: "/semi/uesearch",
				type: "get",
				data: { userid:$("#userid").val(),
						sportdate:$("#sportdate").val()},
				
				success: function(data){
					
					console.log(data.sportTable);
					 $.each(data.sportTable, function(i){
						 $("#insertTable").append("<tr><td>"+decodeURIComponent(data.sportTable[i].sportBody)+"</td><td>"+decodeURIComponent(data.sportTable[i].sportName)+"</td><td>"+decodeURIComponent(data.sportTable[i].sportNum)+"</td></tr>");
										 
					 });
				} 		
			});						
		
		}); //rere	

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
						<a href="/semi/exedetail?userid=<%=loginUser.getUserId()%>">마이페이지</a>&nbsp;&nbsp;&nbsp;
						<a href="/semi/ulogout"><input type="button" value="로그아웃"></a>
					</div>
					<div class="sidebar_base"></div>
				</div>
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Memu</h3>
						<ul>
							<li><a href="/semi/udetail?userid=<%= loginUser.getUserId() %>">회원정보수정</a></li>
							<li><a href="/semi/html/yn/input.jsp">운동기록</a></li>
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
<input type="hidden" id="userid" name="userid" value="<%= loginUser.getUserId() %>">
<input type="hidden" id="sportname" name="sportname" value="">
<input type="hidden" id="sportnum" name="sportnum" value="">
<input type="date" id="sportdate" name="sportdate">
<div id="sportc">			
<select id="sportbody" name="sportbody" style="width:100px;">
   <option value="" style="align:center">- 선택 -</option>
   <option value="01">가슴</option>
   <option value="02">어깨</option>
   <option value="03">팔</option>
   <option value="04">복근</option>
   <option value="05">등</option>
   <option value="06">하체</option>
   <option value="07">허벅지</option>
</select>

<select id="sportname2" style="width:200px;">
   <option value="" style="text-align:center">- 선택 -</option>
</select>

<input type="text" id="sportnum2" name="sportnum2" placeholder="횟수" style="width:100px;">
<input type="button" value="추가" id="chuga">
</div>

<div id="sporttable">
<table id="insertTable">
	<tr>
		<td style="width:95px; background-color: #eee; color: rgb(35,146,173);">부위</td>
		<td style="width:195px; background-color: #eee; color: rgb(35,146,173);">이름</td>
		<td style="width:95px; background-color: #eee; color: rgb(35,146,173); word-break:break-all;">횟수</td>
	</tr>
</table>
<input type="button" value="갱신" id="rere">
</div>

			</div>
			<!--내용끝-->
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			<p>
				<a href="/semi/index.html">메인</a> | <a href="/semi/html/ij/boardlistview.jsp">운동정보</a> | <a
					href="/semi/html/jh/page.html">식단정보</a> | <a href="/semi/html/sh/contact.html">고객센터</a>
			</p>
			<p>
				세미프로젝트 <a>조원:김일중,장유나,백종현,백승호</a>
			</p>
		</div>
	</div>
</body>
</html>