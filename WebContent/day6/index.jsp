<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="a.jsp">a.jsp url ��û</a><br>
	<a href="b.jsp">b.jsp url ��û</a><br>
	<a href="forward_test.jsp">forward_test.jsp url ��û</a><br>
	<a href="forward_test.jsp?name=momo">forward_test.jsp url ��û</a>
	<%
		session.setAttribute("sdata", "sana");		// session ��ü�� ��Ʈ����Ʈ ������ ����
		application.setAttribute("adata", "����");
	%>
</body>
</html>