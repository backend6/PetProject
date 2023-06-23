<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#intro { margin-top: 80px;}
	.main-img { width: 300px; }
	.table { margin-bottom: 150px; }
	a { color: inherit; }
.box {
    border: 3px solid pink;
    border-radius: 6px;
    width: 220px;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 400px;
}
.more:hover{
	text-decoration: none;
	color: blue;
	font-weight: bold;
}

.rounded {
	max-width: 200px; 
	max-height: 200px; 
	height: auto;
	display: block; 
	margin: -3px auto 0;
}

</style>

<div class="row">
	<div class="col-md-10 offset-2 " id="intro">
		<table class="table table-borderless">
			<tr>
				<td style="vertical-align:bottom; font-size: 1.7em; width:50%;">
					<b>(사이트 이름) 이란?</b>
				</td>
				<td rowspan="2" style="width:50%;">
					<img src="${myctx}/images/pet1.jpg" class="main-img">
				</td>
			</tr>
			<tr>
				<td style="font-size:1.1em;">
					혼자 지낼 반려동물, 많이 걱정되시죠?<br>이젠 걱정하지 말고, 믿고 맡길 수 있는 펫시터를 찾아보세요!
				</td>
			</tr>
		</table>
		
		<table style="width:80%;">
			<tr>
				<td style="font-size: 1.3em;" colspan="3" ><b>펫시터</b></td>
				<td style="text-align:right;"><a href="${myctx}/shop/find" class="more">더보기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
			</tr>
			<tr style="height:20px;"></tr>
			<tr>
			  	<td>
			    	<div class="box">펫시터1</div>
			 	</td>
			  	<td>
			    	<div class="box">펫시터2</div>
			  	</td>
			  	<td>
			    	<div class="box">펫시터3</div>
			  	</td>
			  	<td>
			    	<div class="box">펫시터4</div>
			  	</td>
			</tr>
		</table>
		<br>
		<br>
		<table style="width:80%;">
			<tr>
				<td style="font-size: 1.3em;" colspan="4" ><b>이용 후기</b></td>
			</tr>
			<tr style="height:20px;"></tr>
			<tr>
			  	<td>
			    	<div class="box">
						<div>
					    	<img src="resources/board_upload/${reviewBoard[0].rfile}" alt="리뷰 이미지" class="rounded">
					      	<p>${reviewBoard[0].nickname}님 후기 ${reviewBoard[0].star}점</p>
					      	<p>${reviewBoard[0].content}</p>
					      	<p>가장 최근 후기</p>
					    </div>
			    	</div>
			 	</td>
			  	<td>
			    	<div class="box">
						<div>
					    	<img src="resources/board_upload/${reviewBoard[1].rfile}" alt="리뷰 이미지" class="rounded">
					      	<p>${reviewBoard[1].nickname}님 후기 ${reviewBoard[1].star}점</p>
					      	<p>${reviewBoard[1].content}</p>
					    </div>
			    	</div>
			  	</td>
			  	<td>
			    	<div class="box">
						<div>
					    	<img src="resources/board_upload/${reviewBoard[2].rfile}" alt="리뷰 이미지" class="rounded">
					      	<p>${reviewBoard[2].nickname}님 후기 ${reviewBoard[2].star}점</p>
					      	<p>${reviewBoard[2].content}</p>
					    </div>
			    	</div>
			  	</td>
			  	<td>
			    	<div class="box">
			    		(예시)<br>
			    		[사진]<br>
			    		***님 후기 ★★★★★<br>
			    		케어해주셔서 감사합니다 ~<br>
			    		믿고 맡길 수 있었습니다 ~<br>
			    		
			    		
			    	
			    	</div>
			  	</td>
			</tr>
		</table>
	
	</div>
</div>


