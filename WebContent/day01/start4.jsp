<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day01.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp start4</title>
<style type="text/css">
td {
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<%
		List<MyUser> list = new ArrayList<>();
	MyUser sana = new MyUser("이사나", 24, "서울시 강남구 역삼동"); // 데이터 객체 생성
	list.add(sana);
	list.add(new MyUser("정연", 19, "서울시 종로구"));
	list.add(new MyUser("모모", 25, "경기도 성남시"));
	list.add(new MyUser("나연", 17, "서울시 용산구"));
	%>
	<table style="width: 70%; margin: auto; border-collapse: collapse;">
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>거주지</th>
			<th>비고</th>
		</tr>
		<!-- 아래 1행 한명의 MyUser 객체 출력을 list 크기만큼 반복합니다. -->
		<% for (MyUser user : list){	%>
			<tr>
				<td><%= user.getName() %></td>
				<td><%= user.getAge() %></td>
				<td><%= user.getAddress() %></td>
				<td>
					<%
						if(user.getAge()<20) out.print("청소년");
					%>
			</tr>
		<%	}	%>
	
	</table>
</body>
</html>