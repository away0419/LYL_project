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
	VidCommentService sv = new VidCommentService();
	List<VidCommentVO> list = sv.sellectComment(Integer.parseInt(vidNo), Integer.parseInt(vidComCnt), 0);
	MyuserService msv = new MyuserService();

%>{ 
	"comList" : [
	<%for(int i =0; i<list.size();i++){
		VidCommentVO vo = list.get(i);
		
		String userno=String.valueOf(vo.getUserNo());
		MyuserVO mvo = msv.selectMyuserByVidNo(userno);
	%>
	
	{"comNo" : "<%=vo.getComNo() %>", "comId" : "<%=mvo.getUserId() %>", "comCon" : "<%=vo.getComCon() %>", "comLike" : "<%=vo.getComLike() %>", "comRe" : "<%=vo.getComRe() %>"}<%if(i<list.size()-1){ %>,<%} %> 
		
	<%}
%>],"comListSize":<%=list.size()%> }<%

%>