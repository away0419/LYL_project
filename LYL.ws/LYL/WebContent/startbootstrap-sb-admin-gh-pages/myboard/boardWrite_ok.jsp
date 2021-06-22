<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>Insert title here</title>
</head>
<body>
	<%
	//write.jsp에서 post방식으로 서브밋
	//1.
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	String userId = "이름";     //==========임시 수정해야함!!!!!
	String userNo = "1";      //==========임시 수정해야함!!!!!
	 
	//2.
	BoardDAO dao = new BoardDAO();
	BoardVO vo =  new BoardVO();
	vo.setBoTitle(title);
	vo.setBoCon(content);
	vo.setBoPwd(Integer.parseInt(pwd));
	vo.setUserNo(Integer.parseInt(userNo));
	vo.setUserId(userId);
	try {
		int cnt=dao.insertBoard(vo);
		//3.
		if (cnt > 0) {
			%>
			<script type="text/javascript">
				alert('글쓰기 처리 되었습니다');
				location.href = "boardList.jsp";
			</script>
		<%} else {%>
			<script type="text/javascript">
				alert('글쓰기처리 실패');
				history.back();
			</script>
		<%}
	} catch (SQLException e) {
		e.printStackTrace();
	}%>
</body>
</html>