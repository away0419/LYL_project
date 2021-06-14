<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>

<style>
	.listBody{
		width: 1000px;
		height: 700px;
		margin: 10px auto;
		padding-top: 20px;
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

	table{
		width: 1000px;
		border-collapse: collapse;
	}
	
	th{
		text-align: center;
	}
	
	th > div{
		background: lightgray;
		height: 35px;
		padding-top: 5px;
		margin: 10px 5px;
		border-radius: 30px;
		
	}
	
	td{
		height: 40px;
		background: rgb(242, 242, 242);
		border-radius: 30px;
		text-align: center;
	}
	
	.upload{
		width: 90px;
		height: 40px;
		float: right;
		color: white;
		font-weight: bold;
		border-radius: 30px;
		background: #0d6efd;
		border: 0px;
		
	}
</style>

<div class="listBody">
	<button class="upload">글쓰기</button>
	<div class="titleH"><h3>게시판</h3></div>
	<table class="box2">
		<colgroup>
			<col style="width:9%;" />
			<col style="width:54%;" />
			<col style="width:14%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />      
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><div>번호</div></th>
				<th scope="col"><div>제목</div></th>
				<th scope="col"><div>작성자</div></th>
				<th scope="col"><div>작성일</div></th>
				<th scope="col"><div>조회수</div></th>
			</tr>
		</thead> 
		<tbody>
			<!-- 게시글이 없을 경우 -->
			<td colspan="5">작성된 게시글이 없습니다.</td>

			<!-- 게시글이 있을 경우 -->
			<tr>
				<!-- 반복 시작 -->
				<!-- 반복 끝 -->
			</tr>
		</tbody>
	</table>
</div>
<%@ include file="bottom.jsp" %>