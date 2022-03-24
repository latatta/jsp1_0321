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
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String phone = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String grade = request.getParameter("grade");
		String city_code = request.getParameter("city_code");
		
		HrdMember vo = new HrdMember(num, name, phone, addr, null, grade, city_code);
		HrdMemberDao dao = HrdMemberDao.getInstance();
		dao.update(vo);
		out.print("<script>alert('회원수정이 완료되었습니다.'); location.href='5_updateForm.jsp';");
		out.print("</script>");
		
		
	%> 
<!-- 회원정보 수정이 완료되면 1_index.jsp로 이동 -->
</body>
</html>