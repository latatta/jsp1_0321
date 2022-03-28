<%@page import="dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HrdMemberDao dao = HrdMemberDao.getInstance();
int next = dao.getNextSeq();

request.setAttribute("next", next);
pageContext.forward("2_insertForm.jsp"); // 사용자 뷰
%>
