<%@page import="dao.HrdMemberDao"%>
<%@page import="vo.HrdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		// phone, address, city 입력값 가져오기 와 update 조건값 custno도 가져오기
		String phone = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String city = request.getParameter("city_code");
		int custno = Integer.parseInt(request.getParameter("num"));
		
		HrdMember vo = new HrdMember();
		vo.setAddr(addr);
		vo.setPhone(phone);
		vo.setCity(city);
		vo.setCustNo(custno);
		out.print(vo);
	%>
	<br>
	<%
		HrdMemberDao dao = HrdMemberDao.getInstance();
		dao.update(vo);		// 업데이트
		out.print(dao.selectOne(custno));		// 또는 조회해서 출력
	%>
</body>
</html>