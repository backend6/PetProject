<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
	.jumbotron, .navbar, footer {
		display: none;
	}
</style>

	
<%-- <script type="text/javascript" src="${myctx}/js/chat.js"></script> --%>

<script type="text/javascript">

</script>

<style>
	#infoBox {
		width: 95%;
		height: 470px;
		margin: 0 auto;
		box-shadow: 0 0 10px #8EDBA3 /* rgba(0, 0, 0, 0.1) */;
		border-radius: 5px;
		padding: 20px;
	}
	
	
	#petInfo {
		width: 100%;
		height: 390px;
		margin: 30px auto;
		/* border: 1px solid black; */
		overflow: auto;
	}
	
	#infoT { hegiht: 100%; }
	
	#infoT td {
		padding:8px;
	}
	
</style>


	<div id="infoBox" class="text-center">
		<h3 style="font-family: 'omyu_pretty';">{ '닉네임' }님 펫 정보</h3>

		<div id="petInfo">
			<table class="table table-bordered" id="infoT">
				<tr>
					<td rowspan="7" style="width: 45%; vertical-align: middle; ">사진</td>
					<td style="width: 20%;">이름</td>
					<td>반려동물 이름</td>
				</tr>
				<tr>
					<td>종류</td>
					<td>반려동물 종류</td>
				</tr>
				<tr>
					<td>세부 종</td>
					<td>반려동물 세부 종</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>반려동물 성별</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>반려동물 생일</td>
				</tr><tr>
					<td>몸무게</td>
					<td>반려동물 몸무게</td>
				</tr>
				<tr>
					<td>특이사항</td>
					<td >반려동물 특이사항 ~~~~~~~~</td>
				</tr>
			</table>
		</div> 
		

	</div>
	