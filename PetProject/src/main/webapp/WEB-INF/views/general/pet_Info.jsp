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
	font-family: 'omyu_pretty';
	font-size: 1.2em;
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
	padding: 5px 20px;
	font-weight: bold;
}

.table td:first-child {
	text-align: right;
	font-size:1.1em;
}

#photoRegi {
	background-color: rgb(255, 251, 224);
	border: 1px solid #cccccc;
	padding: 5px;
	text-align: center;
}

input[type="text"], input[type="date"] {
	width: 70%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#menu { font-family: 'KOTRAHOPE'; font-size:2.2em; }
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


<form action="${myctx}/general/user/petregi" method="post" enctype="multipart/form-data">
	<div class="x1">
		<div align="center" class="col-md-8 offset-md-2 my-4">
			<h2 id="menu">내 반려동물 정보</h2>
		</div>
		<div class="x2">
			<img src="#<!-- 값 들어갈 곳 -->" align="middle">
		</div>
		<br> <input type="file" value="사진 등록" name="pfile" id="photoRegi">

		<div class="x3">
			<table class="table table-borderless">
				<tr>
					<td>닉네임</td>
					<td><input type="text" class="form-control" name="nickname"
						id="nickname" value="${loginUser.nickname}" readonly></td>
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
					<td><input type="date" class="form-control" name="bday" id="bday"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td style="text-align: left;">
						<input type="radio" name="gender" value="남">남 
						<input type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<td>몸무게</td>
					<td>
						<input type="number" class="form-control" name="weight" id="weight"
								placeholder="kg" style="width: 30%;"></td>
				</tr>
				<tr>
					<td>특이사항</td>
					<td>
						<textarea class="form-control" rows="5" name="particulars"
							id="particulars" placeholder="펫시터가 알아야 할 특이사항을 입력해주세요."></textarea>
					</td>
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
