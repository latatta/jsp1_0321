<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- ���(view) -->
	<h3>��û C.jsp</h3>
	<hr>
	<ul>
		<!-- C.jsp�� ��� : request ����� c.jsp �Դϴ�.
			�������� url �ּ�â�� forward_test.jsp�� ǥ�õ˴ϴ�. -->
		<li>��û URL : <%= request.getRequestURL() %></li> <!-- L��ġ(�ּ�) --> 
		<li>��û URI : <%= request.getRequestURI() %></li> <!-- U���� R���ҽ�(�ڿ�) I�ĺ��� -->
		<!-- ���� forward_test.jsp�� ��Ʈ����Ʈ�� �Ķ���Ͱ� ���޵˴ϴ�. -->
		<li>data �̸��� ��Ʈ����Ʈ : <%= request.getAttribute("data") %></li>
		<li>name �̸��� ��Ʈ����Ʈ : <%= request.getParameter("name") %></li>
	</ul>
</body>
</html>