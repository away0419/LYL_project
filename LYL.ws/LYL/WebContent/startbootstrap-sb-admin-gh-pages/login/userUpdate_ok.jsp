<%@page import="src.common.Utility"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="myuserService" class="src.myuser.MyuserService"
		scope="session"></jsp:useBean>
	<%
	String saveDir = application.getRealPath(Utility.UPLOAD_PATH);
	saveDir = config.getServletContext().getRealPath(Utility.UPLOAD_PATH);
	saveDir = Utility.TEST_UPLOAD_PATH;

	String msg = "수정 실패", url = "/startbootstrap-sb-admin-gh-pages/login/userUpdate.jsp";
	try {
		int maxSize = 2 * 1024 * 1024;
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());
		System.out.println("업로드 완료");

		String fileName = mr.getFilesystemName("upfile");
		String originalFileName = "";
		long fileSize = 0;

		if (fileName != null && !fileName.isEmpty()) {
			originalFileName = mr.getOriginalFileName("upfile");
			File file = mr.getFile("upfile");
			fileSize = file.length();
		}

		String userId = mr.getParameter("userId");
		String userName = mr.getParameter("userName");
		String userPwd = mr.getParameter("userPwd");
		String userEmail = mr.getParameter("userEmail");
		String userPhone = mr.getParameter("userHp");

		MyuserVO vo = new MyuserVO();
		vo.setUserId(userId);
		vo.setUserName(userName);
		vo.setUserPwd(userPwd);
		vo.setUserEmail(userEmail);
		vo.setUserImgName(fileName);
		vo.setUserImgSize(fileSize);
		vo.setUserImgOriName(originalFileName);

		int cnt = myuserService.userUpdate(vo);
		System.out.println("유저 등록 여부" + cnt);

		if (cnt > 0) {
			msg = "수정 성공!";
			url = "/startbootstrap-sb-admin-gh-pages/main/main.jsp";
		}

	} catch (SQLException e) {
		e.printStackTrace();

	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	%>

	<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>