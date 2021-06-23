<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>
<style>
	.listBody{
		background: lightgray;
		width: 1000px;
		height: auto;
		margin: 10px auto;
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
		width: 350px;
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
<script type="text/javascript" src="/../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			location.href="myPage.jsp";
			alert('업로드 취소');
		});
		
		$('form[name=videoUpfrm]').submit(function() {
			if($('#vidFile').val().length<1 && $('#thuFile').val().length<1 && $('#vidurl').val().length<1){
				alert("영상을 업로드 또는 URL을 입력해주세요");
				event.preventDefault();
				return false;
			}
			if($('#theme').val()=="선택"){
				alert("태마를 선택해주세요");
				event.preventDefault();
				return false;
			}
			if($('#vidtitle').val().length<1){
				alert("제목을 입력해주세요");
				event.preventDefault();
				return false;
			}
			if($('#content').val().length<1){
				alert("영상 설명을 입력해주세요");
				event.preventDefault();
				return false;
			}
		});
		
	
		
	});
	
</script>
<div class="listBody">
	<div id="titleH"><h2>영상 업로드</h2></div>
		<div>
			<form name="videoUpfrm" action="videoUp_ok.jsp" method="post" enctype="multipart/form-data" >
				<div class="titleDiv">
					<label>태마 선택 : </label>
					<select id="theme" class="form-select-border-width:20px" aria-label="Default select example" name="theme">
					  <option selected>선택</option>
					  <option value="1">게임</option>
					  <option value="2">영화</option>
					  <option value="3">학습</option>
					  <option value="4">스포츠</option>
					  <option value="5">기타</option>
					</select>
					<label>제목 : </label>
					<input id="vidtitle" type="text" class="title" name="title">
				</div>
				<textarea id="content" cols="114" rows="15" name="content"></textarea>
				<div class="mb-3 ms-5 me-5">
				  <label for="vidFile" class="form-label">영상을 업로드해주세요</label>
				  <input class="form-control" type="file" id="vidFile" name="upfile">
				</div>
				<div class="mb-3 ms-5 me-5">
				  <label for="thuFile" class="form-label">미리보기 업로드해주세요</label>
				  <input class="form-control" type="file" id="thuFile" name="thuFile">
				</div>
				<div class="mb-3 ms-5 me-5">
				  <label for="vidurl" class="form-label">유튜브 URL(영상아래쪽 공유버튼을 통해서 가져와주세요)</label>
				  <input type="text" class="form-control" id="vidurl" name="vidurl">
				</div>
				<div class="btnList">
					<input type="submit" value="확인" class="btn11">
					<input type="button" value="취소" class="btn11" id="cancel">
				</div>
			</form>
		</div>
</div>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>
