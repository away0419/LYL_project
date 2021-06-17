<%@page import="src.watchrecord.watchrecordService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = request.getParameter("userNo");
	String vidNo = request.getParameter("vidNo");
	watchrecordService watService = new watchrecordService();
	int cnt = watService.insertWatchrecord(userNo, vidNo);
%>
{
"cnt" : <%=cnt %>

}
