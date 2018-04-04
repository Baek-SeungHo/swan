<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<%-- <% for(QNA q : list){ %>
			<tr>
				<td><b class="b_slide"><%= q.qna_question %> </b>
					<ul class="ul_slide" style="list-style: none;">
						<b><%= q.qna_answer %></b>
					</ul>
				</td>
			</tr>
		<% } %> --%>
	</table>
	
</body>
</html>