<%@page import="vidcomment.VidCommentService"%>
<%@page import="vidcomment.VidCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	VidCommentService vsv= new VidCommentService();

	String comCon =request.getParameter("comCon");
	String comNo = request.getParameter("comGroup");	
	
	int cnt = vsv.updateComment(comCon,Integer.parseInt(comNo));
			
%>