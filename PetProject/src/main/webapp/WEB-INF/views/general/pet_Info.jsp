<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.x1 {
	margin-bottom: 100px;
	text-align: center;
	padding: 30px;
}

.x2 {
	background-color: gray;
	height: 225px;
	width: 200px;
	display: block;
	margin: auto;
	margin-top: 50px;
}

.x3 {
	margin-top: 20px;
	margin-bottom: 100px;
	text-align: center;
	padding: 10px;
}

.table {
	width: 65%;
	margin: auto;
}

.table td {
	vertical-align: middle;
	padding: 5px 10px;
	font-size: 17px;
	font-weight: bold;
}

.table td:first-child {
	text-align: right;
}

#photoRegi {
	font-size: 16px;
	background-color: rgb(255, 251, 224);
	border: 1px solid #cccccc;
	padding: 5px;
}
</style>


<script>
	function check() {		
		if($('#nickname').val()==""){
			alert("이름을 입력하세요");
			$('#nickname').focus();
			return;			
		}
		if($('#pname').val()==""){
			alert("펫 이름을 입력하세요");
			$('#pname').focus();
			return;			
		}
		if($('#species1').val()==""){
			alert("종을 입력하세요");
			$('#species1').focus();
			return;			
		}
		if($('#species2').val()==""){
			alert("세부 종을 입력하세요");
			$('#species2').focus();
			return;			
		}		
		var cnt=$('input[name=gender]:radio:checked').length;
		if(cnt<1){
			alert("성별을 선택하세요");
			return;
		}
		if($('#bday').val()==""){
			alert("생년월일을 입력하세요");
			$('#bday').focus();
			return;			
		}
		
		var obj=$("[name=tagValue]");
		const arr= obj.val().split(" ");
		$('#tag').val(arr);
		
		
		mf.submit();
	}
	
</script>


<form action="${myctx}/general/petregi" method="post" enctype="multipart/form-data">
	<div class="x1">
		<div align="center" class="col-md-8 offset-md-2 my-4">
			<h2 style="font-weight: bold">내 반려동물 정보</h2>
		</div>
		<div class="x2">
			<img src="#<!-- 값 들어갈 곳 -->" align="middle">
		</div>
		<br> <input type="file" value="사진 등록" id="photoRegi">

		<div class="x3">
			<table class="table table-borderless">
				<tr>
					<td>이름</td>
					<td><input type="text" class="form-control" name="nickname"
						id="nickname" value="주인닉네임"></td>
				</tr>
				<tr>
					<td>펫이름</td>
					<td><input type="text" class="form-control" name="pname"
						id="pname"></td>
				</tr>
				<tr>
					<td>종류</td>
					<td><input type="text" class="form-control" name="species1"
						id="species1"></td>
				</tr>
				<tr>
					<td>세부 종</td>
					<td><input type="text" class="form-control" name="species2"
						id="species2"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" class="form-control"
						placeholder="YYYY-MM-DD" name="bday" id="bday"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" name="gender" value="남">남 <input
						type="radio" name="gender" value="여">여</td>
				</tr>
				<tr>
					<td>몸무게</td>
					<td><input type="text" class="form-control" name="weight"
						id="weight"></td>
				</tr>
				<tr>
					<td>특이사항</td>
					<td><textarea class="form-control" rows="5" name="particulars"
							id="particulars">펫시터가 알아야 할 특이사항을 입력해주세요.</textarea></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center">
						<button type="submit" class="btn btn-outline-success" >완료</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>

<!-- <b></b> 
	    <input type="text" class="form-control" style="width: 30%;"><br>
	    <b>종류: </b> 
	    <input type="text" class="form-control" style="width:125px; height:32px;"><br>
	    <b>세부 종: </b> 
	    <input type="text" class="form-control" style="width:125px; height:32px;"><br>
	    <b>성별: </b> 
	    <input type="text" class="form-control" style="width:125px; height:32px;"><br>
	    <b>생년월일: </b> 
	    <input type="text" class="form-control" style="width:125px; height:32px;" placeholder="YYYY-MM-DD"><br>
	    <b>몸무게: </b> 
	    <input type="text" class="form-control" style="width:125px; height:32px;">&nbsp;kg<br><br>
	    <b>특이사항: </b> 
	    <textarea style="width:250px; height:-128px;">펫시터가 알아야 할 반려동물의 특이사항을 입력해주세요.</textarea> -->
</div>
</div>
