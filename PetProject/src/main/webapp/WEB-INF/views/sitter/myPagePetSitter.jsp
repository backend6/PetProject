<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<%@page import="java.util.List"%>
<%@page import="com.sitter.model.SitterVO"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style>
.v{
	margin-bottom:100px;
	text-align:center;
	padding:30px;
}
.v2{
	background-color:rgb(255, 251, 224);
	padding:20px;
	text-align:left;
	line-height:1.7;
	height:250px;
	margin-bottom:30px;
	border-radius:20px;
}
.v3{
	background-color:rgb(243, 232, 166);
	padding:20px;
	text-align:left;
	height:450px;
	margin-bottom:30px;
	border-radius:20px;
}
.v4{
	background-color:rgb(255, 251, 224);
	padding:20px;
	text-align:left;
	height:300px;
	width:49%;
	float:left;
	border-radius:20px;
}
.v5{
	background-color:rgb(243, 232, 166);
	padding:20px;
	text-align:left;
	height:300px;
	width:49%;
	float:right;
	border-radius:20px;
}
a{
	float:right;
	color:inherit;
}
.i{
	height:150px;
	width:150px;
	float:left;
	margin-right:20px;
	clear:both;
	background-color:gray;
}
.i2{
	height: 90%;
	width:50%;
	float:left;
	margin-right:20px;
	clear:both;
	background-color:white;
	font-size: 11px;
	
}
.i3{
	width:100%;
	height:200px;
}

.i3 {
		overflow: auto;
		-ms-overflow-style: none; /* 인터넷 익스플로러 */
		scrollbar-width: none; /* 파이어폭스 */
	}
.i3::-webkit-scrollbar {
	    display: none; /* 크롬, 사파리, 오페라, 엣지 */
	}

.i3 td {
	padding: 5px;
}

.v4 .t td, .v3 table td {
	padding: 5px;
}


</style>
<script>
	function del(){
		/* DB 완료 후 수정할 곳 */
		alert("a");
	}
	/* 달력 */	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height : 370,
			contentHeight : 500,

			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1)
						+ '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator : true, // 현재 시간 마크
			locale : 'ko', // 한국어 설정
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [ 
				<%List<SitterVO> sitterList= (List<SitterVO>) request.getAttribute("sittervo");%>
				<%if (sitterList != null) {%>
					<%for (SitterVO vo : sitterList) {%>
						<%Date oldDate = vo.getSdate();%>
						<%Date newDate = vo.getFdate();%>
						<%Date wDate=new Date();%>
						<%wDate.setDate(oldDate.getDate());%>
						<%long diff = Math.abs(newDate.getTime() - oldDate.getTime());%>
						<%double x = Math.floor(diff / (1000 * 60 * 60 * 24));%>
						<%int y=(int)x;%>
						<%int z=y;%>
						<%if(y>0){ z=y+1; }%>
						
					
					
						<%SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");%>
						<%String sDate = simpleDateFormat.format(vo.getSdate()); %>
						<%String fDate = simpleDateFormat.format(vo.getFdate()); %>
						
						
						<%long col=Math.round(Math.random() * 0xffffff);%>
						<%String co=Long.toString(col,16);%>
						<%int q=1;%>
						
						
						<%for (int i=0; i<z; i++){%>
						{	
							<%int w=i;%>
							<%if(i>=2){
								w=i-q;
								q++;
							}%>
							<%wDate.setDate(wDate.getDate()+w);%>
							<%String xDate = simpleDateFormat.format(wDate); %>
							
			            	title : '<%=vo.getUnickname()%>',
			                start : '<%=xDate%>',
			                <%-- end : '<%=fDate%>', --%>
			                color : '#' + '<%=co%>'
			             },
					<%}
					 }  
				}%>
			]
		});
		calendar.render();
		calendar.updateSize();
	});
	/* 달력 끝 */
