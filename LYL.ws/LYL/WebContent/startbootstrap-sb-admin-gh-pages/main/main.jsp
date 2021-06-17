<%@page import="theme.ThemeVO"%>
<%@page import="theme.ThemeService"%>
<%@page import="video.VideoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link href="../css/videoStyles.css" rel="stylesheet">
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
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
          	    		    	var scVidUserId='<p class="video_uploaderid">'+vidList[i].vidUserNo+'</p>';
          	    		    	var scVidHits='<p class="video_hits">조회수'+vidList[i].vidHits+'</p>';
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
               src="https://www.youtube.com/embed/4TWR90KJl84?autoplay=1&mute=1"
               frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
            <div id="fe" class="carousel-caption d-none d-md-block">
               <h5>First slide label</h5>
               <p>Some representative placeholder content for the first slide.</p>
            </div>
         </div>
         <div class="carousel-item">
            <iframe
               src="https://www.youtube.com/embed/b6li05zh3Kg?autoplay=1&mute=1"
               frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
            <div id="fe" class="carousel-caption d-none d-md-block">
               <h5>Second slide label</h5>
               <p>Some representative placeholder content for the second
                  slide.</p>
            </div>
         </div>
         <div class="carousel-item">
            <iframe
               src="https://www.youtube.com/embed/CBt9ieHMtas?autoplay=1&mute=1"
               frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>
            <div id="fe" class="carousel-caption d-none d-md-block">
               <h5>Third slide label</h5>
               <p>Some representative placeholder content for the third slide.</p>
            </div>
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

   <iframe id="player" width="640" height="360"
      src="https://www.youtube.com/embed/4TWR90KJl84"></iframe>
   
   
   
   
   <%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>