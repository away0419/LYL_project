<%@page import="video.VideoService"%>
<%@page import="src.aftervideo.aftervideoVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="src.myuser.MyuserVO"%>
<%@page import="video.VideoVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>


<style>
	#player{
		padding-top: 10px;
	}
	p{
		margin: 0;
	}
	
</style>

<script>
	var vidComCnt=0;
	var vidNo=${param.vidNo};
    $(window).scroll(function() {
    	
    	
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    		
    		$.ajax({

    			url : "videoWatch_ok.jsp",

    			type : "post", //get post둘중하나

    			data : {"vidComCnt":vidComCnt,"vidNo":vidNo},
    			

    			success : function(data) {
    				
    				var obj = JSON.parse(data);

    				var comList = obj.comList;
    				var comListSize = obj.comListSize;
    				
    				for(var i=0; i<comListSize; i++){
	    				var otherUserId='<p class="otherUserId">'+comList[i].comNo+'</p>';
	    		    	var otherContent='<p class="otherContent">'+comList[i].comCon+'</p>';
	    		    	var otherBtCommentLike='<button class="btn btn-primary" type="button">좋아요 </button>';
	    		    	var otherCommentLikeCnt='<span id="vidCommentLikeCnt">'+comList[i].comLike+'</span>';
	    		    	var otherBtComment2='<button class="btn btn-primary" type="button">답글</button>';
	    				
	
	    				$('.vidComment').last().after('<div class="vidComment">');
	    	        	$('.vidComment').last().append("<br>");
	    	        	$('.vidComment').last().append(otherUserId);
	    	        	$('.vidComment').last().append(otherContent);
	    	        	$('.vidComment').last().append(otherBtCommentLike);
	    	        	$('.vidComment').last().append(otherCommentLikeCnt);
	    	        	$('.vidComment').last().append(otherBtComment2);
    				}
    				vidComCnt+=10;
    			}

    		});
    		
        	
        	
        }
    });
</script>

<body>
	<jsp:useBean id="videoService" class="video.VideoService" scope="page"></jsp:useBean>
	<jsp:useBean id="myuserService" class="src.myuser.MyuserService" scope="page"></jsp:useBean>
	<jsp:useBean id="aftervideoService" class="src.aftervideo.aftervideoService" scope="page"></jsp:useBean>
	
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String vidno = request.getParameter("vidNo");  //받아올게 없쥬?
		
		VideoVO videoVo = null;
		MyuserVO myuserVo = null;
		aftervideoVO afvideoVo = null;
		try{
			videoVo = videoService.videoSelect(vidno);
			myuserVo = myuserService.selectMyuserByVidNo(vidno);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	%>

   <header>
   </header>
   <iframe id="player" width="1200" height="650" src=<%=videoVo.getVidurl()+"?autoplay=1&mute=1"%> allowfullscreen=""></iframe>
	<p id='vidTitle'>title : &nbsp;<%=videoVo.getVidTitle() %></p>
	<p id='vidHits'>조회수 <%=videoVo.getVidHits() %> 회 <%=sdf.format(videoVo.getVidDate()) %></p>
	
	<hr>
	<p id='vidUploaderId'>id :&nbsp;<%=myuserVo.getUserId() %> </p>
	<p id='vidG'>구독자<%=myuserVo.getUserSub() %> 명</p>
    <p id='vidContent'>내용 : &nbsp;<%=videoVo.getVidEx() %></p>
    <hr>
    <div id='vidCommentCnt'>
    	<span>댓글 </span><span><%=videoVo.getVidCom() %></span><span>개</span>
    </div>
    <div class='vidComment' id ='myComment'>
    	<textarea rows="2" cols="100"></textarea>
   	 	<button type="button">댓글</button>
    </div>
    <!-- <div class='vidComment'>
    	<p class="otherUserId">아이디</p>
    	<p class="otherContent">내용</p>
    	<button class="btCommentLike" type="button">좋아요</button>
    	<span id="vidCommentLikeCnt">111</span>
    	<button type="button">답글</button>
    </div> -->
    
  </body>


<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>