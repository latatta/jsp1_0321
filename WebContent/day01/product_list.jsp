<%@page import="java.time.LocalDate"%>
<%@page import="day01.Product"%>
<%@page import="java.util.List"%>
<%@page import="day01.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style type="text/css">
td {
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<% 
	ProductDao dao = ProductDao.getProductDao(); 
	List<Product> list= dao.selectAll();
	%>
	<h3>TBL_Product# 테이블 데이터</h3>
	<table  style="width: 70%; margin: auto; border-collapse: collapse;">
	<caption>현재 시간 : <%= LocalDate.now()  %></caption>
	<tr>
		<th>PCODE</th>
		<th>카테고리</th>
		<th>제품명</th>
		<th>가격</th>
	</tr>
	<% for (Product product : list) { %>
		<tr>
			<td><%= product.getPcode() %></td>
			<td><%= product.getCategory() %></td>
			<td><%= product.getPname() %></td>
			<td><%= product.getPrice() %></td>
		</tr>
	<% } %>
	</table>
</body>
</html>