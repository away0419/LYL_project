<%@page import="board.ClobTest"%>
<%@page import="java.sql.Clob"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	//write.jsp에서 post방식으로 서브밋
	//1.
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = "이름";
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	 
	//2.
	BoardDAO dao = new BoardDAO();
	BoardVO vo =  new BoardVO();
	vo.setBoTitle(title);
	vo.setBoCon(content);
	vo.setUserNo(1);
	vo.setUserNo2(1);
	try {
		int cnt=dao.insertBoard(vo);
		//3.
		if (cnt > 0) {
	%>
	<script type="text/javascript">
		alert('글쓰기 처리 되었습니다');
		location.href = "boardList.jsp";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert('글쓰기처리 실패');
		history.back();
	</script>
	<%
	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	%>
</body>
</html>