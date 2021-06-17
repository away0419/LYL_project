<%@page import="src.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="src.myuser.MyuserDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String saveDir = application.getRealPath(Utility.UPLOAD_PATH);
saveDir = config.getServletContext().getRealPath(Utility.UPLOAD_PATH);
saveDir = Utility.TEST_UPLOAD_PATH;

int maxSize = 2 * 1024 * 1024;
String msg = "회원가입 실패", url = "/startbootstrap-sb-admin-gh-pages/login/register.jsp";
try {
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

	MyuserDAO dao = new MyuserDAO();
	MyuserVO vo = new MyuserVO();
	vo.setUserId(userId);
	vo.setUserName(userName);
	vo.setUserPwd(userPwd);
	vo.setUserEmail(userEmail);
	vo.setUserImgName(fileName);
	vo.setUserImgSize(fileSize);
	vo.setUserImgOriName(originalFileName);

	int cnt = dao.insertMyuser(vo);
	System.out.println("회원 수정 여부" + cnt);
	
	if(cnt>0){
		msg = "회원가입 성공!";
		url = "/startbootstrap-sb-admin-gh-pages/login/login.jsp";
	}
} catch (SQLException e) {
	e.printStackTrace();
}

request.setAttribute("msg", msg);
request.setAttribute("url", url);
%>

<jsp:forward page="/startbootstrap-sb-admin-gh-pages/common/message.jsp"></jsp:forward>
