<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>요청 a.jsp</h3>
	<hr>
	<ul>
		<li>요청 URL : <%= request.getRequestURL() %></li> <!-- L위치(주소) --> 
		<li>요청 URI : <%= request.getRequestURI() %></li> <!-- U통합 R리소스(자원) I식별자 -->
		<li>session 애트리뷰트 sdata : <%= session.getAttribute("sdata") %></li>
		<!-- 실행 순서 : A.jsp에서 ctrl + f11 확인
					그 다음에 index.jsp 실행 후 요청링크로 a.jsp로 이동하여 확인 -->
		<li>application 애트리뷰트 adata : <%= application.getAttribute("adata") %></li>
	</ul>
</body>
</html>