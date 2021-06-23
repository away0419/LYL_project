<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<style>
	.listBody{
		background: rgb(242, 242, 242);
		width: 1000px;
		height: auto;
		margin: 10px 13%;
		padding-top: 20px;
		border-radius: 10px;
	}

	#titleH{
		width: 300px;
		height: 50px;
		margin: 20px auto;
		background: #212529;
		border-radius: 30px;
	}

	h2{
		font-weight: bold;
		color: white;
		text-align: center;
		padding-top: 8px;
	}
	
	.titleDiv{
		text-align:center;
	}
	
	label{
		margin: 0 10px;
		font-weight: bold;
	}
	
	.title{
		width: 450px;
		height: 30px;
		border-radius: 10px;
		border:none;
	}
	
	#content{
		margin:20px 90px;
		border-radius: 10px;
		border: none;
		font-size: 15px;
		resize: none;
	}

	.btnList{
		margin: 10px 370px;
	
	}
	.btn11{
		height: 40px;
		margin: 10px;
		width: 100px;
		color: white;
		font-weight: bold;
		background: #0d6efd;
		border: none;
		border-radius: 10px;
		cursor: pointer;
	}
	
	#pwd{
		width: 200px;
		margin-left: 670px;
	}
	.pwd{
		width: 100px;
		font-size: 13px;
	}

</style>
<%
	String userId=(String)session.getAttribute("userid");
	String userNo=request.getParameter("userNo");

%>
<script type="text/javascript" src="/../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$(function(){
		$('#pwd').hide();

		$('#frmWrite').submit(function(){
			if($(".title").val().length<1){
				alert('제목을 입력하세요');
				event.preventDefault();
				$(".title").focus();
			}

			if($("#content").val().length<1){
				alert('내용을 입력하세요');
				event.preventDefault();
				$("#content").focus();
			}
		});

		$('#boardList').click(function(){
			location.href="boardList.jsp?userNo="+<%=userNo%>;
		});
		
		
	});
</script>
<div class="listBody">
	<div id="titleH"><h2>글작성</h2></div>
	<div>
		<form action="boardWrite_ok.jsp" method="post" id="frmWrite">
		<input type="hidden" name="userNo" value="<%=userNo%>">
		<div class="titleDiv">
			<label>제목 : </label>
			<input type="text" name="title" class="title">&nbsp;
		</div>
		<textarea name="content" id="content" cols="114" rows="30"></textarea>
		<div class="btnList">
			<input type="submit" value="확인" class="btn11">
			<input type="button" value="취소" class="btn11" id="boardList">
		</div>
	</form>
	</div>
</div>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>
