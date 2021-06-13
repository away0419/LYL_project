<%@page import="video.VideoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="video.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="video.VideoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/videoStyles.css" rel="stylesheet">
<%@ include file="top.jsp"%>
<%
	VideoService vs = new VideoService();	
	List<VideoVO> list = new ArrayList<>(); 
	list=vs.videoThemaList(1);
%>

<script>
	$(window)
			.scroll(
					function() {
						var videoinfo = '<div class="video_info"></div>';
						
						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) {
							$("main").append('<div class="video_main_list">');
							$(".video_main_list").last().prepend('<h1>테마<h1>');
							<%for (int i = 0; i < 4; i++) {
								VideoVO vvo =list.get(i);
								String title= vvo.getVidTitle();
								if(title.length()>15){
									title=title.substring(0, 15);
									title+="...";
								}
							%>											
								var a = '<img class="main_Thumbnail" src=<%=vvo.getVidThu()%>>';
								var videotitle = '<p class="video_tilte"><%=title%></p>';
								var uploaderid = '<p class="video_uploaderid"><%=vvo.getUserNo()%></p>';
								var videohits = '<p class="video_hits">조회수 <%=vvo.getVidHits() %></p>';
								
								$('.video_main_list').last().append(videoinfo);
								$('.video_info').last().append(a);
								$('.video_info').last().append(videotitle);
								$('.video_info').last().append(uploaderid);
								$('.video_info').last().append(videohits);

							<%}%>

						}
					});
</script>

<body>
	<header>
		<h1>Hello World!!!</h1>
	</header>
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
	<img src="thumbnail/lala.png">
	
	
	<%@ include file="bottom.jsp"%>