<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//session으로 사용자아이디 받기
	request.setCharacterEncoding("utf-8");
	String userId =(String) session.getAttribute("userid");
	String boNo = request.getParameter("boNo");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String userNo = request.getParameter("userNo");
	System.out.println(boNo);
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	vo.setBoNo(Integer.parseInt(boNo));
	vo.setBoTitle(title);
	vo.setBoCon(content);
	vo.setUserId(userId);
	
	try{
		int cnt=dao.editBoard(vo);
		if (cnt > 0) {
			%>
			<script type="text/javascript">
				alert('게시글을 수정하였습니다.');
				location.href = "boardDetail.jsp?boNo=<%=boNo%>&userNo=<%=userNo%>";
			</script>
		<%} else {%>
			<script type="text/javascript">
				alert('글수정 처리 실패');
				history.back();
			</script>
		<%}
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
