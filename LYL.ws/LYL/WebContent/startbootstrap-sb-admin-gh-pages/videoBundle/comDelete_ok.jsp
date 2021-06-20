<%@page import="vidcomment.VidCommentService"%>
<%@page import="vidcomment.VidCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	VidCommentVO vvo= new VidCommentVO();
	VidCommentService vsv= new VidCommentService();
	
	String comGroup = request.getParameter("comGroup");
	if(!comGroup.isEmpty() && comGroup!=null){
		int cnt = vsv.deleteComment(Integer.parseInt(comGroup));
	}
%>