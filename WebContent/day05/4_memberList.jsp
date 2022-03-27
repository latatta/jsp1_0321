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
	<%
		String find = request.getParameter("search_name");
	HrdMember vo = new HrdMember();
	HrdMemberDao dao = HrdMemberDao.getInstance();
	List<HrdMember> list = null;

	if (find == null || find.length() == 0)
		list = dao.selectAll(); // 전체리스트		
	else // 파라미터 있을때
		list = dao.searchName(find); // 이름으로 조회한 리스트
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
			<h3 style="text-align: center;">회원목록조회/수정</h3>
			<!-- action url을 현재 url과 같게 했습니다. -->
			<div>
				<form action="4_memberList.jsp">
					<select>
						<option>이름</option>
						<option>주소</option>
						<option>고객등급</option>
						<option>거주지역</option>
					</select> <input name="search_name" placeholder="검색할 이름 입력">
					<button>검색</button>
					<button type="button" onclick="location.href='4_memberList.jsp'">전체보기</button>
				</form>
			</div>
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
					// dao에서 ArrayList 객체는 생성되어있고 조회결과가 없으면 리스트에 저장된 데이터가 없습니다.
				//	(list.size()가 0)
				if (list.size() != 0) {
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><a
						href="5_updateForm.jsp?custno=<%=list.get(i).getCustNo()%>"><%=list.get(i).getCustNo()%></a></td>
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
				} else {
				%>
				<tr>
					<td colspan="7">조회결과가 없습니다.</td>
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