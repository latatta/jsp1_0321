<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2 member 출력</title>
<script src="https://kit.fontawesome.com/8c0ac4dbcb.js"
	crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap')
	;

* { /* 모든 요소 */
	font-family: 'Gamja Flower', cursive;
}

table {
	margin: auto;
	text-align: center;
	border-top: 3px solid gray;
	border-bottom: 3px solid gray;
}

td {
	padding : 10px 20px;
	background-color : lightpink;
	/* border: 1px dashed gray; */ /* 완성하면 지우세요. 가이드선. */
}

.title {
	padding : 10px 20px;
	background-color: #c69;
	border-radius: 4px;
	text-align: center;
	color: white;
}

</style>
</head>
<body>
	<div style="margin:auto;">
	<h3 style="text-align: center;">회원 정보
	    <i class="fa-solid fa-camera-retro" style="color:skyblue;font-size: 1.5em;"></i></h3>    
	<!-- memberReg.html에서 입력한 7개의 사용자 입력값을 전달받아서 table태그에 출력해보세요. -->
	<%
		// method="post"방식으로 데이터 전달되었을때 인코딩 꼭 하세요.
		request.setCharacterEncoding("UTF-8");
		
		// hobby 파라미터 받아서 출력하는 것은 잘 안되면 빼놓고 해도 됩니다.
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
	%>
	<table>
		<tr>
			<th class="title">이름</th>
			<td><%= name %></td>
		</tr>
		<tr>
			<th class="title">이메일</th>
			<td><%= email %></td>
		</tr>
		<tr>
			<th class="title">나이</th>
			<td><%= age %></td>
		</tr>
		<tr>
			<th class="title">주소</th>
			<td><%= addr %></td>
		</tr>
		<tr>
			<th class="title">성별</th>
			<td><%= gender %></td>
		</tr>
		<tr>
			<th class="title">취미</th>
			<td>
			<% for (int i=0; i<hobby.length; i++) {
					if (hobby.length > 1 && i != hobby.length-1) {
						out.print(hobby[i] + ", ");
					} else out.print(hobby[i]);
			%>
			<%	} %>
			<!-- 아니면   <%-- <% Arrays.toString(hobby) %> --%> 사용 -->
			</td>
		</tr>
	</table>
	</div>
</body>
</html>