</script>
<div class="v">
	<div align="center" class="col-md-8 offset-md-2 my-4" >
		<h2 style="font-weight: bold">마이페이지 (펫시터)</h2>
	</div>
	
	<a href="${myctx}/sitter/editS">회원정보수정</a>
	<br><br>
	<div class="v2">
		<b>내 소개</b>
		<a href="${myctx}/sitter/introduce">등록/수정</a>
		<br><br>
		<c:set var="sv" value="${svo}"/>
		<c:if test="${not empty sv}">
			<c:forEach var="introduce" items="${svo}">
				<div class="i">
					<img src="../resources/upload/${introduce.ifile}" height=150px width=150px;>
				</div>
				<b>닉네임 : ${nickname} 님</b><!-- 로그인한 유저의 정보값 받아서 그중 닉네임 값 받아서 넣을 곳 -->
				<br>
				<b>지역 : ${introduce.addr}</b>
				<br>
				<b>소개 제목 : ${introduce.title}</b>
				<br>
				<b>간단한 소개 (2~3줄) : ${introduce.short_content}</b>
				<br>
				<b>태그 : ${introduce.tag}</b>
			</c:forEach>
		</c:if>
		<c:if test="${empty sv}">
			<b>등록된 내 소개가 없습니다 등록해주세요</b>
		</c:if>
	</div>
	<div class="v3">
		<b>돌봄 일정</b>
		<br><br>
		<div class="i2">
			<div id='calendar'></div>
			
		</div>
		<table>		
		<c:forEach var="schedule" items="${svo2}">
			<tr>
				<td width="35%"><b>
					<fmt:formatDate value="${schedule.sdate}" pattern="MM월 dd일"/>				
					 ~ <fmt:formatDate value="${schedule.fdate}" pattern="MM월 dd일"/>
				 </b></td>
				<td width="25%">'${schedule.unickname}'님</td>
				<td width="25%">'${schedule.pname}'</td>
			</tr>			
		</c:forEach>
		</table>
	</div>
	<div class="v4">
		<b>돌봄 기록 내역</b>
		<a href="${myctx}/sitter/record">더보기</a>
		<br><br>
		<!-- 반복문 들어가는 것으로 수정할 곳 -->
		<table class="t">
			<tr>
				<td width="15%"><b>6/3<!-- 값 수정할 곳 --></b></td>
				<td width="35%"><b>이용자 닉네임<!-- 값 수정할 곳 --></b></td>
				<td width="35%"><b>반려동물 이름<!-- 값 수정할 곳 --></b></td>
			</tr>
			<tr>
				<td colspan="3" style="padding-bottom: 10px;">돌봄 기록 내용 (뭐 했는지, 특이사항 등등)값<!-- 값 수정할 곳 --></td>
			</tr>
			<tr>
				<td width="15%"><b>6/3<!-- 값 수정할 곳 --></b></td>
				<td width="35%"><b>이용자 닉네임<!-- 값 수정할 곳 --></b></td>
				<td width="35%"><b>반려동물 이름<!-- 값 수정할 곳 --></b></td>
			</tr>
			<tr>
				<td colspan="3" style="padding-bottom: 10px;">돌봄 기록 내용 (뭐 했는지, 특이사항 등등)값<!-- 값 수정할 곳 --></td>
			</tr>
			<tr>
				<td width="15%"><b>6/3<!-- 값 수정할 곳 --></b></td>
				<td width="35%"><b>이용자 닉네임<!-- 값 수정할 곳 --></b></td>
				<td width="35%"><b>반려동물 이름<!-- 값 수정할 곳 --></b></td>
			</tr>
			<tr>
				<td colspan="3" style="padding-bottom: 10px;">돌봄 기록 내용 (뭐 했는지, 특이사항 등등)값<!-- 값 수정할 곳 --></td>
			</tr>
			
		</table>
		
	</div>
	<div class="v5">
		<form>
		<b>채팅 내역 (스크롤)</b>
			<a href="javascript:del()">삭제</a>
			<br><br>
			<div class="i3">
				<table>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">------마지막 채팅---------<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
					<tr>
						<td width="10%"><input type="checkbox" name="chat" value="#<!-- 값 들어갈 곳 -->"></td>
						<td width="20%">닉네임<!-- 값 수정할 곳 --></td>
						<td width="50%">마지막 채팅<!-- 값 수정할 곳 --></td>
						<td width="10%">날짜<!-- 값 수정할 곳 --></td>
					</tr>
				</table>
			</div>			
		</form>
	</div>
</div>

<div style="clear:both; margin-bottom:50px"></div>	