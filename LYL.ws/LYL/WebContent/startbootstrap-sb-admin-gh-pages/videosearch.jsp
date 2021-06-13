<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/videoStyles.css" rel="stylesheet">
<%@ include file="top.jsp"%>

<script>
    $(window).scroll(function() {
        var videoinfo= '<div class="video_info"></div>';
    	var a ='<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">';
    	var videotitle='<p class="search_video_tilte">title</p>';
    	var uploaderid='<p class="video_uploaderid">id</p>';
    	var videohits='<p class="video_hits">조회수</p>';
		
    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        	$("main").append('<div class="video_search_list">');
        	$('.video_search_list').last().append(videoinfo);
        	$('.video_info').last().append(a);
        	$('.video_info').last().append(videotitle);
        	$('.video_info').last().append(uploaderid);
        	$('.video_info').last().append(videohits);
        }
    });
</script>
<body>
   <header>
    <h1>찾기</h1>
   </header>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   <div class="video_info">
	   <div class="video_search_list">
	   		<img class="search_Thumbnail" src="http://img.youtube.com/vi/lgPi5GhEj0c/maxresdefault.jpg">
	   		<p class="search_video_tilte">title</p>
	   		<p class="video_uploaderid">id</p>
	   		<p class="video_hits">조회수</p>
	   </div>
   </div>
   
   


<%@ include file="bottom.jsp"%>