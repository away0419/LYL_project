<%@page import="vidcomment.VidCommentService"%>
<%@page import="vidcomment.VidCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
VidCommentVO vvo= new VidCommentVO();
	VidCommentService vsv= new VidCommentService();
	
	String comCheck = request.getParameter("comCheck");
	String comGroup = request.getParameter("comGroup");
	String parentComNo = request.getParameter("parentComNo");
	
	if (!comGroup.isEmpty() && comGroup != null) {
		int cnt = vsv.deleteComment(Integer.parseInt(comGroup));

		if (Integer.parseInt(comCheck) != 0) {
			int cnt2 = vsv.updateCommentCnt(Integer.parseInt(parentComNo), 1);
		}
	}
%>