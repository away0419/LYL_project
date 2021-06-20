<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap-sb-admin-gh-pages/inc/top.jsp"%>

<style>
	.listBody{
		width: 1000px;
		height: auto;
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
	
	.title{
		text-align: left;
		padding-left: 30px;
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
		width: 120px;
		height: 40px;
		float: right;
		color: white;
		font-weight: bold;
		border-radius: 30px;
		background: #0d6efd;
		border: 0px;
		
	}
	
	.pageDiv{
		text-align: center;
	}
	.pageI{
		color: black;
		text-decoration: none;
		font-size:20px;
	}
</style>
<script type="text/javascript" src="/../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$(function(){
		$('.upload').click(function(){
			location.href="boardWrite.jsp";
		});
	});
</script>
<%
	//[1] myPage.jsp에서 [게시판]버튼 클릭해서 get방식으로 이동
	// 1. 파라미터 읽어오기
	
	// 2. DB
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = null;
	try{
		list=dao.selectAllBoard();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
	
%>
<script type="text/javascript" src="/../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$(function(){
		$('#upload').click(function(){
			location.href="boardWrite.jsp";
		});
	});
</script>
<div class="listBody">
	<button class="upload">게시글 작성</button>
	<div class="titleH"><h3>게시판</h3></div>
	
	<table class="box2">
		<colgroup>
			<col style="width:15%;" />
			<col style="width:54%;" />
			<col style="width:14%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />      
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><div>작성자</div></th>
				<th scope="col"><div>제목</div></th>
				<th scope="col"><div>작성일</div></th>
				<th scope="col"><div>조회수</div></th>
			</tr>
		</thead> 
		<tbody>
			<!-- 게시글이 없을 경우 -->
			<%if(list==null || list.isEmpty()){ %>
		         <tr>
		            <td colspan="5" class="align_center">데이터가 없습니다.</td>
		         </tr>
	     	 <%}else{ %>
					<!-- 게시글이 있을 경우 -->
				<% for(int i=0;i<list.size() ;i++){ 
					BoardVO vo=list.get(i); //0, 5, 10, 15 
				%>
					<tr>
						<td><%=vo.getUserId() %></td> <!-- 내용이 이름으로 가는 이유 모름 -->
						<td class="title"><a href="countUpdate.jsp?boNo=<%=vo.getBoNo() %>"><%=vo.getBoTitle() %></a></td>
						<td><%=sdf.format(vo.getBoDate()) %></td>
						<td><%=vo.getBoHits() %></td>
					</tr>
				
				<% } //for%>
			<%}//if%>
		</tbody>
	</table>
</div>
<%@ include file="/../startbootstrap-sb-admin-gh-pages/inc/bottom.jsp" %>