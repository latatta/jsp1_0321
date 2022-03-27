<%@page import="java.util.List"%>
<%@page import="dao.HrdSaleDao"%>
<%@page import="day02.vo.SaleSum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출조회</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
	<%
		SaleSum vo = new SaleSum();
	HrdSaleDao dao = HrdSaleDao.getInstance();
	List<SaleSum> list = dao.selectSale();
	%>
	<div class="wrap_container">
		<header>
			<h3>쇼핑몰 회원관리 ver1.0</h3>
		</header>
		<nav>
			<ul class="container">
				<li><a href="2_insertForm.jsp">회원등록</a></li>
				<li><a href="4_memberList.jsp">회원목록조회/수정</a></li>
				<li><a href="7_saleList.jsp">회원매출조회</a></li>
				<li><a href="1_index.jsp">홈으로</a></li>
			</ul>
		</nav>
		<section
			style="height: 500px; background-color: rgb(211, 211, 211); padding-top: 10px;">
			<h3 style="text-align: center;">회원매출조회</h3>
			<table style="margin: auto;">
				<tr>
					<th>회원번호</th>
					<th>회원이름</th>
					<th>등급</th>
					<th>매출</th>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getCustNo()%></td>
					<td><%=list.get(i).getCustName()%></td>
					<td><%=list.get(i).getGrade()%></td>
					<td><%=list.get(i).getSum()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</section>
	</div>
</body>
</html>