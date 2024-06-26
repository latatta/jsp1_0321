<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="vo.HrdMember"%>
<%@page import="dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day4 post 요청 처리</title>
<style>
td, th {
	border: 1px dotted gray;
}

td.col1_title {
	text-align: center;
	font-weight: bold;
	width: 40%;
	padding: 7px;
}

input[type=text] {
	padding: 5px;
	margin-left: 10px;
}

button {
	padding: 5px 15px;
	margin: 5px;
}
</style>
<!-- src 속성에 지정한 자바스크립트 소스가 그대로 삽입됩니다. -->
<script src="member_valid.js"></script>
<script type="text/javascript">
	
	function isSubmit() {
	const frm = document.forms[0];
		if (valid_check()) {
			frm.submit();
		}
	}
	
	function reset() {
		const frm = document.forms[0];
		frm.name.value = "";
		frm.tel.value = "";
		frm.addr.value = "";
		frm.grade.value = "";
		frm.city_code.value = "";
	}
</script>
</head>
<body>
	<%
		HrdMemberDao dao = HrdMemberDao.getInstance();
		int next = dao.getNextSeq();
		
		// 오늘날짜로 출력
		LocalDate today = LocalDate.now();		// 현재시간 가져오기
		String str_today = today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));	// 특정패턴 문자열로 변환
	%>	
	<!-- Dao 클래스에 insert() 메소드 만듭니다. - 지금 이 화면을 등록화면에 맞게 수정하세요.
		 - member_insert.js를 구현하세요.(사용자 입력값으로 db테이블에 insert하기)  -->
	<h4 style="text-align: center;">홈쇼핑 회원 등록</h4>
	<form action="member_insert.jsp" method="post">
		<!-- action 설정된 url 로 입력요소에 작성된 데이터를 서버로 전송. 
            form 태그 속성 method="post" 있을때 와 없을 때 차이점이 있습니다.-> 백엔드 배우고 확인.
        -->

		<!-- 화면에 표시하지 않고 입력요소로 전달하고 싶을 때 type="hidden" -->
		<input type="hidden" name="num" value= <%= next %>>
		<table style="width: 70%; margin: auto;">
			<tr>
				<td class="col1_title">회원번호(자동발생)</td>
				<td><input type="text" name="num" value=<%= next %> disabled="disabled"></td>
				<!-- 입력요소 데이터 식별하는 속성은 name -->
			</tr>
			<tr>
				<td class="col1_title">회원성명</td>
				<td><input type="text" name="name"></td>
				<!-- required="required" 를 간단히 표현 -->
			</tr>
			<tr>
				<td class="col1_title">회원전화</td>
				<td><input type="text" name="tel" size="30"></td>
			</tr>
			<tr>
				<td class="col1_title">회원주소</td>
				<td><input type="text" name="addr" size="40"></td>
			</tr>
			<tr>
				<td class="col1_title">가입일자</td>
				<td><input type="text" name="reg_date" disabled="disabled"></td>
			</tr>
			<tr>
				<td class="col1_title">고객등급[A:VIP,B:일반,C:직원]</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td class="col1_title">도시코드</td>
				<td><input type="text" name="city_code"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<!-- <button type="submit" >저장</button> -->
					<button type="button" onclick="isSubmit()">저장</button>
					<button type="button" onclick="reset()">다시쓰기</button> 
					<!-- 다시쓰기는 input 태그에 value 속성값을 초기값으로 되돌리는 것입니다.
						 일반적으로 type='reset'기능 사용보다는 선택적인 초기값으로 되돌리는
						 자바스크립트 함수로 합니다.
                        -->
				</td>
			</tr>

		</table>
	</form>
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