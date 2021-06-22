<%@page import="src.subscribe.subscribeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = request.getParameter("userNo");
	String userNo2 = request.getParameter("userNo2");
	subscribeService subService = new subscribeService();
	int cnt = subService.subscribe(userNo2, userNo);
%>
{"cnt" : <%=cnt %>}
