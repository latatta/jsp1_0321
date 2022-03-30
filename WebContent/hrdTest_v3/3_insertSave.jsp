<%@page import="dao.HrdMemberDao"%>
<%@page import="vo.HrdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String phone = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city_code");
		
		HrdMember vo = new HrdMember(num, name, phone, addr, null, grade, city);
		// dao의 insert에 날짜는 자동으로 오늘 날짜가 기입되므로 여기서는 null로 입력
		HrdMemberDao dao = HrdMemberDao.getInstance();
		dao.insert(vo);

		if (dao.selectOne(vo.getCustNo()) != null) {
			out.print("<script>alert('회원등록이 완료되었습니다.'); location.href='2_insertForm.jsp';");
			out.print("</script>");
		}
		
	%>

</body>
</html>