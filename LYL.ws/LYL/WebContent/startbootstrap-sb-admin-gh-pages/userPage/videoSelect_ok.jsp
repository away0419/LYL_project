<%@page import="src.aftervideo.aftervideoVO"%>
<%@page import="src.aftervideo.aftervideoService"%>
<%@page import="src.watchrecord.watchrecordService"%>
<%@page import="src.watchrecord.watchrecordVO"%>
<%@page import="java.util.ArrayList"%>
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
	String userNo = request.getParameter("userNo");
	String vidCnt = request.getParameter("vidCnt");
	String pageCheck = request.getParameter("pageCheck");
	VideoService sv = new VideoService();
	List<VideoVO> list = new ArrayList<>();
	DecimalFormat df = new DecimalFormat("#,###.#");
	MyuserService msv = new MyuserService();

	if(pageCheck.equals("0")){
		watchrecordService wrsv = new watchrecordService();
		List<watchrecordVO> watchList = new ArrayList<>();
		watchList=wrsv.selectAllByUserNo(userNo, Integer.parseInt(vidCnt));
		for(int i=0; i<watchList.size();i++){
			watchrecordVO wrvo = watchList.get(i);
			VideoVO vvo= sv.videoSelect(String.valueOf(wrvo.getVidNo()));
			list.add(vvo);
		}
	}else{
		aftervideoService avsv = new aftervideoService();
		List<aftervideoVO> afterList = new ArrayList<>();
		afterList=avsv.selectAllByUserNo(String.valueOf(userNo), Integer.parseInt(vidCnt));
		
		for(int i=0; i<afterList.size();i++){
			aftervideoVO avvo = afterList.get(i);
			VideoVO vvo= sv.videoSelect(String.valueOf(avvo.getVidNo()));
			list.add(vvo);
		}
	}
%>{ 
	"vidList" : [
	<%for(int i =0; i<list.size();i++){
		VideoVO vo = list.get(i);
		String title= vo.getVidTitle();
		/* if(title.length()>15){
			title=title.substring(0, 15);
			title+="...";
		} */
		
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