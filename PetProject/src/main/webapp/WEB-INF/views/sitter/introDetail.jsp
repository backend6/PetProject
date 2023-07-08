<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
	.row { 
		margin-top: 50px; 
		font-family: 'omyu_pretty';
		font-size: 1.2em; 
	}

	#v1 {
		background-color: #EBFFE3; 
		border-radius:20px; 
		margin-bottom:20px; 
		margin-top: 20px;
		width:80%;
		padding: 10px;
	}
	
	a {
		float:right;
		color:inherit;
		margin-right: 15px;
	}
	
	table img { width: 100%; height: 100%; }
	table td:first-child { font-weight: bold; text-align: center; }
	
	#menu { font-family: 'KOTRAHOPE'; font-size:2.7em; }
	
</style>

<div class="row">
	<div align="center" class="col-md-10 offset-md-1" >
		<h2 id="menu">내 소개</h2>
		<c:if test="${icheck ne 0}">
			<b> </b>
		</c:if>
		<c:if test="${icheck eq 0}">
			<a href="${myctx}/sitter/user/introduce">정보 등록</a>
		</c:if>
	</div>
	
		<div class="container" id="v1">
			<table class="table table-borderless" style="width:100%">
				<c:forEach var="item" items="${svo}">
					<tr>
						<td></td>
						<td style="width:15%; text-align:center;"><b>소개제목</b></td>
						<td>${item.title}</td>
						<td style="text-align:right;"><a href="#">수정</a></td>
					</tr>
					<tr>
						<td rowspan="4" style="width:25%">
							<img src="${myctx}/resources/upload/${item.ifile}">
						</td>
						<td style="text-align:center;"><b>간단한 소개</b></td>
						<td colspan="2">${item.short_content}</td>
					</tr>
					<tr>
						<td>지역</td>
						<td colspan="2">${item.addr}</td>
					</tr>
					<tr>
						<td>소개</td>
						<td colspan="2">${item.content}</td>
					</tr>
					<tr>
						<td>제공 서비스</td>
						<td colspan="2">${item.service}</td>
					</tr>
					<tr>
						<td></td>
						<td style="text-align:center;"><b>태그</b></td>
						<td colspan="2">${item.tag}</td>
					</tr>
					
				</c:forEach>
			</table>
		</div>
			
		
</div>