<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.jumbotron, .navbar {
	display: none;
}
</style>

<script type="text/javascript" src="./js/memberCheck.js"></script>


<div class="container m2" style="margin-top: 2em">
	<form name="nickf" action="nickCheck" method="post">
		<label for="nickname">닉네임</label> <input type="text" name="nickname" id="nickname"
			class="form-control" placeholder="User nickname" autofocus="autofocus">
		<button type="button" class="btn btn-success" onclick="nick_check()">확
			인</button>
	</form>
</div>
