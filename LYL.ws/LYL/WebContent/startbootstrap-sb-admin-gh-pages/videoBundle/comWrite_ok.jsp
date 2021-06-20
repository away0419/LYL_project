<%@page import="vidcomment.VidCommentService"%>
<%@page import="vidcomment.VidCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	VidCommentVO vvo= new VidCommentVO();
	VidCommentService vsv= new VidCommentService();
	
	String userNo =request.getParameter("userNo");
	String vidNo =request.getParameter("vidNo");
	String comCon =request.getParameter("comCon");
	String comGroup = request.getParameter("comGroup");
	
	vvo.setComCon(comCon);
	vvo.setUserNo(Integer.parseInt(userNo));
	vvo.setVidNo(Integer.parseInt(vidNo));
	vvo.setComGroup(Integer.parseInt(comGroup));
	
	int cnt = vsv.insertComment(vvo);
			
%>