<%@page import="javax.mail.search.IntegerComparisonTerm"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="src.myuser.MyuserService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@page import="vidcomment.VidCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String vidCnt = request.getParameter("vidCnt");
	VideoService sv = new VideoService();
	List<VideoVO> list = sv.videoSelectByUserId(Integer.parseInt(userId),Integer.parseInt(vidCnt));
	DecimalFormat df = new DecimalFormat("#,###.#");
	MyuserService msv = new MyuserService();

%>{ 
	"vidList" : [
	<%for(int i =0; i<list.size();i++){
		VideoVO vo = list.get(i);
		String title= vo.getVidTitle();
		if(title.length()>15){
			title=title.substring(0, 15);
			title+="...";
		} 
		
		String svidHits="";
		long hits= vo.getVidHits();		
		if(hits>=100000000){
			hits/= 10000000;
			float fhits= hits/10.f;
			svidHits=df.format(fhits)+"억회";
		}
		else if(hits>=10000){
			hits /=1000;
			float fhits= hits/10.f;
			svidHits=df.format(fhits)+"만회";
		}else{
			svidHits=df.format(hits)+"회";
		}
		
		String userno=String.valueOf(vo.getUserNo());
		MyuserVO mvo = msv.selectMyuserByVidNo(userno);
	%>
	
	{"vidNo" : "<%=vo.getVidNo() %>", "vidImg" : "<%=vo.getVidThu() %>", "vidTitle" : "<%=title %>", "vidUserId" : "<%=mvo.getUserId() %>", "vidHits" : "<%=svidHits%>"}<%if(i<list.size()-1){ %>,<%} %> 
		
	<%}
%>],"vidListSize":<%=list.size()%> }<%

%>