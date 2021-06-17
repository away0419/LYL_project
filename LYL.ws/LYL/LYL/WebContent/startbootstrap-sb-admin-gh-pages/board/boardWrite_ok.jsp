<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");

	//ip 읽어오기
	String ip = request.getRemoteAddr();
	String ip2 = request.getRemoteHost();
	System.out.println("ip=" + ip + ", ip2=" + ip2);

	//2.
	BoardDAO dao = new BoardDAO();
	BoardVO vo =  new BoardVO();
	vo.setBoTitle(title);
	vo.setBoCon(content);
	try {

		//3.
		if (cnt > 0) {
	%>
	<script type="text/javascript">
		alert('글쓰기 처리 되었습니다');
		location.href = "list.jsp";
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