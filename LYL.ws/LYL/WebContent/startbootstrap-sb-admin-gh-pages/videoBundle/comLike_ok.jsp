<%@page import="commentlike.CommentLikeService"%>
<%@page import="vidcomment.VidCommentService"%>
<%@page import="vidcomment.VidCommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommentLikeService clsv= new CommentLikeService();
	VidCommentService vcsv = new VidCommentService();
	
	String userNo =request.getParameter("userNo");
	String comNo =request.getParameter("comNo");
	int likecheck=0;
	int cno=Integer.parseInt(comNo);
	int uno=Integer.parseInt(userNo);
	
	int cnt= clsv.selectByUserNo(cno, uno);
	
	if(cnt>0){
		clsv.deleteLike(cno, uno);
		vcsv.updateLikeCnt(cno, 1);
	}else{
		clsv.insertLike(cno, uno);
		vcsv.updateLikeCnt(cno, 0);
		likecheck=1;
	}

%>
{
	"likecheck" : <%=likecheck %>
}