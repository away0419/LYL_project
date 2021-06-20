<%@page import="theme.ThemeVO"%>
<%@page import="theme.ThemeService"%>
<%@page import="video.VideoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<link href="../css/videoStyles.css" rel="stylesheet">
<%
	VideoService vvs = new VideoService();
	int vidCnt = vvs.vidAllCnt();
	int[] vidRandom = new int[3];
	String[] vidUrl = new String[3];
	String[] vidWatch = new String[3];
	VideoVO[] voRandom = new VideoVO[3];
	
	for(int i=0; i<3; i++){
		vidRandom[i] = (int)(Math.random()*vidCnt)+1;
		for(int j=0; j<i; j++){
			if(vidRandom[i]==vidRandom[j]){
				i--;
				continue;
			}
		}
		String snum= String.valueOf(vidRandom[i]);
		voRandom[i] = vvs.videoSelect(snum);
		if(voRandom[i].getVidurl().startsWith("http"))
			vidUrl[i] = voRandom[i].getVidurl()+"?autoplay=1&mute=1";
		else
			vidUrl[i] = voRandom[i].getVidurl();
		
		vidWatch[i] = "../videoBundle/videoWatch.jsp?vidNo="+voRandom[i].getVidNo();
	}
%>
<script>
   var scThNum =1;
   
   $(window)
         .scroll(
               function() {
                  var videoinfo = '<div class="video_info"></div>';
                  
                  
                  if ($(window).scrollTop() == $(document).height()
                        - $(window).height()) {
                       
                     
                	  $.ajax({

              			url : "main_ok.jsp",

              			type : "post", //get post둘중하나

              			data : {"scThNum":scThNum},
              			

              			success : function(data) {              				
              				var obj = JSON.parse(data);

              				var vidList = obj.vidList;
              				var vidListSize = obj.vidListSize;
              				if(vidListSize==0){
              					return;
              				}
              				var themeName = obj.themeName;
              				if(vidListSize>4) vidListSize=4;
              				
              				$("main").append('<div class="video_main_list">');
                            $(".video_main_list").last().prepend('<h1>'+themeName+'<h1>');
              				for(var i=0; i<vidListSize; i++){
              					
          	    				var scVidImg='<img class="main_Thumbnail" src="'+vidList[i].vidImg+'">';
          	    		    	var scVidTitle='<p class="video_tilte">'+vidList[i].vidTitle+'</p>';
          	    		    	var scVidUserId='<p class="video_uploaderid">'+vidList[i].vidUserId+'</p>';
          	    		    	var scVidHits='<p class="video_hits">조회수 '+vidList[i].vidHits+'</p>';
          	    				var scVidNo=vidList[i].vidNo;
          	    				
          	    				$('.video_main_list').last().append('<a class="awatch" href="../videoBundle/videoWatch.jsp?vidNo='+scVidNo+'">');
          	    				$('.awatch').last().append(videoinfo);
          	    	        	$('.video_info').last().append(scVidImg);
          	    	        	$('.video_info').last().append(scVidTitle);
          	    	        	$('.video_info').last().append(scVidUserId);
          	    	        	$('.video_info').last().append(scVidHits);
          	    	        	
              				}
              				scThNum++;
              			}

              		});
           
                  }
               });
   
      
   
</script>

   <div id="carouselExampleCaptions" class="carousel slide"
      data-bs-ride="carousel">
      <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExampleCaptions"
            data-bs-slide-to="0" class="active" aria-current="true"
            aria-label="Slide 1"></button>
         <button type="button" data-bs-target="#carouselExampleCaptions"
            data-bs-slide-to="1" aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#carouselExampleCaptions"
            data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
         <div class="carousel-item active">
            <iframe
               src=<%=vidUrl[0] %>
               frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
            <a href=<%=vidWatch[0]%>>
            <div id="fe" class="carousel-caption d-none d-md-block">
               <h5>좋아요 : <%=voRandom[0].getVidLike()%></h5>
               <p><%=voRandom[0].getVidEx()%></p>
            </div>
            </a>
         </div>
         <div class="carousel-item">
            <iframe
               src=<%=vidUrl[1] %>
               frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
             <a href=<%=vidWatch[1]%>>
            <div id="fe" class="carousel-caption d-none d-md-block">
               <h5>좋아요 : <%=voRandom[1].getVidLike()%></h5>
               <p><%=voRandom[1].getVidEx()%></p>
            </div>
            </a>
         </div>
         <div class="carousel-item">
            <iframe
               src=<%=vidUrl[2] %>
               frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
             <a href=<%=vidWatch[2]%>>
            <div id="fe" class="carousel-caption d-none d-md-block">
               <h5>좋아요 : <%=voRandom[2].getVidLike()%></h5>
               <p><%=voRandom[2].getVidEx()%></p>
            </div>
            </a>
         </div>
      </div>
      <button class="carousel-control-prev" type="button"
         data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
         data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="visually-hidden">Next</span>
      </button>
   </div>

   <iframe id="player" width="630" height="360"
      src="https://www.youtube.com/embed/4TWR90KJl84"></iframe>
   <video src="https://www.youtube.com/embed/4TWR90KJl84"></video>
   
   
   
   
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>