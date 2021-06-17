<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<style>
	.listBody{
		width: 1000px;
		height: auto;
		margin: 10px auto;
		padding-top: 20px;
		background: rgb(242, 242, 242);
		border-radius: 30px;
	}
	.titleH{
		clear: both;
		width: 300px;
		height: 50px;
		margin: 10px auto;
		background: #212529;
		border-radius: 30px;
	}
	.titleH h3{
		font-weight: bold;
		color: white;
		text-align: center;
		padding-top: 8px;
	}
	.detailBlock{
		width:900px;
		margin: 20px auto;
	}
	.titleLabel{
		margin: 5px 30px;
		float: left;
	}
	.title{
		margin: 10px 90px;
		padding: 7px;
		width: 700px;
		height:40px;
		background: white;
		border-radius: 10px;
	}
	.userName{
		position:absolute;
		top:178px;
		left: 450px;
		float:left;
		font-size: 12px;
		width: 150px;
		height:20px;
		margin: 0 10px;
		background: white;
	}
	.regdateLabel{
		position:absolute;
		left: 1110px;
		top:175px;
	
	}
	.regdate{
		position:absolute;
		left: 1170px;
		top:178px;
		width: 110px;
		height:20px;
		margin: 0 10px;
		float: right;
		font-size: 12px;
	}
	.contentDiv{
		margin: 0 auto;
		width:850px;
	}
	.content{
		margin: 0 auto;
		padding: 10px;
		width:850px;
		background: white;
		height: 500px;
		border-radius: 10px;
		resize: none;
	}
	
	button{
		border-radius: 10px;
	}
	.btn{
		margin: 0 400px;
	}
	
	.commentList > h5{
		margin-left: 75px;
	}
	
	.commentInsert{
		margin: 0 80px;
	}
	.commentSec{
		position: absolute;
		margin-left: 15px;
	}
	.commentSec > .submit{
		width: 100px;
		height: 48px;
		margin-top: 5px;
		border-radius: 10px;
	}
	.comment{
		border-radius: 10px;
		resize: none;
	}
</style>
<%
String boNo = request.getParameter("boNo");
	if(boNo==null || boNo.isEmpty()){ %>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="boardList.jsp";
		</script>	
	<% return;
	}
	//2
	BoardDAO dao = new BoardDAO();
	BoardVO vo = null;
	try{
		vo=dao.selectByNo(Integer.parseInt(boNo));
	} catch(SQLException e){
		e.printStackTrace();
	}
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	/* String content = vo.getBoCon();
	if(content !=null && !content.isEmpty()){
		
		//replace \r\n => <br>
		content=content.replace("\r\n", "<br>");
	}else{
		//null =>
		content=" ";
	} */
%>
<script type="text/javascript" src="/../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$(function(){
		$('#boardDelete').click(function(){
			location.href="boardDelete.jsp?boNo=<%=vo.getBoNo()%>";
		});
		$('#boardList').click(function(){
			location.href="boardList.jsp";
		});
	});
</script>
<div class="listBody">
<input type="hidden" name="boNo" value="<%=vo.getBoNo()%>">
	<div class="titleH"><h3>게시판</h3></div>
		<div class="detailBlock">
			<label class="titleLabel">제목 : </label>
			<div class="title"><%=vo.getBoTitle() %></div>
			<div class="userName"><a><%=vo.getUserNo() %></a></div>
			<div class="regdate"><%=sdf.format(vo.getBoDate()) %></div>
			<label class="regdateLabel"> 등록일 : </label><br><br>
			<div class="contentDiv">
				<div class="content" name="content"><%=vo.getBoCon() %></div>
			</div>
		</div>
		<div class="btn">
			<input type="button" value="수정" id="boardEdit">
			<input type="button" value="삭제" id="boardDelete">
			<input type="button" value="목록" id="boardList">
		</div>
		<div class="commentList">
			<h5>댓글</h5>
			<!-- 댓글 목록 반복 -->
			<!-- 테이블로 만들기@@@@@@@@ -->
		</div>
		<div class="commentInsert">
			<!-- 댓글 입력 -->
			<span class="commentUser"><!-- 댓글 달 유저이름 --></span>
			<span class="comment">
			<textarea rows="3" cols="100" class="comment" ></textarea> 
			<span class="commentSec">	
				<input type="checkbox" class="chSec">비밀글<br>
				<input type="submit" class="submit" value="등록">
			</span>
			</span>
		</div>
</div>
	
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>