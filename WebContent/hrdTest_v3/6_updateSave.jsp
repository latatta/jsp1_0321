<%@page import="dao.HrdMemberDao"%>
<%@page import="vo.HrdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String phone = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String city = request.getParameter("city_code");
		int custno = Integer.parseInt(request.getParameter("num"));
		
		HrdMember vo = new HrdMember();
		vo.setPhone(phone);
		vo.setAddr(addr);
		vo.setCity(city);
		vo.setCustNo(custno);
		
		HrdMemberDao dao = HrdMemberDao.getInstance();
		dao.update(vo);
		out.print("<script>alert('회원수정이 완료되었습니다.'); location.href='4_memberList.jsp'");
		out.print("</script>");
		
	%> 
<!-- 회원정보 수정이 완료되면 1_index.jsp로 이동 -->
</body>
</html>