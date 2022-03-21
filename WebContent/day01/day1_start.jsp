<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- page 지시자 : 스크립트릿 실행과 관련된 정보를 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day1_jsp start</title>
</head>
<body>
	<%
		// 2) 스크립트릿 : html 문서 안에서 자바코드가 작성되는 부분
	String[] names = { "박세리", "허재", "김연경", "안정환" };
	for (int i = 0; i < names.length; i++) {
		out.print(names[i]);		//	out은 
		out.print("<br>");
		out.print("<li>");
		out.print(names[i]);
		out.print("</li>");
	}
	%>
</body>
<!-- JSP 파일에 사용되는 기호 : 지시자, 스크립트릿(scriptlet), 표현식(변수, 계산식, 메소드 등)
						결과값을 구하는 명령문) 등 3가지를 기억합시다. -->
</html>