<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="src.myuser.MyuserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<link href="../css/myPageStyles.css" rel="stylesheet">
<jsp:useBean id="myuserService" class="src.myuser.MyuserService" scope="session" ></jsp:useBean>
<jsp:useBean id="subscribeService" class="src.subscribe.subscribeService" scope="page"></jsp:useBean>
<% 
MyuserVO vo = new MyuserVO();
boolean isMine = true;
int subCnt=0;
	try{
		String vidNo = request.getParameter("vidno");//비디오에서 마이페이지 온다 가정
		if(vidNo!=null){
			vo = myuserService.selectMyuserByVidNo(vidNo);
			String userid =(String) session.getAttribute("userid");
			int userNo = (int) session.getAttribute("userNo");
			isMine = false;
			subCnt = subscribeService.selectSubscribe(Integer.toString(vo.getUserNo()), Integer.toString(userNo));
		}else{
			String userid =(String) session.getAttribute("userid");
			vo = myuserService.selectMyuser(userid);
		}
		
		
	}catch(SQLException e){
		e.printStackTrace();
		
	}
String imgName = null;
if(vo.getUserImgName()!=null ){
	imgName = vo.getUserImgName();
}

%>

<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
<script>
	$(window)
			.scroll(
					function() {
						var videoinfo = '<div class="video_info"></div>';
						var a = '<img class="main_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">';
						var videotitle = '<p class="video_tilte">title</p>';
						var uploaderid = '<p class="video_uploaderid">id</p>';
						var videohits = '<p class="video_hits">조회수</p>';

						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) {
							$("#video").append('<div class="video_main_list">');
							for (var i = 0; i < 4; i++) {
								$('.video_main_list').last().append(videoinfo);
								$('.video_info').last().append(a);
								$('.video_info').last().append(videotitle);
								$('.video_info').last().append(uploaderid);
								$('.video_info').last().append(videohits);
							}
						}
					});
	

</script>
<script type="text/javascript">
	$(function(){
		$('#uploadFile').click(function(){
			location.href="videoUp.jsp";
		});
		
		$('#myboard').click(function(){
			location.href="../myboard/boardList.jsp";
		});
		
	});

</script>


<h1 class="mt-4">마이페이지</h1>
<div class="container position-relative px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 justify-content-center">
		<div class="col-md-10 col-lg-8 col-xl-7">
			<%if(imgName==null){ %>
			<img id="userImg" src="../img/200x200.jpg" class="img-thumbnail mw-50" alt="...">
			<%}else{ %>
			<img id="userImg" src="../userImg/<%=imgName %>" class="img-thumbnail" style="width: 200px" alt="...">
			<%} %>
			
			<%if(isMine==true){ %>
				<div class="d-inline-flex position-relative start-50">
					<button id="uploadFile" type="button" class="btn btn-primary me-2">영상 업로드</button>
					<button id="myboard" type="button" class="btn btn-primary me-2">게시판</button>
				</div>
			<%}else{ %>
				<%if(subCnt>0){%>
					<div>
					<button id="subscribe" class="btn btn-primary" type="button" value="<%=vo.getUserNo()%>" style="background: #dc3545">구독 취소</button>
					</div>
				<%}else { %>
					<div>
					<button id="subscribe" class="btn btn-primary" type="button" value="<%=vo.getUserNo()%>">구독</button>
					</div>
				<%} %>
			<%} %>
			
			<div class="userInfo">
				<h2 id="userid"><%=vo.getUserId() %></h2>
				<p id="userEmail"><%=vo.getUserEmail()%></p>
				<p id="userSub">구독자 :&nbsp;<%=vo.getUserSub() %> 명</p>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="justify-content-center">
		<div class="col-me-10">
			<div class="d-inline-flex me-5">

				<iframe class="col me-2" id="player" width="640" height="360"
					src="http://www.youtube.com/embed/lgPi5GhEj0c?autoplay=1&mute=1"></iframe>

				<iframe id="player" width="640" height="360"
					src="http://www.youtube.com/embed/lgPi5GhEj0c?autoplay=1&mute=1"></iframe>
			</div>
		</div>
	</div>
</div>
<hr>
<h1>영상</h1>
<hr>
<div class="container ">
	<div class="justify-content ms-5">
		<div id="video"></div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		var userNo = "${sessionScope.userNo}"; //로이그인 해서 들어온 유저
		var userNo2 = $('#subscribe').val(); //영상 올린 유저
		
		
		$('#subscribe').click(function() {
			
			if($('#subscribe').text()=='구독'){
				$.ajax({
	
					url : "usbscribe_ok.jsp", //나중에볼 동영상
	
					type : "post", //get post둘중하나
	
					data : {
						"userNo" : userNo,
						"userNo2" : userNo2
					},
	
					success : function(data) {
						var obj = JSON.parse(data);
						var cnt = obj.cnt;
	
						if (cnt > 0) {
							$(function() {
								$('#subscribe').text('구독 취소');
								$('#subscribe').css('background', '#dc3545');
							})
	
						}
	
					}
				});
			} else if($('#subscribe').text()=='구독 취소'){
				$.ajax({
					
					url : "delUsbscribe_ok.jsp", //나중에볼 동영상
	
					type : "post", //get post둘중하나
	
					data : {
						"userNo" : userNo,
						"userNo2" : userNo2
					},
	
					success : function(data) {
						var obj = JSON.parse(data);
						var cnt = obj.cnt;
	
						if (cnt > 0) {
							$(function() {
								$('#subscribe').text('구독');
								$('#subscribe').css('background', '#0d6efd');
							})
	
						}
	
					}
				});
			}
		});
		
	})
</script>



<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>