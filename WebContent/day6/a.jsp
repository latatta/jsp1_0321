<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>��û a.jsp</h3>
	<hr>
	<ul>
		<li>��û URL : <%= request.getRequestURL() %></li> <!-- L��ġ(�ּ�) --> 
		<li>��û URI : <%= request.getRequestURI() %></li> <!-- U���� R���ҽ�(�ڿ�) I�ĺ��� -->
		<li>session ��Ʈ����Ʈ sdata : <%= session.getAttribute("sdata") %></li>
		<!-- ���� ���� : A.jsp���� ctrl + f11 Ȯ��
					�� ������ index.jsp ���� �� ��û��ũ�� a.jsp�� �̵��Ͽ� Ȯ�� -->
		<li>application ��Ʈ����Ʈ adata : <%= application.getAttribute("adata") %></li>
	</ul>
</body>
</html>