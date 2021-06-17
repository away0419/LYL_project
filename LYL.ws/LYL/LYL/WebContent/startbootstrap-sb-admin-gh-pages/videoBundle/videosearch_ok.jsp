<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@page import="vidcomment.VidCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String vidTitle = request.getParameter("vidTitle");
	String vidCnt = request.getParameter("vidCnt");
	VideoService sv = new VideoService();
	List<VideoVO> list = sv.videoSearch(vidTitle, Integer.parseInt(vidCnt));

%>{ 
	"vidList" : [
	<%for(int i =0; i<list.size();i++){
		VideoVO vo = list.get(i);
		String title= vo.getVidTitle();
		if(title.length()>15){
			title=title.substring(0, 15);
			title+="...";
		}
	%>
	
	{"vidNo" : "<%=vo.getVidNo() %>", "vidImg" : "<%=vo.getVidThu() %>", "vidTitle" : "<%=title %>", "vidUserNo" : "<%=vo.getUserNo() %>", "vidHits" : "<%=vo.getVidHits() %>"}<%if(i<list.size()-1){ %>,<%} %> 
		
	<%}
%>],"vidListSize":<%=list.size()%> }<%

%>