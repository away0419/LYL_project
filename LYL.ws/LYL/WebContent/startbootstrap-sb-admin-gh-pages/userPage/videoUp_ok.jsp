<%@page import="video.VideoVO"%>
<%@page import="video.VideoDAO"%>
<%@page import="src.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="src.myuser.MyuserDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myuserService" class="src.myuser.MyuserService" scope="page"></jsp:useBean>	
<%

String saveDir = Utility.VIDEO_UPLOAD_PATH;

int maxSize = 2 * 1024 * 1024;
String msg = "업로드 실패", url = "/startbootstrap-sb-admin-gh-pages/userPage/videoUp.jsp";
try {
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());

	String fileName = mr.getFilesystemName("upfile");
	String vidThuName = mr.getFilesystemName("thuFile");
	String originalFileName = "";
	long fileSize = 0;
	if (fileName != null && !fileName.isEmpty()) {
		originalFileName = mr.getOriginalFileName("upfile");
		File file = mr.getFile("upfile");
		fileSize = file.length();
	}

	String vidTitle = mr.getParameter("title");
	String vidurl = mr.getParameter("vidurl");
	String vidEx = mr.getParameter("content");
	String vidTheme = mr.getParameter("theme");
	int userNo = (int)session.getAttribute("userNo");

	VideoDAO dao = new VideoDAO();
	VideoVO vo = new VideoVO();

	vo.setVidTitle(vidTitle);
	vo.setVidurl(vidurl);
	vo.setVidEx(vidEx);
	vo.setVidTheme(Integer.parseInt(vidTheme));
	vo.setUserNo(userNo);
	int index = vidurl.lastIndexOf('/');
	if(vidurl!=null){
		vidThuName = "http://img.youtube.com/vi/"+vidurl.substring(index+1)+"/maxresdefault.jpg";
		System.out.println(vidThuName);
		vidurl = "https://www.youtube.com/embed/"+vidurl.substring(index+1);
	}
	vo.setVidThu(vidThuName);
	vo.setVidName(fileName);
	vo.setVidSize(fileSize);
	vo.setVidOriName(originalFileName);
	
	int cnt = dao.insertVideo(vo);
	System.out.println("비디오 업로드 결과=" + cnt);

	if (cnt > 0) {
		msg = "비디오 업로드 성공!";
		url = "/startbootstrap-sb-admin-gh-pages/userPage/myPage.jsp";
	}
} catch (SQLException e) {
	e.printStackTrace();
}

request.setAttribute("msg", msg);
request.setAttribute("url", url);
%>

<jsp:forward page="/startbootstrap-sb-admin-gh-pages/common/message.jsp"></jsp:forward>

