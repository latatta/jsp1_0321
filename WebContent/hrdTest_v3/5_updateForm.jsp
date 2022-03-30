<%@page import="vo.HrdMember"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 화면</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<script src="member_valid.js"></script>
<script type="text/javascript">
	alert(`회원번호 : ${member.custNo}`);
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
	// HrdMember member =  (HrdMember) request.getAttribute("member");
/* 	if (member == null) {
		out.print("<script>alert('검색값이 없습니다.');location.href = 'get_test.jsp;");
		out.print("</script>");
	}	// else가 없으면 처리순서 : html 태그로 랜더링을 하고 out.print 자바코드 실행 */
	%>
	<div class="wrap_container">
		<header>
			<h3>쇼핑몰 회원관리 ver1.0</h3>
		</header>
		<!-- Dao 클래스에 insert() 메소드 만듭니다. - 지금 이 화면을 등록화면에 맞게 수정하세요.
		 - member_insert.js를 구현하세요.(사용자 입력값으로 db테이블에 insert하기)  -->
		<%@include file="top.jsp" %>
		<section
			style="height: 500px; background-color: rgb(211, 211, 211); padding-top: 10px;">

			<h4 style="text-align: center;">홈쇼핑 회원 수정</h4>
			<form action="6_updateSave.jsp" method="post">
				<!-- action 설정된 url 로 입력요소에 작성된 데이터를 서버로 전송. 
            form 태그 속성 method="post" 있을때 와 없을 때 차이점이 있습니다.-> 백엔드 배우고 확인.
        -->

				<!-- 화면에 표시하지 않고 입력요소로 전달하고 싶을 때 type="hidden" -->
				<input type="hidden" name="num" value="${member.custNo }">
				<!-- hidden 추가 대신 사용할 다른 방법은 회원번호 input의 readonly="readonly" 입니다. -->
				<table style="width: 70%; margin: auto;">
					<tr>
						<td class="col1_title">회원번호(자동발생)</td>
						<td><input type="text" name="num"
							value="${member.custNo}" disabled="disabled"></td>
						<!-- 입력요소 데이터 식별하는 속성은 name -->
					</tr>
					<tr>
						<td class="col1_title">회원성명</td>
						<td><input type="text" name="name"
							value="${member.custName }" disabled="disabled"></td>
						<!-- required="required" 를 간단히 표현 -->
					</tr>
					<tr>
						<td class="col1_title">회원전화</td>
						<td><input type="text" name="tel" size="30"
							value="${member.phone }"></td>
					</tr>
					<tr>
						<td class="col1_title">회원주소</td>
						<td><input type="text" name="addr" size="40"
							value="${member.addr }"></td>
					</tr>
					<tr>
						<td class="col1_title">가입일자</td>
						<td><input type="text" name="reg_date"
							value="${member.joinDate }" disabled="disabled"></td>
					</tr>
					<tr>
						<td class="col1_title">고객등급[A:VIP,B:일반,C:직원]</td>
						<td><input type="text" name="grade"
							value="${member.grade }" disabled="disabled"></td>
					</tr>
					<tr>
						<td class="col1_title">도시코드</td>
						<td><input type="text" name="city_code"
							value="${member.city }"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<!-- <button type="submit" >저장</button> -->
							<button type="button" onclick="isSubmit()">저장</button>
							<button type="reset">다시쓰기</button> <!-- 다시쓰기는 input 태그에 value 속성값을 초기값으로 되돌리는 것입니다.
						 일반적으로 type='reset'기능 사용보다는 선택적인 초기값으로 되돌리는
						 자바스크립트 함수로 합니다.
                        -->
						</td>
					</tr>

				</table>
			</form>
		</section>
		<footer> HRDKOREA Copyright©2016 All rights reserved. Human
			Resources development Service of Korea. </footer>
	</div>
</body>
</html>