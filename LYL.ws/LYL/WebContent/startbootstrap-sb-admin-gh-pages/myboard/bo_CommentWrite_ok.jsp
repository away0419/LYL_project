<%@page import="java.sql.SQLException"%>
<%@page import="bocomment.BoCommentVO"%>
<%@page import="bocomment.BoCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1
	String comment=request.getParameter("comment");
	String bcPwd="0"; //-----
	String groupNo="2";//------
	String boNo=request.getParameter("boNo");
	String userNo="1";//------
	String userId="textComm";
	
	//2 
	BoCommentDAO dao = new BoCommentDAO();
	BoCommentVO vo = new BoCommentVO();
	vo.setBcCom(comment);
	vo.setBcPwd(Integer.parseInt(bcPwd));
	vo.setBcGroupNo(Integer.parseInt(groupNo));
	vo.setBoNo(Integer.parseInt(boNo));
	vo.setUserNo(Integer.parseInt(userNo));
	vo.setUserId(userId);
	
	try{
		int cnt = dao.insertBoComment(vo);
		System.out.println("댓글 입력 조회");
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>