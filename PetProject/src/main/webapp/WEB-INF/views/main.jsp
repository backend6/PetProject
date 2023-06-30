<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
#intro {
	margin-top: 80px;
}

.main-img {
	width: 300px;
}

.table {
	margin-bottom: 150px;
}

a {
	color: inherit;
}

.box {
    border: 3px solid pink;
    border-radius: 6px;
    width: 90%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 400px;
}
.more:hover{
	border: 1px solid #F2BED1;
	background-color: #F8E8EE;
	border-radius: 20px;
	width: 230px;
	height: 440px;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: 0 0 5px #F2BED1;
}
a:hover {
	text-decoration: none;
}
.more:hover, .st:hover {
	font-weight: bold;
}

.rounded {
	max-width: 210px;
	max-height: 200px;
	height: auto;
	display: block;
	margin: -3px auto 0;
}

.col1 {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
}

.row1 {
	height: 210px;
}

.row2 {
	height: 65px;
	margin-top: 7px;
	margin-bottom: 10px;
	background-color: white;
	padding: 5px 8px 5px 0px;
	border-radius: 10px;
	color: #643843;
}

.row3 {
	height: 125px;
	background-color: #FFFAF4;
	padding-top: 10px;
	padding-bottom: 10px;
	border: 1px solid white;
	border-radius: 10px;
}

.who {
	margin-top: 4px;
	font-size: 13px;
	font-weight: bold;
}

.stars {
	width: 20px;
}
.col3 {
	font-size: 13px;
	width: 100%;
  	max-height: 100px;
  	overflow: hidden;
  	text-overflow: ellipsis;
}
.tb-title {
	font-size: 30px;
	font-weight: bold;
	font-style: italic;
	color: #64CCC5;
	text-shadow: 2px 2px 4px #C9EEFF;
}
</style>

<div class="row">
	<div class="col-md-10 offset-2 " id="intro">
		<table class="table table-borderless">
			<tr>
				<td style="vertical-align: bottom; font-size: 1.7em; width: 50%;">
					<b>(사이트 이름) 이란?</b>
				</td>
				<td rowspan="2" style="width: 50%;"><img
					src="${myctx}/images/pet1.jpg" class="main-img"></td>
			</tr>
			<tr>
				<td style="font-size: 1.1em;">혼자 지낼 반려동물, 많이 걱정되시죠?<br>이젠
					걱정하지 말고, 믿고 맡길 수 있는 펫시터를 찾아보세요!
				</td>
			</tr>
		</table>

	</div>
	
	<div class="col-md-11 offset-1">
		<table style="width:100%; margin-bottom: 150px;">
			<tr>
				<td style="font-size: 1.3em;" colspan="3"><div class="tb-title">Pet sitter</div></td>
				<td style="text-align: right;"><a href="${myctx}/shop/find"
					class="more">더보기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			</tr>
			<tr style="height: 20px;"></tr>
			<tr>
			  	<td style="width:25%">
			    	<div class="box">펫시터1</div>
			 	</td>
			  	<td style="width:25%">
			    	<div class="box">펫시터2</div>
			  	</td>
			  	<td style="width:25%">
			    	<div class="box">펫시터3</div>
			  	</td>
			  	<td style="width:25%">
			    	<div class="box">펫시터4</div>
			  	</td>
			</tr>
		</table>
	</div>
		<br>
		<br>
  
	<div class="col-md-11 offset-1">
		<table style="width:100%;">
			<tr>
				<td style="font-size: 1.3em;" colspan="4"><div class="tb-title">Review</div></td>
			</tr>

			<tr style="height: 20px;"></tr>

			<tr>
        
				<c:if test="${reviewBoard ne null and not empty reviewBoard}">
				<c:forEach var="i" begin="0" end="3">
					<td>
					
						<div class="box">
							<div>
								<div class="container" style="width: 210px;">
									<!-- 1행 -->
									<div class="row row1">
										<div class="col col1">
											<a href="${myctx}/reviewBig?rno=${reviewBoard[i].rno}"><img src="resources/board_upload/${reviewBoard[i].rfile}"
												alt="리뷰 이미지" class="rounded"></a>
										</div>
									</div>
									<!-- 2행 -->
									<div class="row row2">
										<div class="col">
											<div class="who"><a href="${myctx}/reviewBig?rno=${reviewBoard[i].rno}" class="st">&nbsp;${reviewBoard[i].nickname} 님의 후기♥</a></div>
											<div>
												<c:set var="starCount" value="${reviewBoard[i].star}" />
												<c:forEach var="j" begin="1" end="${starCount}">
													<img src="${myctx}/images/star3.png" class="stars">
												</c:forEach>
											</div>
										</div>
									</div>
									<!-- 3행 -->
									<div class="row row3">
										<div class="col col3"><a href="${myctx}/reviewBig?rno=${reviewBoard[i].rno}">${reviewBoard[i].content}</a></div>
									</div>
								</div>
							</div>
						</div>
					</td>
				</c:forEach>
				</c:if>
			</tr>
		</table>

	</div>
</div>

