<%@page import="src.myuser.MyuserVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="src.myuser.MyuserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok.jsp</title>
</head>
<body>
	<jsp:useBean id="myuserService" class="src.myuser.MyuserService"
		scope="session"></jsp:useBean>
	<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String chkbox = request.getParameter("chkbox");

	String msg = "로그인 처리 실패", url = "/startbootstrap-sb-admin-gh-pages/login/login.jsp";
	try {
		int result = myuserService.loginProc(userid, pwd);
		if (result == MyuserService.LOGIN_OK) {
			MyuserVO myuserVo = myuserService.selectMyuser(userid);
			
			//세션에 아이디, 이름 저장 => 세션 어디서든 사용 가능!
			session.setAttribute("userName", myuserVo.getUserName());
			session.setAttribute("userid", userid); //키 값이 userid 
			session.setAttribute("userNo", myuserVo.getUserNo());

			//아이디 쿠키에 저장 !!
			Cookie ck = new Cookie("ck_userid", userid);
			ck.setPath("/");
			if (chkbox != null) {
		ck.setMaxAge(1000 * 24 * 60 * 60);
		response.addCookie(ck);

			} else {
		ck.setMaxAge(0);
		response.addCookie(ck);
			}

			msg = myuserVo.getUserName() + "님, 로그인되었습니다.";
			url = "/startbootstrap-sb-admin-gh-pages/main/main.jsp";
		} else if (result == MyuserService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다.";
		} else if (result == MyuserService.ID_NONE) {
			msg = "해당 아이디는 존재하지 않습니다.";
		}
	} catch (SQLException e) {
		e.printStackTrace();

	}
	;

	//3
	System.out.println("url="+url);
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	%>
		
	<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>