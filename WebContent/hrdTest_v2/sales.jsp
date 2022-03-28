<%@page import="day02.vo.SaleSum"%>
<%@page import="java.util.List"%>
<%@page import="dao.HrdSaleDao"%>
<%@page import="dao.HrdMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HrdSaleDao dao = HrdSaleDao.getInstance();
	List<SaleSum> list = dao.selectSale();
	
	request.setAttribute("list", list);
	pageContext.forward("7_saleList.jsp"); // 사용자 뷰
%>