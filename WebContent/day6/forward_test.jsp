<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		// �������� �κ��� �ڵ��մϴ�.
		// -> ��� �����͸� ��Ʈ����Ʈ�� �����մϴ�.
		request.setAttribute("data", "abc");		// data��  �̸����� "abc" ����
		
		// forward_test.jsp url�� ��û�� ������ C.jsp�� �����մϴ�.
		pageContext.forward("c.jsp");	// ����ڸ� ���� ���ȭ���Դϴ�.
		// context : ����
	%>
</body>
</html>