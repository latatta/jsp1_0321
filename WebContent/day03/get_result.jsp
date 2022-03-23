<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3 get 요청 처리</title>
</head>
<body>
	<% 
		String custNo = request.getParameter("custno");
		out.print("custNo : " );
		out.print(custNo);
	%>
</body>
</html>