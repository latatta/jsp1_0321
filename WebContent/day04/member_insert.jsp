<%@page import="vo.HrdMember"%>
<%@page import="dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day4 get 요청 처리</title>
<style>
td, th {
	border: 1px dotted gray;
}

td.col1_title {
	text-align: center;
	font-weight: bold;
	width: 40%;
	padding: 7px;
}

input[type=text] {
	padding: 5px;
	margin-left: 10px;
}

button {
	padding: 5px 15px;
	margin: 5px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		// phone, address, city 입력값 가져오기 와 update 조건값 custno도 가져오기
		String name = request.getParameter("name");
		String phone = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String city = request.getParameter("city_code");
		int custno = Integer.parseInt(request.getParameter("num"));
		String grade = request.getParameter("grade");
		
		HrdMember vo = new HrdMember(custno, name, phone, addr, null, grade, city);
		HrdMemberDao dao = HrdMemberDao.getInstance();
		dao.insert(vo);
		
		if (dao.selectOne(vo.getCustNo()) != null) {
			out.print("<script>alert('회원등록 완료했습니다.');location.href='post_insert.jsp';");
			out.print("</script>");
			
		}
	%>
</body>
</html>