<%@page import="src.myuser.MyuserService"%>
<%@page import="src.subscribe.subscribeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = request.getParameter("userNo");
	String userNo2 = request.getParameter("userNo2");
	subscribeService subService = new subscribeService();
	MyuserService msv = new MyuserService();
	int cnt = subService.dissubscribe(userNo, userNo2);
	int cnt2 = msv.updateSubCnt(Integer.parseInt(userNo), 1);
%>
{"cnt" : <%=cnt %>}
