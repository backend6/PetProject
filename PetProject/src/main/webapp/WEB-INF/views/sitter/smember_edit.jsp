<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- js파일 참조-------------------------------- -->
<script type="text/javascript" src="${myctx}/js/memberCheck.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${myctx}/js/post.js"></script>
<!-- ------------------------------------------ -->

<style>
body {
	/* font-family: Arial, sans-serif; */
	/* background-color: #FFCD4A; */
	margin: 0;
	padding: 0;
}

.container {
	max-width: 500px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px #FFCD4A /* rgba(0, 0, 0, 0.1) */;
	border-radius: 5px;
	margin-top: 50px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
	font-family: 'omyu_pretty';
	font-size: 1.2em;
}

.form-group2 {
	margin-bottom: 15px;
	display: flex;
	justify-content: center;
	font-family: 'omyu_pretty';
	font-size: 1.3em;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"], input[type="address"],input[type="date"] {
	width: 60%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="email"] {
	width: 35%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="tel"] {
	width: 25%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

select {
	width: 20%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#btn {
	width: 90%;
	padding: 10px;
	background-color: #FFB600;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

#btn:hover {
	background-color: #FFCD4A;
}

.error-message {
	color: #ff0000;
	margin-top: 10px;
}

.btn {
	padding: 5px;
	font-size: 0.9em;
	margin-left: 5px;
}
#menu { font-family: 'KOTRAHOPE'; font-size:2.7em; }
</style>
</head>
<body></body>
<div class="container">
	<h2 id="menu">
		회원정보 수정
	</h2>
	<form name="form" action="${myctx}/sitter/user/editS" method="POST">
	<input type="hidden" name="idx" value="${user.idx }">
		<div class="form-group">
			<label for="id">아 이 디 :</label> 
			<input type="text" id="id" name="mid" value="${user.mid}" readonly required>
		</div>
		<div class="form-group">
			<label for="password">비 밀 번 호 :</label> 
			<input type="password"
				id="password" name="pwd" required placeholder="8~16자 대,소,특수문자 모두 포함">
		</div>
		<div class="form-group">
			<label for="confirmPassword">비 밀 번 호 확 인 :</label> 
			<input type="password" id="confirmPassword" name="confirmPwd" required>
		</div>
		<div class="form-group">
			<label for="nickname">닉 네 임 :</label> 
			<input type="text" id="nickname" name="nickname" required placeholder="특수문자 사용 불가"
					value="${user.nickname}" readonly>
			<button type="button" onclick="open_nickcheck()"
				class="btn btn-outline-info">중복체크</button>
		</div>
		<div class="form-group">
			<label for="email">이메일:</label>
			<input type="text" id="email" name="email" required value="${user.email}">
		</div>

		<script>
			function updateEmailInput() {
				var emailSelect = document.getElementById("emailSelect");
				var emailInput = document.getElementById("emailad");

				if (emailSelect.value === "self") {
					emailInput.value = ""; // 직접 입력을 위해 입력 필드를 비웁니다.
					emailInput.removeAttribute("disabled");
				} else {
					emailInput.value = emailSelect.value;
					emailInput.setAttribute("disabled", "disabled");
				}
			}
		</script>
		<div class="form-group">
			<label for="name">이 름 :</label> 
			<input type="text" id="name" name="uname" value="${user.uname}" required>
		</div>
		<div class="form-group">
			<label for="phone"> 휴 대 폰 번 호 :</label> 
			<input type="tel" id="ph1" name="tel1" value="${user.tel1}" required> 
				<input type="tel" id="ph2" name="tel2" value="${user.tel2}" required> 
				<input type="tel" id="ph3" name="tel3" value="${user.tel3}" required>
		</div>
		<div class="form-group">
			<label for="dob">생 년 월 일 :</label> 
			<input type="date" id="dob" name="birthday" value="${user.birthday}" readonly required>
		</div>
		<div class="form-group">
			<label for="address"> 주 소 :</label> 
				<input type="text" id="sample6_postcode" name="post" placeholder="우편번호" 
					style="width: 40%; margin-bottom: 5px;" value="${user.post}" readonly> 
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
						class="btn btn-outline-info"><br> 
				<input type="text" id="sample6_address" name="addr1" placeholder="주소"
					style="width: 70%; margin-bottom: 5px;" value="${user.addr1}" readonly><br> 
				<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소"
					style="width: 70%; margin-bottom: 5px;" value="${user.addr2}"> 
				<input type="text"
					id="sample6_extraAddress" name="detail" placeholder="참고항목"
					style="width: 70%" readonly>
					<!-- addr3 컬럼 추가하고 여기도 넣어줘야 할 듯 -->
		</div>
		<div class="form-group">
				<label for="expert">전 문 가 확 인 :</label> 
				<select id="expert" name="slicense">
					<option value="vet">수의사</option>
					<option value="trainer">훈련사</option>
					<option value="beautician">미용사</option>
					<option value="sitter">시터교육수료</option>
				</select>
				<input type="file" class="form-control-file-borderss" name="lfile" id="certification">
			</div>
			<div class="form-group">
				<label for="experience">경 험 :</label>
				<textarea id="experience" name="experience" rows="4" required
					placeholder="반려동물을 키운 경험이나, 돌봄이력 등을 자유롭게 기재 하세요."
					value="${user.experience}"></textarea>
			</div>

		<div class="form-group2">
		
			<button type="button" id="btn" onclick="member_check()">회원정보 수정</button>
		</div>
		<div class="error-message">
			<!-- error message  -->
		</div>
	</form>

</div>

