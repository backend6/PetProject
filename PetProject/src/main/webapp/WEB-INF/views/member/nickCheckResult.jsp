<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.jumbotron, .navbar {
	display: none;
}
</style>
<!--  ------------------------------------ -->
<script type="text/javascript" src="./js/memberCheck.js"></script>
<!--  ------------------------------------ -->


<c:if test="${result eq 'fail'}">
	<div class="container m2" style="margin-top: 2em">
		<h3>
			닉네 [<span class="text-danger">${nickname}</span>]은 이미 사용 중입니다.
		</h3>
		<br>
		<form name="nickf" action="nickCheck" method="post">
			<label for="nickname">닉네임</label> <input type="text" name="nickname"
				id="nickname" class="form-control" placeholder="User nickname"
				autofocus="autofocus">
			<button type="button" class="btn btn-warning" onclick="nick_check()">확
				인</button>
		</form>
	</div>
</c:if>

<c:if test="${result eq 'success'}">
	<div class="container m2" style="margin-top: 2em">
		<h3>
			닉네임 으로 [<span class="text-primary">${nickname}</span>]을 사용할 수 있습니다.
		</h3>
		<br>
		<button class="btn btn-success" onclick="set_nickname('${nickname}')">닫
			기</button>
	</div>
</c:if>