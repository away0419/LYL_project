<%@page import="src.subscribe.subscribeVO"%>
<%@page import="src.myuser.MyuserService"%>
<%@page import="src.subscribe.subscribeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = request.getParameter("userNo");
	String userNo2 = request.getParameter("userNo2");
	subscribeService subService = new subscribeService();
	MyuserService usv = new MyuserService();
	int cnt = subService.subscribe(userNo2, userNo);
	
	int cnt2 = usv.updateSubCnt(Integer.parseInt(userNo2), 0);
%>
{"cnt" : <%=cnt %>}
