<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//session으로 사용자아이디 받기
	request.setCharacterEncoding("utf-8");
	String userId = "이름";      //==========임시 수정해야함!!!!!
	String boNo = request.getParameter("boNo");
	String title = request.getParameter("title");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	
	System.out.println(boNo);
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	vo.setBoNo(Integer.parseInt(boNo));
	vo.setBoTitle(title);
	vo.setBoCon(content);
	vo.setUserId(userId);
	vo.setBoPwd(Integer.parseInt(pwd));
	
	try{
		int cnt=dao.editBoard(vo);
		if (cnt > 0) {
			%>
			<script type="text/javascript">
				alert('글수정 처리 되었습니다');
				location.href = "boardDetail.jsp?boNo=<%=boNo%>";
			</script>
		<%} else {%>
			<script type="text/javascript">
				alert('글수정처리 실패');
				history.back();
			</script>
		<%}
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
