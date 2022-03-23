<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form_test.html에서 사용자가 데이터 입력 후 submit 실행하면 url :
		 http://localhost:8081/jsp_1/day03/request_test.jsp 입니다.
		 query string이 없습니다. (개발자도구 f12 - 네트워크 탭 - ctrl+r - url 선택 - payload - form data)
		 
		 form태그에서 method 설정이 없으면 기본이 'get' : 쿼리스트링으로 입력값 전달(데이터 조회할 때 사용)
		 							사용자 요청의 url 인코딩은 기본이 utf-8
		 							url에 사용자 입력값이 보입니다.
		 							form태그 사용 외에도 a태그 href 속성값에 url로 전달할 수 있습니다.
		 			method='post'로 하면 : form data로 입력값 전달(데이터 저장)
		 							이때 form data 인코딩은 직접 설정이 필요합니다.
		 							url에 사용자 입력값이 없습니다.
		 					day2의 memberReg.html의 method는 'post'로 합니다.
	 -->
	 <%
	 	request.setCharacterEncoding("UTF-8");		// method='post' 에서는 꼭 필요
	 	String data1 = request.getParameter("data1");
	 	String data2 = request.getParameter("data2");
	 	String data3 = request.getParameter("data3");
	 	
	 	out.print("사용자 입력값 출력 테스트");	/* out도 jsp의 내장객체입니다. */
	 	out.print("<br>data1 = ");
	 	out.print(data1);
	 	out.print("<br>data2 = ");
	 	out.print(data2);
	 	out.print("<br>data3 = ");
	 	out.print(data3);	/* post_test.html 입력요소 중에 name이 'data3'이 없습니다. -> null */
	 		 	
	 	/* 결론 : 사용자 입력오류를 제거하기 위해
	 			1) 프론트단에서 자바스크립트로 유효성 검사 - 주 해결방법
				2) 서버단에서 try~catch로 처리 */

	 %>
</body>
</html>