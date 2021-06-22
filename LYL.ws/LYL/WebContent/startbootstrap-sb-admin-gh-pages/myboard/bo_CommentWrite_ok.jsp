<%@page import="java.sql.SQLException"%>
<%@page import="bocomment.BoCommentVO"%>
<%@page import="bocomment.BoCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String comment=request.getParameter("comment");
	String groupNo="2";     //==========임시 수정해야함!!!!!
	String boNo=request.getParameter("boNo");
	String userNo="1";    //==========임시 수정해야함!!!!!
	String userId="yooh";    //==========임시 수정해야함!!!!!
	
	//2 
	BoCommentDAO dao = new BoCommentDAO();
	BoCommentVO vo = new BoCommentVO();
	vo.setBcCom(comment);
	vo.setBcGroupNo(Integer.parseInt(groupNo));
	vo.setBoNo(Integer.parseInt(boNo));
	vo.setUserNo(Integer.parseInt(userNo));
	vo.setUserId(userId);
	
	try{
		int cnt = dao.insertBoComment(vo);
		if(cnt>0){ %>
			<script type="text/javascript">
				location.href="boardDetail.jsp?boNo=<%=boNo%>";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("댓글 처리에 실패하였습니다.");
				location.back();
			</script>
		<%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
