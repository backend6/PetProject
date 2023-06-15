<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.t1{
	margin-top:50px;
	margin-bottom:100px;
	text-align:center;
	padding:30px;
}
.t2{
	background-color:rgb(255, 251, 224);
	padding:20px;
	text-align:left;
	height:250px;
	margin-bottom:50px;
	width:45%;
	float:left;
}
.t3{
	background-color:rgb(243, 232, 166);
	padding:20px;
	text-align:left;
	height:250px;
	margin-bottom:50px;
	width:45%;
	float:right;
}
.t4{
	background-color:rgb(255, 251, 224);
	padding:20px;
	text-align:left;
	height:300px;
	width:45%;
	float:left;
	width:45%;
	margin-bottom:50px;
}
.t5{
	background-color:rgb(243, 232, 166);
	padding:20px;
	text-align:left;
	height:300px;
	width:45%;
	float:right;
	margin-bottom:50px;
}
.t6{
	background-color:rgb(243, 232, 166);
	padding:20px;
	text-align:left;
	height:350px;
	width:45%;
	float:left;
	
}
.t7{
	background-color:rgb(243, 232, 166);
	padding:20px;
	text-align:left;
	height:350px;
	float:right;
	width:45%;
}
a{
	float:right;
}
.i1{
	height:150px;
	width:150px;
	float:left;
	margin-right:20px;
	clear:both;
	background-color:gray;
}
.i2{
	height:150px;
	width:150px;
	float:left;
	margin-right:20px;
	clear:both;
	background-color:gray;
	display: inline-block;
}

.i3{
	height:150px;
	width:150px;
	float:left;
	margin-right:40px;
	clear:both;
	background-color:gray;
	display: inline-block;
}

span.ingredient {
    color: #f00;
    
.map-frame{
  text-align: center;
  margin: 50px 0;
}

.map-content{
  width:50px;
  margin: auto;
  border-radius:10px;
  overflow: hidden;
  
}
}
</style>
<div class="t1">
	<b style="font-size:2em;">마이페이지 <span style="color:rgb(51, 135, 203)">(일반회원)</span></b>
	<br>
	<a href="#">회원정보수정</a>
	<br><br>
</div>
	<div class="t2">
		<b>내 반려동물 정보</b>
		<a href="#">등록/수정</a>
		<br><br>
		<div class="i1">
			<img src="#<!-- 값 들어갈 곳 -->"><br><br><br><br><br><br><br><br>
			<b>특이사항 :</b>
		</div>
		<b>이름 : </b><!-- 값 들어갈 곳 -->
		<br>
		<b>종류 : </b><!-- 값 들어갈 곳 -->
		<br>
		<b>세부 종 : </b><!-- 값 들어갈 곳 -->
		<br>
		<b>성별 : </b><!-- 값 들어갈 곳 -->
		<br>
		<b>태그 : </b><!-- 값 들어갈 곳 -->
		<br>
		<b>생년월일 : </b><!-- 값 들어갈 곳 -->
		<br>
		<b>몸무게 : </b><!-- 값 들어갈 곳 -->
		<br>
	</div>
	<div class="t3">
		<b>찜 목록</b>
		<a href="#">더보기</a>
		<br><br>
		<b><span class="ingredient">&#10084;</span>닉네임</b><br> &nbsp;&nbsp; 날짜:<br>&nbsp;&nbsp; 한줄소개:<br>
        <b><span class="ingredient">&#10084;</span>닉네임</b><br> &nbsp;&nbsp; 날짜:<br>&nbsp;&nbsp; 한줄소개:<br>
        <b><span class="ingredient">&#10084;</span>닉네임</b><br> &nbsp;&nbsp; 날짜:<br>&nbsp;&nbsp; 한줄소개:<br>
	</div>
	<div class="t4">
		<b>이용 내역 및 리뷰</b>
		<a href="#">더보기</a><br><br>
		<b>팻시터 닉네임:</b> &nbsp;&nbsp; <b>이용 날짜:</b> &nbsp;&nbsp;<input type="submit" value="리뷰쓰기"><br><br>
        <b>팻시터 닉네임:</b> &nbsp;&nbsp; <b>이용 날짜:</b> &nbsp;&nbsp;<input type="submit" value="리뷰쓰기"><br><br>
        <b>팻시터 닉네임:</b> &nbsp;&nbsp; <b>이용 날짜:</b> &nbsp;&nbsp;<input type="submit" value="리뷰쓰기"><br><br>
        <b>팻시터 닉네임:</b> &nbsp;&nbsp; <b>이용 날짜:</b> &nbsp;&nbsp;<input type="submit" value="리뷰쓰기">
	</div>
	<div class="t5">
		<b>채팅 내역</b>
		<a href="#">삭제</a>
		<br><br>
		
		<input type="checkbox" name="service" value="#<!-- 값 들어갈 곳 -->"> <b>닉네임:</b> 마지막 채팅 날짜:<br><br>
		<input type="checkbox" name="service" value="#<!-- 값 들어갈 곳 -->"> <b>닉네임:</b> 마지막 채팅 날짜:<br><br>
		<input type="checkbox" name="service" value="#<!-- 값 들어갈 곳 -->"> <b>닉네임:</b> 마지막 채팅 날짜:<br><br>
		<input type="checkbox" name="service" value="#<!-- 값 들어갈 곳 -->"> <b>닉네임:</b> 마지막 채팅 날짜:<br><br>
		<input type="checkbox" name="service" value="#<!-- 값 들어갈 곳 -->"> <b>닉네임:</b> 마지막 채팅 날짜:
	</div>
	<div class="t6">
	   <b>돌봄 기록</b>
	   <a href="#">더보기</a>
	   <br><br>
		<div class="i2">
			<img src="#<!-- 값 들어갈 곳 -->"> 
		</div>
		<b>태그 : </b><!-- 값 들어갈 곳 -->
		<br><br>
		<b>생년월일 : </b><!-- 값 들어갈 곳 -->
		<br><br>
		<b>몸무게 : </b><!-- 값 들어갈 곳 -->
		<br><br><br><br>
		<div class="i2">
			<img src="#<!-- 값 들어갈 곳 -->"> 
				</div>
		<b>태그 : </b><!-- 값 들어갈 곳 -->
		<br><br>
		<b>생년월일 : </b><!-- 값 들어갈 곳 -->
		<br><br>
		<b>몸무게 : </b><!-- 값 들어갈 곳 -->
	</div>
    <div class="t7">
       <b>우리 동네 정보</b>
	   <a href="#">등록/수정</a>
	   	   <br><br>
	   <div class="map-frame">
	     <div class="map-content">
	     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.4265244579956!2d127.02601207645192!3d37.497857228062216!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca159effab6a1%3A0x2c7fcbe64938c1ad!2z7Iqk7YOA67KF7IqkIOqwleuCqFLsoJA!5e0!3m2!1sko!2skr!4v1686754047184!5m2!1sko!2skr" width="225" height="225" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe><br>
         <b>주소 : </b>
	     </div>
	    
	   </div>
	 
    </div>
	    

</div>
<div style="clear:both; margin-bottom:50px"></div>
</html> 