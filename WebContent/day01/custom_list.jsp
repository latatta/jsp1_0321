<%@page import="day01.CustomDao"%>
<%@page import="java.time.LocalDate"%>
<%@page import="day01.Custom"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day01.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom Information</title>
<style type="text/css">
td {
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<% 
	CustomDao dao = CustomDao.getCustomDao();
	List<Custom> list = dao.selectAll();	
	%>
	<h3>TBL_Custom# 테이블 데이터</h3>
	<table style="width: 70%; margin: auto; border-collapse: collapse;">
	<caption>현재 시간 : <%= LocalDate.now()  %></caption>
		<tr>
			<th>회원ID</th>
			<th>회원이름</th>
			<th>이메일</th>
			<th>나이</th>
		</tr>
		<!-- 아래 1행 한명의 MyUser 객체 출력을 list 크기만큼 반복합니다. -->
		<% for (int i=0; i<list.size(); i++){	
			Custom custom = list.get(i);	%>
			<tr>
				<td><%= custom.getCustom_id() %></td>
				<td><%= custom.getName() %></td>
				<td><%= custom.getEmail() %></td>
				<td><%= custom.getAge() %></td>
			</tr>
		<%	}	%>
	
	</table>
</body>
</html>