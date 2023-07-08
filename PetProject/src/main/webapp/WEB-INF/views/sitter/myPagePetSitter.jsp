<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	font-family: 'omyu_pretty';
	font-size: 1.2em;
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
	height:460px;
	float: left;
	border-radius:20px;
	width: 100%;
}
.v4{
	background-color:rgb(255, 251, 224);
	padding:20px;
	text-align:left;
	height:300px;
	width:49%;
	float:left;
	border-radius:20px;
	margin-bottom:30px;
}
.v5{
	background-color:rgb(243, 232, 166);
	padding:20px;
	text-align:left;
	height:300px;
	width:49%;
	float:right;
	border-radius:20px;
	margin-bottom:30px;
}
a{
	float:right;
	color:inherit;
}
.i{
	height:150px;
	width:150px;
	float:left;
	margin-top:10px;
	margin-right:20px;
	clear:both;
	background-color:gray;
}
.i2{
	height: 90%;
	width:50%;
	float:left;
	margin-top:10px;
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

#usedT { text-align: center;  }

#usedT tr:first-child { font-size: 1em; color: #5D5D5D; }

#onPet:hover { cursor: pointer; font-weight:bold; }

.t { margin: 0 auto; text-align: center;}

.small { font-size: 1.1em; }
.medium { font-size: 1.2em; }
.large { font-size: 1.3em; }

#menu { font-family: 'KOTRAHOPE'; font-size:2.2em; }

</style>

<script>
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
						<%long diff = Math.abs(newDate.getTime() - oldDate.getTime());%>
						<%double x = Math.floor(diff / (1000 * 60 * 60 * 24));%>
						<%int y=(int)x;%>
						<%int z=y;%>
						<%if(y>0){ z=y+1; }%>
						<%if(y<1){ z++; }%>
						
						<%SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");%>
						
						
						<%Calendar cal = Calendar.getInstance();%>
						<%cal.setTime(oldDate);%>
						
						
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

							<%cal.add(Calendar.DATE,w);%>						
							<%String test = simpleDateFormat.format(cal.getTime()); %>
							
			            	title : '<%=vo.getUnickname()%>',
			                start : '<%=test%>',
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

<script>
	// 엥 이거 하면 달력 안뜨나 확인해바..
	// 돌봄일정에서 이용자 닉네임 클릭하면 정보 팝업
	let win = null;
	function userAlert(value){
		var url='${myctx}/sitter/user/userAlert?pno='+value;
		win = window.open(url, "userAlert", "width=600, height=570, left=400, top=150");
	} 
</script>

<div class="v">
	<div align="center" class="col-md-8 offset-md-2 my-4" >
		<h2 id="menu">${loginUser.mid} 시터님 마이페이지 </h2>
	</div>
	
	<a href="${myctx}/sitter/user/editS">회원정보수정</a>
	<br><br>
	
	<div class="v2">
		<b style="font-size:1.1em;">내 소개</b>
		<a href="${myctx}/sitter/user/introDetail">등록/수정</a>
		<br>
		<c:set var="sv" value="${svo}"/>
		<c:if test="${not empty sv}">
			<c:forEach var="introduce" items="${svo}">
				<div class="i">
					<img src="../../resources/upload/${introduce.ifile}" height=150px width=150px;>
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
	
	<div class="v4">
		<b style="font-size:1.1em;">이용 요금 설정</b>
		<a href="${myctx}/sitter/user/record">설정하기</a>
		<br><br>
		<table class="t">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td style="font-size: 0.9em; color: darkgray;">1박케어 | 데이케어</td>
			</tr>
			<tr>
				<td width="15%"><span class="small">🐕</span></td>
				<td width="20%"><span class="small">소형견</span></td>
				<td width="25%"><span class="small" style="color: gray;">7kg 미만</span></td>
				<td width="40%"><span class="small">
					가격 | 가격
				</td>
			</tr>
			<tr>
				<td width="15%"><span class="medium">🐕</span></td>
				<td width="20%"><span class="medium">중형견</span></td>
				<td width="25%"><span class="medium" style="color: gray;">7~14.9kg</span></td>
				<td width="40%"><span class="medium">가격</td>
			</tr>
			<tr>
				<td width="15%"><span class="large">🐕</span></td>
				<td width="20%"><span class="large">대형견</span></td>
				<td width="25%"><span class="large" style="color: gray;">15kg 이상</span></td>
				<td width="40%"><span class="large">가격</td>
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
				</table>
			</div>			
		</form>
	</div>
	
	<div class="v3">
		<b style="font-size:1.1em;">돌봄 일정</b>
		<a href="${myctx}/sitter/user/used">등록/수정</a>
		<br>
		<div class="i2">
			<div id='calendar'></div>
			
		</div>
		<table id="usedT">		
			<tr>
				<td width="35%" style="height: 15px;">
					<b>날짜</b>
				</td>
				<td width="25%"><b>이용자 닉네임</b></td>
				<td width="25%"><b>펫 이름</b></td>
			</tr>
			<tr><td></td></tr>
		<c:forEach var="schedule" items="${svo2}">
			<tr>
				<td width="35%"><b>
					<fmt:formatDate value="${schedule.sdate}" pattern="MM월 dd일"/>				
					 ~ <fmt:formatDate value="${schedule.fdate}" pattern="MM월 dd일"/>
				 </b></td>
				<td width="25%">'${schedule.unickname}'님</td>
				<td width="25%" onclick="userAlert(${schedule.pno})" id="onPet">'${schedule.pname}'</td>
			</tr>			
		</c:forEach>
		</table>
	</div>

</div>

<div style="clear:both; margin-bottom:50px"></div>	