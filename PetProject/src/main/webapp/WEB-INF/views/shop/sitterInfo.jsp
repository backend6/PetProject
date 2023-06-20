<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	#service td, #review td { padding: 5px; }

</style>

<div class="row">
	<div align="center" class="col-md-8 offset-md-2 my-4" >
		<h2 style="font-weight: bold">펫시터 상세</h2>
	</div>
	
	<div class="col-md-7 offset-sm-1" style="width:70%; margin-bottom:100px;">
		<p style="font-size:1.3em; font-weight:bold; margin-bottom:0;">이용 가능 서비스</p>
		
		<!-- 이 테이블에는 펫시터 소개 등록에서 펫시터가 등록한 서비스만 보여줘야 해요! -->
		<table class="table" id="service" style="width:100%;">
			<tr>
				<td>a</td>
				<td>b</td>
				<td>c</td>
			</tr>
			<tr>
				<td>a</td>
				<td>b</td>
				<td>c</td>
			</tr>
			<tr>
				<td>a</td>
				<td>b</td>
				<td>c</td>
			</tr>
		</table>
	</div>
	
	<div class="col-md-7 offset-sm-1" style="width:70%;">
		<p style="font-size:1.3em; font-weight:bold; margin-bottom:0;">후기 - ?개 </p>
		
		<table class="table table-bordered" id="review" style="width:100%">
			<tr>
				<td colspan="3" style="font-weight: bold; padding-bottom:1px;">닉네임</td>
			</tr>
			<tr>
				<td style="font-size:0.9em; padding-top:1px;">2023년 6월 7일(날짜)</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
			</tr>
			<tr>
				<td style="padding-top:10px;">
					리뷰우 ~~~~~~~~<br> 
					~~~~~~~~~~~~~~~ <br> 
					~~~~~~~~~ 
				</td>
			</tr>
		</table>
		<hr style="color:#eeeeee">
		
		<!-- 후기 개수만큼 반복문 돌리고 여긴 빼기 -->
		<table class="table table-borderless" id="review" style="width:100%">
			<tr>
				<td colspan="3" style="font-weight: bold; padding-bottom:1px;">닉네임</td>
			</tr>
			<tr>
				<td style="font-size:0.9em; padding-top:1px;">2023년 6월 7일(날짜)</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
			</tr>
			<tr>
				<td style="padding-top:10px;">
					리뷰우 ~~~~~~~~<br> 
					~~~~~~~~~~~~~~~ <br> 
					~~~~~~~~~ 
				</td>
			</tr>
		</table>
		
		<div class="text-center">
			<p style="font-size:1em;"><a href="#" style="color:inherit;">후기 더보기</a></p>
		</div>
		
	</div>
	<br>

	
	
</div>