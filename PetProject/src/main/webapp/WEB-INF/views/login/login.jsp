<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style>
body {
	/* font-family: Arial, sans-serif; */
	/* background-color: #FFCD4A; */
	margin: 0;
	padding: 0;
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px #FFCD4A /* rgba(0, 0, 0, 0.1) */;
	border-radius: 5px;
	margin-top: 100px;
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

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
	width: 95%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	width: 95%;
	padding: 10px;
	background-color: #FFB600;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #FFCD4A;
}

.error-message {
	color: #ff0000;
	margin-top: 10px;
}
a { color: inherit; font-weight: bold; }

#menu { font-family: 'KOTRAHOPE'; font-size:2.7em; }
#regi { font-family: 'omyu_pretty'; font-size: 1.2em;}
</style>
</head>
<body>
    <div class="container">
        <h2 id="menu">로그인</h2>
        <form action="${myctx}/login" method="POST" onsubmit="return logincheck()">
            <div class="form-group">
                <label for="username">아이디:</label>
                <input type="text" id="username" name="mid" value="${cookie['mid'].value}" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="saveId">
                    <input type="checkbox" name="saveId" id="saveId" ${cookie['mid'] ne null ? 'checked' : ''}>
                    아이디 저장
                </label>
            </div>
            <div class="form-group">
                <input type="submit" value="로그인">
            </div>
            	<div>
		<a href="${myctx}/check" id="regi">회원가입</a>
		
		</div>

	  </form>
	  
	</div>

			
      
  
    <script>

        // "아이디 저장" 체크박스 요소를 가져옵니다.
        var saveIdCheckbox = document.getElementById('saveId');

        // 폼이 제출될 때 "아이디 저장" 쿠키를 설정합니다.
        document.querySelector('form').addEventListener('submit', function () {
            if (saveIdCheckbox.checked) {
                document.cookie = 'mid=' + encodeURIComponent(document.getElementById('username').value) + '; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/';
            } else {
                // "아이디 저장" 쿠키를 삭제합니다.
                document.cookie = 'mid=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/';
            }
        });

    </script>
</body>