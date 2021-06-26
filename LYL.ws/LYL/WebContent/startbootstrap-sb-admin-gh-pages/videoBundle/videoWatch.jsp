<%@page import="src.subscribe.subscribeVO"%>
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
	.ReComDiv{
		padding-left: 50px;
	}
	.comText {
 
	padding: 9px;
	 
	border: solid 1px #460023;
	 
	outline: 0;
	 
	background: -webkit-gradient(linear, left top, left 25, from(#edfcff), color-stop(4%, #cff6ff), to(#edfcff));
	 
	background: -moz-linear-gradient(top, #edfcff, #edfcff 1px, #edfcff 25px);
	 
	box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
	 
	-moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
	 
	-webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
	 
	 
	 
	}
</style>

<script>
	var vidComCnt= 0;
	var vidComCnt2= 1;
	var vidReComCnt=1;
	var vidNo=${param.vidNo};
	var userNo = "${sessionScope.userNo}";
    $(window).scroll(function() {
    	
    	
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    		
    		$.ajax({

    			url : "videoWatch_ok.jsp",

    			type : "post", //get post둘중하나

    			data : {"vidComCnt":vidComCnt,"vidNo":vidNo, "vidGroup":0, "loginUserNo":userNo},
    			

    			success : function(data) {
    				
    				var obj = JSON.parse(data);

    				var comList = obj.comList;
    				var comListSize = obj.comListSize;
    				
    				for(var i=0; i<comListSize; i++){
    					var otherComNo='<input type="hidden" class="hid1" value="'+comList[i].comNo+'">';
    					var otherComNo2='<input type="hidden" class="hid2" value="'+vidComCnt2+'">';    				
    					var otherReFirstCheck='<input type="hidden" class="reComBtFirstCheck" value=0>';
    					var otherReComSeeMore='<input type="hidden" class="reComSeeMore" value=0>';
    					var otherReComSeeMoreCheck='<input type="hidden" class="reComSeeMoreCheck" value="true">';
	    				var otherUserId='<p class="otherUserId">'+comList[i].comId+'</p>';
	    		    	var otherContent='<p class="otherContent">'+comList[i].comCon+'</p>';
	    		    	var otherBtCommentLike='<button class="btn btn-primary btComLike" type="button">좋아요 </button>';
	    		    	var otherCommentLikeCnt='<span class="vidCommentLikeCnt">&nbsp'+comList[i].comLike+'&nbsp&nbsp&nbsp&nbsp</span>';
	    		    	var otherBtComment2='<button class="btn btn-primary btComRe" type="button">답글</button>';
	    		    	var otherCommentReCnt='<span class="vidCommentReCnt">&nbsp'+comList[i].comRe+'&nbsp&nbsp&nbsp&nbsp</span>';
	    		    	var otherBtComment3='<button class="btn btn-primary btComReply" type="button">답글하기</button>';
	    		    	var otherReplyCom
	    		    	='<div class="ReplyCom" style="display:none"><textarea rows="2" cols="100" class="teReComCon"></textarea><button type="button" class="reComWrite">댓글</button></div>';
	    		    	var otherReComDiv='<div class="ReComDiv" style="display:none"><p></p></div>'
						
	    		    	
	
	    				$('.vidComment').last().after('<div class="vidComment">');
	    	        	$('.vidComment').last().append("<br>");
	    	        	$('.vidComment').last().append(otherComNo);
	    	        	$('.vidComment').last().append(otherComNo2);
	    	        	$('.vidComment').last().append(otherReFirstCheck);
	    	        	$('.vidComment').last().append(otherReComSeeMore);
	    	        	$('.vidComment').last().append(otherReComSeeMoreCheck);
	    	        	$('.vidComment').last().append(otherUserId);
	    	        	$('.vidComment').last().append(otherContent);
	    	        	$('.vidComment').last().append(otherBtCommentLike);
	    	        	$('.vidComment').last().append(otherCommentLikeCnt);
	    	        	$('.vidComment').last().append(otherBtComment2);
	    	        	$('.vidComment').last().append(otherCommentReCnt);
	    	        	$('.vidComment').last().append(otherBtComment3);
	    	        	if(comList[i].comUserNo==userNo){
	    		    		var otherBtComment4='&nbsp&nbsp<button class="btn btn-primary btComUpdate" type="button">수정</button>';
	    		    		var otherBtComment5	='&nbsp&nbsp<button class="btn btn-primary btComDelete" type="button">삭제</button>';
	    		    		$('.vidComment').last().append(otherBtComment4);
	    		    		$('.vidComment').last().append(otherBtComment5);
	    		    	}
	    	        	$('.vidComment').last().append(otherReplyCom);
	    	        	$('.vidComment').last().append(otherReComDiv);
    					vidComCnt2++;
    					
    					if(comList[i].comLikeCheck==1){
    						$('.vidComment').last().children('.btComLike').css('background', '#dc3545');
    					}
    				}
    				vidComCnt+=comListSize;
    				if(vidComCnt==9 || vidComCnt==1){
    					vidComCnt++;
    				}
    				
    			}

    		});//ajax
    		
        	
        }
    });
    
    $(function(){
    	$('body').on('click','button.btComRe',(function(){
    		$(this).parent().children('.ReComDiv').toggle();
    		var reComNo= $(this).parent().children('.hid1').val();
    		var reComNo2= parseInt($(this).parent().children('.hid2').val());
    		var userNo = "${sessionScope.userNo}";
    		var firstCheck = $(this).parent().children('.reComBtFirstCheck').val();
    		var reSeeMore = $(this).parent().children('.reComSeeMore').val();
    		
    		if(firstCheck==0){
    			
    			$.ajax({

        			url : "videoWatch_ok.jsp",

        			type : "post", //get post둘중하나

        			data : {"vidComCnt":0,"vidNo":vidNo, "vidGroup":reComNo, "loginUserNo":userNo},
        			

        			success : function(data) {
        				
        				var obj = JSON.parse(data);
						
        				var comList = obj.comList;
        				var comListSize = obj.comListSize;
        				if(comListSize>0){
        					$('.vidComment').eq(reComNo2).children('.ReComDiv').append("<br>");
        					$('.vidComment').eq(reComNo2).children('.reComBtFirstCheck').val(1);
        					vidReComCnt=1;
        				}
        				for(var i=0; i<comListSize; i++){
        					var reotherComNo='<input type="hidden" class="rehid1" value="'+comList[i].comNo+'">';
    	    				var reotherUserId='<p class="reotherUserId">'+comList[i].comId+'</p>';
    	    		    	var reotherContent='<p class="reotherContent">'+comList[i].comCon+'</p>';
    	    		    	var reotherBtCommentLike='<button class="btn btn-primary rebtComLike" type="button">좋아요 </button>';
    	    		    	var reotherCommentLikeCnt='<span class="revidCommentLikeCnt">&nbsp'+comList[i].comLike+'&nbsp&nbsp&nbsp&nbsp</span>';
    	    		    	var reotherReComCnt='<input type="hidden" class="reComCnt" value='+vidReComCnt+'>';
    	    		    	vidReComCnt++;
    	    		    	
    	    		    	
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append('<div class="vidReComment">');
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherComNo);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherReComCnt);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherUserId);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherContent);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherBtCommentLike);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherCommentLikeCnt);
    	    		    	if(comList[i].comUserNo==userNo){
    	    		    		var otherBtComment4='&nbsp&nbsp<button class="btn btn-primary btReComUpdate" type="button">수정</button>';
    	    		    		var otherBtComment5	='&nbsp&nbsp<button class="btn btn-primary btReComDelete" type="button">삭제</button>';
    	    		    		var otherBtComment6	='<div class="vidComment2" style="display:none">';
    	    		    		var otherBtComment7	='<textarea rows="2" cols="100" class="teComCon"></textarea>';
    	    		    		var otherBtComment8	='<button type="button" class="recomWrite">수정</button>';
    	    		    		
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment4);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment5);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment6);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().children('.vidComment2').append(otherBtComment7);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().children('.vidComment2').append(otherBtComment8);
    	    		    	}
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append("<br>");
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append("<br>");
    	    		    	
    	    		    	if(comList[i].comLikeCheck==1){
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().children('.rebtComLike').css('background', '#dc3545');
        					}
        				}
        				if(comListSize==9){
        					var otherBtComment2='<button class="btn btn-primary btComReSeeMore" type="button">더보기</button>';
        					$('.vidComment').eq(reComNo2).children('.ReComDiv').last().append(otherBtComment2);
        					$('.vidComment').eq(reComNo2).children('.reComSeeMore').val(parseInt(reSeeMore)+10);
        					$('.vidComment').eq(reComNo2).children('.reComSeeMoreCheck').val("false");
        					
        				}
        				
        			}

        		});//ajax
    		}    		
    		
    		
    	}));//btComRe
    	
    	$('body').on('click','button.btComReSeeMore',(function(){
    		$(this).hide();
    		var reComNo= $(this).parent().parent().children('.hid1').val();
    		var reComNo2= parseInt($(this).parent().parent().children('.hid2').val());
    		var reSeeMore = $(this).parent().parent().children('.reComSeeMore').val();
    		var userNo = "${sessionScope.userNo}";
    		
    		
    			$.ajax({

        			url : "videoWatch_ok.jsp",

        			type : "post", //get post둘중하나

        			data : {"vidComCnt":reSeeMore,"vidNo":vidNo, "vidGroup":reComNo, "loginUserNo":userNo},
        			

        			success : function(data) {
        				
        				var obj = JSON.parse(data);

        				var comList = obj.comList;
        				var comListSize = obj.comListSize;
        				
        				vidReComCnt=$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().children('.reComCnt').val();
        				for(var i=0; i<comListSize; i++){
        					var reotherComNo='<input type="hidden" class="rehid1" value="'+comList[i].comNo+'">';
    	    				var reotherUserId='<p class="reotherUserId">'+comList[i].comId+'</p>';
    	    		    	var reotherContent='<p class="reotherContent">'+comList[i].comCon+'</p>';
    	    		    	var reotherBtCommentLike='<button class="btn btn-primary rebtComLike" type="button">좋아요 </button>';
    	    		    	var reotherCommentLikeCnt='<span class="revidCommentLikeCnt">&nbsp'+comList[i].comLike+'&nbsp&nbsp&nbsp&nbsp</span>';
    	    		    	vidReComCnt++;
    	    		    	var reotherReComCnt='<input type="hidden" class="reComCnt" value='+vidReComCnt+'>';
    	    		    	
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').append('<div class="vidReComment">');
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherComNo);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherReComCnt);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherUserId);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherContent);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherBtCommentLike);
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(reotherCommentLikeCnt);
    	    		    	if(comList[i].comUserNo==userNo){
    	    		    		var otherBtComment4='&nbsp&nbsp<button class="btn btn-primary btReComUpdate" type="button">수정</button>';
    	    		    		var otherBtComment5	='&nbsp&nbsp<button class="btn btn-primary btReComDelete" type="button">삭제</button>';
    	    		    		var otherBtComment6	='<div class="vidComment2" style="display:none">';
    	    		    		var otherBtComment7	='<textarea rows="2" cols="100" class="teComCon"></textarea>';
    	    		    		var otherBtComment8	='<button type="button" class="recomWrite">수정</button>';
    	    		    		
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment4);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment5);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment6);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().children('.vidComment2').append(otherBtComment7);
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().children('.vidComment2').append(otherBtComment8);
    	    		    	}
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append("<br>");
    	    		    	$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().append("<br>");
    	    		    	if(comList[i].comLikeCheck==1){
    	    		    		$('.vidComment').eq(reComNo2).children('.ReComDiv').children('.vidReComment').last().children('.rebtComLike').css('background', '#dc3545');
        					}
        				}
        				if(comListSize>=9){
        					var otherBtComment2='<button class="btn btn-primary btComReSeeMore" type="button">더보기</button>';        					
        					$('.vidComment').eq(reComNo2).children('.ReComDiv').last().append(otherBtComment2);
        					$('.vidComment').eq(reComNo2).children('.reComSeeMore').val(parseInt(reSeeMore)+10);
        				}else{
        					$('.vidComment').eq(reComNo2).children('.reComSeeMoreCheck').val("true");
        					
        				}
        				
        			}

        		});//ajax
    		   		
    		
    		
    	}));//btComReSeeMore
    	
    	$('body').on('click','button.btComReply',(function(){
    		$(this).parent().children('.ReplyCom').toggle();
    		$(this).parent().children('.ReplyCom').children('.reComWrite').text("답글");   		
    		$(this).parent().children('.ReplyCom').children('.teReComCon').val("");
    	}));//btComReply
    	
    	
    	
    });
  
