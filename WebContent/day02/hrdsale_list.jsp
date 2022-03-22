<%@page import="day02.vo.SaleSum"%>
<%@page import="java.util.List"%>
<%@page import="day02.dao.HrdProblemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hrd sale list</title>
</head>
<body>
<ul>
<% 
	HrdProblemDao dao = HrdProblemDao.getHrdProblemDao();
	List<SaleSum> list = dao.selectSale();
	for (int i=0; i<list.size(); i++) {
		/* out.print(list.get(i));		// 테스트용
		out.print("<br>"); */			// 테스트용
%>
		<li><%= list.get(i).getCustNo() %></li>
		<li><%= list.get(i).getCustName() %></li>
		<li><%= list.get(i).getGrade() %></li>
		<li style = "padding-botton: 20px"><%= list.get(i).getSum() %></li>
	
<%
	}
	out.print("<script>alert('조회가 완료되었습니다.')");
	out.print("</script>");
%>
</ul>
</body>
</html>