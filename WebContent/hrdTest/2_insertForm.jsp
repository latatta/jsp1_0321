<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<link rel="stylesheet" href="0_hrdkorea.css">
<script src="member_valid.js"></script>
<script type="text/javascript">
	function isSubmit() {
		const frm = document.forms[0];
		if (valid_check()) {
			frm.submit();
		}
	}
</script>
</head>
<body>
	<%
		HrdMemberDao dao = HrdMemberDao.getInstance();
		int next = dao.getNextSeq();
	%>
	<div class="wrap_container">
		<header>
			<h3>쇼핑몰 회원관리 ver1.0</h3>
		</header>
		<nav>
			<ul class="container">
				<li><a href="2_insertForm.jsp">회원등록</a></li>
				<li><a href="4_memberList.jsp">회원목록조회/수정</a></li>
				<li><a href="7_saleList">회원매출조회</a></li>
				<li><a href="1_index.jsp">홈으로</a></li>
			</ul>
		</nav>
		<section
			style="height: 500px; background-color: rgb(211, 211, 211); padding-top: 10px;">
			<h3 style="text-align: center;">홈쇼핑 회원 등록</h3>
			<form action="3_insertSave.jsp" method="post">
				<!-- action 설정된 url로 입력요소에 작성된 데이터를 서버로 전송
                 form 태그 속성 method="post" 있을때와 없을때 차이점이 있습니다. 
                 -> 백엔드 배우고 확인
            -->
				<input type="hidden" name="num" value=<%=next%>>
				<table style="width: 70%; margin: auto;">
					<tr>
						<td class="col_1">회원번호(자동발생)</td>
						<td><input type="text" name="num" value=<%=next%>
							disabled="disabled"></td>
						<!-- 입력요소 데이터를 식별하는 속성은 name -->
					</tr>
					<tr>
						<td class="col_1">회원성명</td>
						<td><input type="text" name="name"></td>
						<!-- required="required"를 간단히 표현 : required
                         반드시 적어야 하는 항목 설정 -->
					</tr>
					<tr>
						<td class="col_1">회원전화</td>
						<td><input type="text" name="tel"></td>
					</tr>
					<tr>
						<td class="col_1">회원주소</td>
						<td><input type="text" name="addr" size="40"></td>
					</tr>
					<tr>
						<td class="col_1">가입일자</td>
						<td><input type="text" name="reg_date" disabled="disabled"></td>
					</tr>
					<tr>
						<td class="col_1">고객등급[A:VIP, B:일반, C:직원]</td>
						<td><input type="text" name="grade"></td>
					</tr>
					<tr>
						<td class="col_1">도시코드</td>
						<td><input type="text" name="city_code"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" onclick="isSubmit()">등록</button>
							<button type="button" onclick="location.href='4_memberList.jsp'">조회</button>
							<!-- button으로 링크 또는 기능 설정하기
                             onclick 이벤트와 자바스크립트 명령을 이용합니다.
                             location.href는 a태그의 href속성설정과 같은 내용입니다.
                            -->
						</td>
					</tr>
				</table>
			</form>
		</section>
		<footer> HRDKOREA Copyright©2016 All rights reserved. Human
			Resources development Service of Korea. </footer>
	</div>
	<script type="text/javascript">
		const reg = document.forms[0].reg_date;
		const today = new Date();
		const year = today.getFullYear();
		const month = (today.getMonth() + 1).toString().padStart(2, 0);
		const day = today.getDate().toString().padStart(2, 0);
		reg.value = [ year, month, day ].join('');
	</script>
</body>

</html>