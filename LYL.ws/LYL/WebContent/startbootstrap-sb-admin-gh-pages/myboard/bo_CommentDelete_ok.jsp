<%@page import="java.sql.SQLException"%>
<%@page import="bocomment.BoCommentVO"%>
<%@page import="bocomment.BoCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1
	request.setCharacterEncoding("utf-8");
	String bcNo=request.getParameter("bcNo");
	String boNo=request.getParameter("boNo");
	String userId="textComm"; //==========임시 수정해야함!!!!!
	
	System.out.println(bcNo);
	//2 
	BoCommentDAO dao = new BoCommentDAO();
	
	try{
		int cnt = dao.deleteBoComment(userId, Integer.parseInt(bcNo), Integer.parseInt(boNo));
		if(cnt>0){ %>
		  <script type="text/javascript">
		    alert("댓글이 삭제되었습니다.");
		    location.href="boardDetail.jsp?boNo=<%=boNo%>";
		  </script>
	  <%}else{%>
		  <script type="text/javascript">
			  alert("댓글 삭제 처리에 실패하였습니다.");
			  location.href="boardDetail.jsp?boNo=<%=boNo%>";
		  </script>
	  <%}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