</script>
	<jsp:useBean id="videoService" class="video.VideoService" scope="page"></jsp:useBean>
	<jsp:useBean id="myuserService" class="src.myuser.MyuserService" scope="page"></jsp:useBean>
	<jsp:useBean id="aftervideoService" class="src.aftervideo.aftervideoService" scope="page"></jsp:useBean>
	<jsp:useBean id="subscribeService" class="src.subscribe.subscribeService" scope="page"></jsp:useBean>
	<jsp:useBean id="watchrecordService" class="src.watchrecord.watchrecordService" scope="page"></jsp:useBean>
	
	<%
		int userNo=0;
		if(session.getAttribute("userNo")!=null){
			userNo = (int)session.getAttribute("userNo"); //세션 유저번호
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String vidno = request.getParameter("vidNo");  // 비디오 번호
		
		
		VideoVO videoVo = null;
		MyuserVO myuserVo = null;
		aftervideoVO afvideoVo = null;
		subscribeVO subscribeVo = null;
		int cnt= 0;
		int subCnt = 0;
		try{
			videoService.updateHits(Integer.parseInt(vidno));
			videoVo = videoService.videoSelect(vidno);
			myuserVo = myuserService.selectMyuserByVidNo(vidno); //유저번호, 구독자, 타이틀 밖에 안들어있어요
			cnt = aftervideoService.selectAftervideo(vidno, Integer.toString(userNo));
			subCnt = subscribeService.selectSubscribe(Integer.toString(myuserVo.getUserNo()), Integer.toString(userNo));
			int watCnt= watchrecordService.insertWatchrecord(Integer.toString(userNo), vidno);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		String vidUrl = videoVo.getVidurl();
		if(vidUrl.startsWith("https")){
			vidUrl+="?autoplay=1&mute=1";
		}
		
		System.out.println(cnt);
		
		
	%>

   <header>
   </header>
   <iframe id="player" width="1200" height="650" src=<%=vidUrl%> allowfullscreen=""></iframe>
	<p id='vidTitle' class="h4"><%=videoVo.getVidTitle() %></p>
	<p id='vidHits'>조회수 <%=videoVo.getVidHits() %> 회 <%=sdf.format(videoVo.getVidDate()) %></p>
	
	<hr>
	<p id='vidUploaderId' class="fs-5"><a class="text-decoration-none" href="../userPage/myPage.jsp?vidno=<%=vidno %>"><%=myuserVo.getUserId() %></a> </p>
	<p id='vidG'>구독자&nbsp;<span id=vidGs><%=myuserVo.getUserSub() %></span> 명</p>
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<%if(subCnt>0){%>
		<button id="subscribe" class="btn btn-primary me-md-2" type="button" value="<%=myuserVo.getUserNo()%>" style="background: #dc3545">구독 취소</button>
		<%}else { %>
		<button id="subscribe" class="btn btn-primary me-md-2" type="button" value="<%=myuserVo.getUserNo()%>">구독</button>
		<%} %>
		<%if(cnt>0){%>
		<button id="videoSave" class="btn btn-primary" type="button" style="background: #dc3545" >다시보기 삭제</button>
		<%}else { %>
		<button id="videoSave" class="btn btn-primary" type="button" >다시보기에 저장</button>
		<%} %>
	
	</div>

	<p id='vidContent'><%=videoVo.getVidEx() %></p>
    <hr>
    <div id='vidCommentCnt'>
    	
    </div>
    <div class='vidComment' id ='myComment'>
    	<textarea class='comText teComCon' rows="2" cols="100"></textarea>
   	 	<button type="button" class="comWrite btn btn-primary">댓글 쓰기</button>
    </div>
    <input type="hidden" class="vidComCnt" value=0>
    
    <!-- <div class='vidComment'>
    	<p class="otherUserId">아이디</p>
    	<p class="otherContent">내용</p>
    	<button class="btCommentLike" type="button">좋아요</button>
    	<span id="vidCommentLikeCnt">111</span>
    	<button type="button">답글</button>
    </div> -->
    
  </body>
<script type="text/javascript">
	var vidNo=${param.vidNo};
	var userNo = "${sessionScope.userNo}"; //로이그인 해서 들어온 유저
	var userNo2 = $('#subscribe').val(); //영상 올린 유저
	
	$(function() {
		$('#videoSave').click(function() {
			if(userNo==""){
    			alert("로그인하세요")
    			return;
    		}
			
			if($('#videoSave').text()=='다시보기에 저장'){ 
				$.ajax({
	
					url : "aftervideo_ok.jsp", //나중에볼 동영상
	
					type : "post", //get post둘중하나
	
					data : {
						"userNo" : userNo,
						"vidNo" : vidNo
					},
	
					success : function(data) {
						var obj = JSON.parse(data);
						var cnt = obj.cnt;
	
						if (cnt > 0) {
							$(function() {
								$('#videoSave').text('다시보기 삭제');
								$('#videoSave').css('background', '#dc3545');
							})
	
						}
	
					}
				});
			
			} else if($('#videoSave').text()=='다시보기 삭제'){
				$.ajax({
					
					url : "delAftervideo_ok.jsp", //나중에볼 동영상
	
					type : "post", //get post둘중하나
	
					data : {
						"userNo" : userNo,
						"vidNo" : vidNo
					},
	
					success : function(data) {
						var obj = JSON.parse(data);
						var cnt = obj.cnt;
	
						if (cnt > 0) {
							$(function() {
								$('#videoSave').text('다시보기에 저장');
								$('#videoSave').css('background', '#0d6efd');
							})
	
						}
	
					}
				});
			}
		});
		
		$('#subscribe').click(function() {
			if(userNo==""){
    			alert("로그인하세요")
    			return;
    		}
			if(userNo==userNo2){
				alert("자신을 구독할수 없어요")
    			return;
			}
			
			var vidGnum= $('#vidGs').text();
			
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
								vidGnum++;
								$('#vidGs').text(vidGnum);
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
								vidGnum--;
								$('#vidGs').text(vidGnum);
							})
	
						}
	
					}
				});
			}
		});
		
		$('.comWrite').click(function(){
			
			if(userNo==""){
    			alert("로그인하세요")
    			return;
    		}
			
			var comCon = $('#myComment').children('.teComCon').val();
			
			$.ajax({

				url : "comWrite_ok.jsp", 

				type : "post", //get post둘중하나

				data : {
					"userNo" : userNo,
					"vidNo" : vidNo,
					"comCon" : comCon,
					"comGroup" : 0
				},

				success : function(data) {
					$('#myComment').children('textarea').val("");
					

				}
			});//ajax
			
			
    	});//comWrite
    	
    	$('body').on('click','button.reComWrite',(function(){
    		if(userNo==""){
    			alert("로그인하세요")
    			return;
    		}
    		var comGroup= $(this).parent().parent().children('input[type=hidden]').val();
    		var comCntNo= $(this).parent().parent().children('.hid2').val();
			var seeMoreCheck= $(this).parent().parent().children('.reComSeeMoreCheck').val();
			var firstCheck = $(this).parent().parent().children('.reComBtFirstCheck').val();
    		var comCon = $(this).parent().children('.teReComCon').val();
    		vidReComCnt=$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().children('.reComCnt').val();
    		var btReWriteCheck = $(this).parent().parent().children('.ReplyCom').children('.reComWrite').text();
    		var $commentCon=$(this).parent().parent().children('.otherContent');
    		var $comre = $(this).parent().parent().children('.vidCommentReCnt');
    		var comreCnt = $(this).parent().parent().children('.vidCommentReCnt').text();
    		
    		if(btReWriteCheck=="답글"){
	    		$.ajax({
	
					url : "comWrite_ok.jsp", 
	
					type : "post", //get post둘중하나
	
					data : {
						"userNo" : userNo,
						"vidNo" : vidNo,
						"comCon" : comCon,
						"comGroup" : comGroup
					},
	
					success : function(data) {
						var obj = JSON.parse(data);
						var cnt = obj.cnt;
	 					$('.ReplyCom').eq(comCntNo-1).children('textarea').val(""); 					
	 					
	 					if(seeMoreCheck=="true" && firstCheck!=0){
	 						var reotherComNo='<input type="hidden" class="rehid1" value='+cnt+'>';
		 					var reotherUserId='<p class="reotherUserId"><%=myuserVo.getUserId()%></p>';
		    		    	var reotherContent='<p class="reotherContent">'+comCon+'</p>';
		    		    	var reotherBtCommentLike='<button class="btn btn-primary rebtComLike" type="button">좋아요 </button>';
		    		    	var reotherCommentLikeCnt='<span class="revidCommentLikeCnt">&nbsp0&nbsp&nbsp&nbsp&nbsp</span>';
		    		    	var otherBtComment4='&nbsp&nbsp<button class="btn btn-primary btReComUpdate" type="button">수정</button>';
		    		    	var otherBtComment5	='&nbsp&nbsp<button class="btn btn-primary btReComDelete" type="button">삭제</button>';
		    		    	var otherBtComment6	='<div class="vidComment2" id ="myComment" style="display:none">';
	    		    		var otherBtComment7	='<textarea rows="2" cols="100" class="teComCon"></textarea>';
	    		    		var otherBtComment8	='<button type="button" class="recomWrite">수정</button>';
		    		    	vidReComCnt++;
		    		    	var reotherReComCnt='<input type="hidden" class="reComCnt" value='+vidReComCnt+'>';
		    		    	
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').append('<div class="vidReComment">');
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(reotherComNo);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(reotherReComCnt);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(reotherUserId);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(reotherContent);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(reotherBtCommentLike);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(reotherCommentLikeCnt);	    		    	
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment4);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment5);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append(otherBtComment6);
	    		    		$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().children('.vidComment2').append(otherBtComment7);
	    		    		$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().children('.vidComment2').append(otherBtComment8);
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append("<br>");
		    		    	$('.vidComment').eq(comCntNo).children('.ReComDiv').children('.vidReComment').last().append("<br>");
		    		   
	 					}
	 					comreCnt++;
						$comre.html("&nbsp"+comreCnt+"&nbsp&nbsp&nbsp&nbsp");
					}
				});//ajax
    		}else{
    			$.ajax({

    				url : "updateCom_ok.jsp", 

    				type : "post", //get post둘중하나

    				data : {
    					"comCon" : comCon,
    					"comGroup" : comGroup
    				},

    				success : function(data) {
    					
    					$commentCon.text(comCon);
    					

    				}
    			});//ajax
    		}
			
    	}));//reComWrite
    	
    	$('body').on('click','button.btComDelete',(function(){
    		var comGroup= $(this).parent().children('input[type=hidden]').val();
    		var comCntNo= $(this).parent().children('.hid2').val();
    		var $remove =$(this).parent();
    		$.ajax({

				url : "comDelete_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"comGroup" : comGroup,
					"comCheck" : 0,
					"parentComNo" : 0
				},

				success : function(data) {							
					$remove.remove();							
					if(vidComCnt!=0){
						vidComCnt--;
						vidComCnt2--;
					}
					
				}
			});//ajax
			
			
    	}));//btComDelete
    	
    	$('body').on('click','button.btReComDelete',(function(){
    		var parentComNo= $(this).parent().parent().parent().children('input[type=hidden]').val();
    		var comGroup = $(this).parent().children('.rehid1').val();
    		var comCntNo= $(this).parent().parent().parent().children('.hid2').val();   		
    		var rcn= $(this).parent().children('.reComCnt').val();
    		var $remove= $(this).parent();
    		var $comre = $(this).parent().parent().parent().children('.vidCommentReCnt');
    		var comreCnt = $(this).parent().parent().parent().children('.vidCommentReCnt').text();
    		var reComSeeMoreCnt = $(this).parent().parent().parent().children('.reComSeeMore').val();
    		var $rCSM = $(this).parent().parent().parent().children('.reComSeeMore');    		
    		$.ajax({

				url : "comDelete_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"comGroup" : comGroup,
					"comCheck" : 1,
					"parentComNo" : parentComNo
				},

				success : function(data) {							
 												
					$remove.remove();
					comreCnt--;
					$comre.html("&nbsp"+comreCnt+"&nbsp&nbsp&nbsp&nbsp");
					if(vidReComCnt!=0){
						vidReComCnt--;
					}
					if(reComSeeMoreCnt>0){
						reComSeeMoreCnt--;
						$rCSM.val(reComSeeMoreCnt);
					}
					
				}
			});//ajax
    		
    	}));//btReComDelete
    	
    	$('body').on('click','button.btComUpdate',(function(){
    		$(this).parent().children('.ReplyCom').toggle();
    		$(this).parent().children('.ReplyCom').children('.reComWrite').text("수정");
    		var content = $(this).parent().children('.otherContent').text();
    		$(this).parent().children('.ReplyCom').children('.teReComCon').val(content);	
    	}));//btComUpdate
    	
    	$('body').on('click','button.btReComUpdate',(function(){
    		$(this).parent().children('.vidComment2').toggle();
    		var content = $(this).parent().children('.reotherContent').text();
    		$(this).parent().children('.vidComment2').children('.teComCon').val(content);
    	}));//btReComUpdate
    	
    	$('body').on('click','button.recomWrite',(function(){
    		var comCon = $(this).parent().children('.teComCon').val();
    		var comGroup = $(this).parent().parent().children('.rehid1').val();
    		var $commentCon = $(this).parent().parent().children('.reotherContent');
    		$.ajax({

				url : "updateCom_ok.jsp", 

				type : "post", //get post둘중하나

				data : {
					"comCon" : comCon,
					"comGroup" : comGroup
				},

				success : function(data) {
					
					$commentCon.text(comCon);
					

				}
			});//ajax
    		
    	}));//recomWrite
    	
    	
    	$('body').on('click','button.btComLike',(function(){
    		if(userNo==""){
    			alert("로그인하세요");
    			return;
    		}
    		var comNo= $(this).parent().children('input[type=hidden]').val();
			var likeCnt = $(this).parent().children('.vidCommentLikeCnt').text();
			var $ObjLikeCnt = $(this).parent().children('.vidCommentLikeCnt');
			var $my = $(this);
    		$.ajax({

				url : "comLike_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"comNo" : comNo,
					"userNo" : userNo
				},

				success : function(data) {							
 												
					var obj = JSON.parse(data);

					var likecheck = obj.likecheck;
					
					if(likecheck==1){
						likeCnt++;
						$ObjLikeCnt.html("&nbsp"+likeCnt+"&nbsp&nbsp&nbsp&nbsp");
						$my.css('background', '#dc3545');
					}else{
						likeCnt--;
						$ObjLikeCnt.html("&nbsp"+likeCnt+"&nbsp&nbsp&nbsp&nbsp");
						$my.css('background', '#0d6efd');
					}
					
				}
			});//ajax
			
    	}));//btComLike
    	
    	$('body').on('click','button.rebtComLike',(function(){
    		if(userNo==""){
    			alert("로그인하세요");
    			return;
    		}
    		var comNo = $(this).parent().children('.rehid1').val();
			var likeCnt = $(this).parent().children('.revidCommentLikeCnt').text();
			var $ObjLikeCnt = $(this).parent().children('.revidCommentLikeCnt');
			var $my = $(this);
    		$.ajax({

				url : "comLike_ok.jsp", //나중에볼 동영상

				type : "post", //get post둘중하나

				data : {
					"comNo" : comNo,
					"userNo" : userNo
				},

				success : function(data) {							
 												
					var obj = JSON.parse(data);

					var likecheck = obj.likecheck;
					
					if(likecheck==1){
						likeCnt++;
						$ObjLikeCnt.html("&nbsp"+likeCnt+"&nbsp&nbsp&nbsp&nbsp");
						$my.css('background', '#dc3545');
					}else{
						likeCnt--;
						$ObjLikeCnt.html("&nbsp"+likeCnt+"&nbsp&nbsp&nbsp&nbsp");
						$my.css('background', '#0d6efd');
					}
					
				}
			});//ajax
			
    	}));//rebtComLike
    	
    	
    	
		
	});
</script>

<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>