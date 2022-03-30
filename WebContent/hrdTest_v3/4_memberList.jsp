<%@page import="java.util.List"%>
<%@page import="dao.HrdMemberDao"%>
<%@page import="vo.HrdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>

<body>
	<div class="wrap_container">
		<header>
			<h3>쇼핑몰 회원관리 ver1.0</h3>
		</header>
		<%@include file="top.jsp" %>
		<section
			style="height: 500px; background-color: rgb(211, 211, 211); padding-top: 10px;">
			<h3 style="text-align: center;">회원목록조회/수정</h3>
			<table style="margin: auto;">
				<tr>
					<!-- 첫번째 행 : 제목행 (자동으로 가운데 정렬)-->
					<th style="width: 10%;">번호</th>
					<!-- 4개의 칸(열) -->
					<th style="width: 20%;">이름</th>
					<th style="width: 30%;">연락처</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
				<%
					// 테이블의 데이터 모두 가져오기
				Object temp2 = request.getAttribute("list");
				List<HrdMember> list = (List<HrdMember>) temp2;

				%>
				
				<%
				for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><a
						href="update.jsp?custno=<%=list.get(i).getCustNo()%>"><%=list.get(i).getCustNo()%></a></td>
					<td><%=list.get(i).getCustName()%></td>
					<td><%=list.get(i).getPhone()%></td>
					<td><%=list.get(i).getAddr()%></td>
					<td><%=list.get(i).getJoinDate()%></td>
					<td>
						<%
							String temp = list.get(i).getGrade();
						switch (temp) {
						case "A":
							out.print("VIP");
							break;
						case "B":
							out.print("일반");
							break;
						case "C":
							out.print("직원");
							break;
						}
						%>
					</td>
					<td><%=list.get(i).getCity()%></td>
				</tr>
				<%
					}
				%>

			</table>
		</section>
		<footer> HRDKOREA Copyright©2016 All rights reserved. Human
			Resources development Service of Korea. </footer>
	</div>
</body>

</html>