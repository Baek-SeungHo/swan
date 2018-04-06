<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page
	import="qna.model.vo.QNA, user.model.vo.User, java.util.*"%>
<%
	ArrayList<QNA> list = (ArrayList<QNA>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();

	User loginUser = (User) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qnacontent</title>
<script type="text/javascript" src="/semi/source/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 		$(".b_slide").click(function() {
		 if ($(".ul_slide").is(":visible")) {

		 $(".ul_slide").slideUp();
		 } else {
		 $(".ul_slide").slideDown();
		 }
		 }); */
	});
</script>
<style type="text/css">
/* .b_slide {
	cursor: pointer;	
} */
</style>
</head>
<body>
	<!-- <h1>Q & A</h1>
	<p>자주 묻는 사항들을 게시한 페이지 입니다.</p>
	<table style="width: 600px;">
		<tbody>
			<tr>
				<td>item1</td>
			</tr>
			<tr>
				<td>Item2</td>
			</tr>
			<tr>
				<td>Q.만들기 너무 기차나여</td>
			</tr>
			<tr>
				<td><b class="b_slide">Q . 111</b>
					<ul class="ul_slide" style="list-style: none;">
						<b>222</b>
					</ul></td>
			</tr>
		</tbody>
	</table> -->
	<table style="width: 100%; background: red; height: 50px;">
		<%
			for (QNA q : list) {
		%>
		<tr>
			<td><b class="b_slide"><%=q.getQna_question()%> </b>
				<ul class="ul_slide" style="list-style: none;">
					<b><%=q.getQna_answer()%></b>
				</ul></td>
		</tr>
		<%
			}
		%>
	</table>

	<br>
	<!-- 페이징 처리 -->
	<div style="text-align: center;">
		<%
			if (currentPage <= 1) {
		%>
		[맨처음]&nbsp;
		<%
			} else {
		%>
		<a href="/first/qnalist?page=1">[맨처음]</a>
		<%
			}
		%>
		<%
			if ((currentPage - 10) < startPage && (currentPage - 10) > 1) {
		%>
		<a href="/first/qnalist?page=<%=startPage - 10%>">[prev]</a>
		<%
			} else {
		%>
		[prev]&nbsp;
		<%
			}
		%>
		<!-- 현재 페이지가 포함된 그룹의 페이지 숫자 출력 -->
		<%
			for (int p = startPage; p <= endPage; p++) {
				if (p == currentPage) {
		%>
		<font color="red" size="4"><b>[<%=p%>]
		</b></font>
		<%
			} else {
		%>
		<a href="/first/qnalist?page=<%=p%>"><%=p%></a>
		<%
			}
			}
		%>

		<%
			if ((currentPage + 10) > endPage && (currentPage + 10) < maxPage) {
		%>
		<a href="/first/qnalist?page=<%=endPage + 10%>">[next]</a>
		<%
			} else {
		%>
		[next]&nbsp;
		<%
			}
		%>

		<%
			if (currentPage >= maxPage) {
		%>
		[맨끝]&nbsp;
		<%
			} else {
		%>
		<a href="/first/qnalist?page=<%=maxPage%>">[맨끝]</a>
		<%
			}
		%>
	</div>

</body>
</html>