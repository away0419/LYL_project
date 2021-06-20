<%@page import="src.aftervideo.aftervideoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = request.getParameter("userNo");
	String vidNo = request.getParameter("vidNo");
	aftervideoService afService = new aftervideoService();
	int cnt = afService.deleteAftervideo(vidNo, userNo);
	
%>
{
"cnt" : <%=cnt %>

}
    