<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="a.jsp">a.jsp url 요청</a><br>
	<a href="b.jsp">b.jsp url 요청</a><br>
	<a href="forward_test.jsp">forward_test.jsp url 요청</a><br>
	<a href="forward_test.jsp?name=momo">forward_test.jsp url 요청</a>
	<%
		session.setAttribute("sdata", "sana");		// session 객체에 애트리뷰트 데이터 저장
		application.setAttribute("adata", "나연");
	%>
</body>
</html>