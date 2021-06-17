<%@page import="java.text.DecimalFormat"%>
<%@page import="theme.ThemeService"%>
<%@page import="javax.swing.text.DefaultEditorKit.InsertBreakAction"%>
<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@page import="vidcomment.VidCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String scThNum = request.getParameter("scThNum");
	VideoService sv = new VideoService();
	ThemeService tsv = new ThemeService();
	List<VideoVO> list = sv.videoThemaList(Integer.parseInt(scThNum));
	String themeName = tsv.themeName(Integer.parseInt(scThNum));
	DecimalFormat df = new DecimalFormat("#,###.#");
			

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
		
		if(vo.getVidHits()<10000){
			svidHits=df.format(vo.getVidHits())+"회";
		}
		else if(vo.getVidHits()<100000000){
			int ihits = vo.getVidHits()/1000;
			float fhits= ihits/10.f;
			svidHits=df.format(fhits)+"만회";
		}
			
	%>
	
	{"vidNo" : "<%=vo.getVidNo() %>", "vidImg" : "<%=vo.getVidThu() %>", "vidTitle" : "<%=title %>", "vidUserNo" : "<%=vo.getUserNo() %>", "vidHits" : "<%=svidHits %>"}<%if(i<list.size()-1){ %>,<%} %> 
		
	<%}
%>],"vidListSize":<%=list.size()%>, "themeName" : "<%=themeName %>" }<%

%>