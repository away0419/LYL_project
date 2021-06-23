<%@page import="commentlike.CommentLikeService"%>
<%@page import="src.myuser.MyuserService"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="vidcomment.VidCommentService"%>
<%@page import="vidcomment.VidCommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String vidComCnt = request.getParameter("vidComCnt");
	String vidNo = request.getParameter("vidNo");
	String vidGroup = request.getParameter("vidGroup");
	String loginUserNo = request.getParameter("loginUserNo");
	VidCommentService sv = new VidCommentService();
	List<VidCommentVO> list = sv.sellectComment(Integer.parseInt(vidNo), Integer.parseInt(vidComCnt), Integer.parseInt(vidGroup));
	MyuserService msv = new MyuserService();
	CommentLikeService clsv= new CommentLikeService();
	

%>{ 
	"comList" : [
	<%for(int i =0; i<list.size();i++){
		VidCommentVO vo = list.get(i);
		int comLikeCheck=0;
		if(!loginUserNo.isEmpty() && loginUserNo!=null){
			int cnt = clsv.selectByUserNo(vo.getComNo(), Integer.parseInt(loginUserNo));
			if(cnt>0){
				comLikeCheck=1;
			}
		}
		String userno=String.valueOf(vo.getUserNo());
		MyuserVO mvo = msv.selectByUserNo(userno); 
	%>
	
	{"comLikeCheck" : "<%=comLikeCheck %>", "comUserNo" : "<%=vo.getUserNo() %>", "comNo" : "<%=vo.getComNo() %>", "comId" : "<%=mvo.getUserId() %>", "comCon" : "<%=vo.getComCon() %>", "comLike" : "<%=vo.getComLike() %>", "comRe" : "<%=vo.getComRe() %>"}<%if(i<list.size()-1){ %>,<%} %> 
		
	<%}
%>],"comListSize":<%=list.size()%>}<%

%>