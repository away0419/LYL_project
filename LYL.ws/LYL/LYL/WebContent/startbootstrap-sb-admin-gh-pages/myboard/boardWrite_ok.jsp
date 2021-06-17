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

		String userid = (String) session.getAttribute("userid");

		//write.jsp에서 post방식으로 서브밋
		//1.
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//ip 읽어오기
		String ip = request.getRemoteAddr();
		String ip2 = request.getRemoteHost();
		System.out.println("ip="+ip+", ip2="+ip2);
		
		//2.
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoTitle(title);
		/* vo.setUserNo(userNo); */ //userid로 받아올것인지 no로 받아올것인지
		vo.setBoCon(content);
		try{
			int cnt = dao.insertBoard(vo);
			
			//3.
			if(cnt>0){ %>
				<script type="text/javascript">
				 	alert('글작성 완료 되었습니다.');
			        location.href="boardList.jsp";
		        </script>
			<%}else{ %>
				<script type="text/javascript">
					alert('글작성 실패 되었습니다.');
					history.back();
				</script>
			<%}
		}catch (SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>