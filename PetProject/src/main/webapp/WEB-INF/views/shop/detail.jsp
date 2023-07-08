<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--jQuery라이브러리 CDN방식으로 참조 ----------------->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- --------------------------------------------- -->

<!--  달력 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!--  달력 예약 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<style>
* { font-family: 'omyu_pretty';}

#on, #under {
	margin: 20px auto;
	width: 85%;
	height: 500px;
	border-collapse: separate;
	border-spacing: 20px;
}

td {
	border: 2px solid lightgray;
	border-radius: 10px;
}

#imgSec {
	position: relative;
	text-align: center;
}

/* img {
	background-color: #efefef;
	width: 100%;
} */

#prev {
	position: absolute;
	top: 50%;
	left: 10px;
	margin-left: 10px;
	background-color: #FFCD4A;
	color: white;
	border: none;
}

#next {
	position: absolute;
	top: 50%;
	right: 10px;
	margin-right: 10px;
	background-color: #FFCD4A;
	color: white;
	border: none;
}

#infoSec {
	padding: 10px;
}

#nickname {
	font-size: 22px;
	font-weight: bold;
}

.heart {
	background-color: white;
	border-color: white;
	float: right;
	cursor: pointer;
	width: 25px;
}

#intro_title {
	font-size: 27px;
	font-weight: bolder;
}

.star {
	float: right;
	margin: 2px;
	margin-top: -5px;
}

#address {
	font-size: 21px;
	font-weight: bold;
}

#introSec{
	padding:20px;
}

#feeSec {
	text-align: center;
}

#fee {
	font-size: 25px;
	font-weight: bold;
}

#question {
	background-color: gray;
	color: white;
	font-size: 15px;
	font-weight: bold;
	border-radius: 10px;
}

#answer{
	border: 2px dashed lightgray;
	border-radius: 5px;
	display: none; 
	width:300px; 
	margin: 0 auto; 
	margin-bottom:-50px;
	font-size: 14px;
}

#q1{
	border: 1px solid lightgray;
	font-size: 12px;
	font-weight: bold;
	color: lightgray;
	border-radius: 20px;
}


#locationSec {
	padding: 25px;
	line-height: 1.8;
}

#under {
	margin-bottom: 100px;
}

#s1 {
	width:70%; 
	margin-bottom:130px; 
	margin-left: 100px;
}

#r1{
	width:70%;
	margin-left: 100px;
}

#service, #review { margin-top: 10px; }

#service td, #review td { padding: 5px; }

.row { margin-bottom: 100px; font-size:1.2em; width: 85%;}

.container-calendar { font-family: 'omyu_pretty'; font-size: 1em; }
#ch { font-family: 'omyu_pretty'; font-size: 1.5em; font-weight: bold; margin-left: 100px; }

.map-content { width: 100%; height: 80%; }
#mbtn { 
	padding: 5px 10px; 
	font-size: 0.9em; 
	margin-bottom: 5px; 
	margin-left: 20px;
}

.small { font-size: 1.1em; }
.medium { font-size: 1.2em; }
.large { font-size: 1.3em; }

</style>

<script type="text/javascript">
        let index=1;
        let result=${SumStar}/${CntStar};
        let star=result.toFixed(1);
        let hid;
        let vis;
        $(()=>{
            $('#prev').click(()=>{
                if(index>2){
                    $('#petImg').attr('src','/images/'+(--index)+'.jpg');
                }
            })
            
            $('#next').click(()=>{
                if(index<60){
                    $('#petImg').attr('src','/images/'+(++index)+'.jpg');
                }
            })  
            
            /* //wish에 들어가 있으면 채워진하트로 표시한다
            if(${getWish}){
            	hid=$('.like:hidden');
                vis=$('.like:visible');
                hid.show();
                vis.hide();
            }
            
            $('.like').click(()=>{
                hid=$('.like:hidden');
                vis=$('.like:visible');
                hid.show();
                vis.hide();
                if(${getWish}){
                	frm.action='deleteHeart';
                	frm.submit();
                }else{
	                frm.action='insertHeart';
	                
	    			frm.submit();
                }
            }) */
            
            
            
            $('.heart').click(function() {
    			
    			let ino = $(this).attr('id');
    			
    			console.log("heart-click");
    			
    			if ($(this).attr('src') == "${myctx}/images/heart.png") {
    				console.log("빈 하트 클릭"+ino);
    				
    				$.ajax({
    					url:'heart.do',
    					type:'get',
    					data:{ino:ino},
    					success: function(res){
    						// alert(JSON.stringify(res));
    						if(res.result>0){
    							console.log("찜 추가 성공");
    						}else if(res.result==-2){
    							alert('로그인을 해야 해요');
    						}
    						
    					},
    					error: function(err){
    						alert('error: '+err.status);
    					}
    					
    				});
    				// 꽉 찬 하트로 이미지 변경
    				$(this).attr("src", "${myctx}/images/full_heart.png");
    				
    			}
    			else {
    				console.log("꽉 찬 하트 클릭"+ino);
    				
    				$.ajax({
    					url:'removeHeart.do',
    					type:'get',
    					data:{ino:ino},
    					success:function(res){
    						// alert(JSON.stringify(res));
    						if(res.result>0){
    							console.log("찜 삭제 성공");
    						}
    						/* let heart = res.heart; (?? vo.heart)
    						console.log("찜 삭제 성공"); */
    					},
    					error: function(err){
    						alert('error: '+err.status);
    					}
    				});
    				// 빈 하트로 이미지 변경
    				$(this).attr("src", "${myctx}/images/heart.png");
    				
    			}
    			
    		})
    
            

            let i;
            for(i=1;i<=star;i++){
                $('#'+i).attr('src','<%=request.getContextPath()%>/images/star3.png');
            }
            if(i-1<star){
                $('#'+i).attr('src','<%=request.getContextPath()%>/images/star2.png');
            }
            $('#review').text('평점('+star+')');
            
            if(lic.value==null){
            	$('#lic').hide();	
            }
            
            
            
            let cnt;
            for(cnt=1;cnt<=${CntReple};cnt++){
	            
            }
            
            if(lic.value==null){
            	$('#lic').hide();	
            }
            
            $('#question').hover(()=>{
            	$('#answer').show();
            },()=>{
            	$('#answer').hide();
            });
            
        })
        
        
    </script>

<table id="on" class="t1">
	<tr>
		<td id="imgSec" rowspan="2" width="50%" style="border: 0">
			<button id="prev">◀️</button>
			<img id="petImg" src="${myctx}/resources/upload/${vo.ifile}" alt="no image" width="100%">
			<button id="next">▶️</button>        
        </td>
		<td id="infoSec" width="50%" height="40%">
			<span id="nickname">${selectNickname } </span>
			<img id="lic" src="<%=request.getContextPath()%>/images/license.png" alt="뱃지" style="width: 25px">
			<form name="frm" id="frm" method="GET">
                        
            </form> 
			<span style="float:right">
				<%-- 찜하기 하트 --%>
				<c:if test="${loginUser eq null}">
					<a href="${myctx}/login">
						<img src="${myctx}/images/heart.png" class="heart" id="${ino}">
					</a>
				</c:if>
				<c:if test="${loginUser ne null}">
					<c:if test="${loginUser.ucheck eq 'S'}">
						<!-- 시터 회원이면 하트 안보이게 -->
					</c:if>
					<c:if test="${loginUser.ucheck eq 'G'}">
						<c:if test="${wish.ino eq item.ino or item.wishNick eq loginUser.nickname}">
							<img src="${myctx}/images/full_heart.png" class="heart" id="${vo.ino}">
						</c:if>
							<c:if test="${wish.ino ne item.ino and item.wishNick ne loginUser.nickname}">
								<img src="${myctx}/images/heart.png" class="heart" id="${vo.ino}">
							</c:if>
					</c:if>	
				</c:if>
			</span>
			<span id="intro_title">${selectTitle }</span>

			<span id="review" style="font-size: 17px; float: right;"></span>
			<div>
				<img id="5" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="4" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="3" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="2" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="1" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
           	</div>
			<br><br>
			<span id="address">${selectAddr}</span>
		</td>
	</tr>
	<tr>
		<td id="feeSec" height="60%">
			<span id="fee">이용 요금</span>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1박케어 | 데이케어 </span>
			<span id="question">&nbsp;?&nbsp;</span>
			<div id="answer" ><span id="q1">&nbsp;?&nbsp;</span> 1박 케어  :  하룻밤 이상 장기간 맡길 때<br>데이케어  :  12시간 이내 장시간 외출할 때</div><br><br>
			<span class="small">🐕</span><span class="small">소형견</span><span class="small" style="color: gray;">&nbsp;&nbsp; 7kg 미만&nbsp;&nbsp;</span><span class="small"> ${sPetAllPrice}원 | ${sPetDayPrice}원</span><br>
			<span class="medium">🐕</span><span class="medium">중형견</span><span class="medium" style="color: gray;">&nbsp; 7~14.9kg&nbsp;</span><span class="medium"> ${mPetAllPrice}원 | ${mPetDayPrice}원</span><br>
			<span class="large">🐕</span><span class="large">대형견</span><span class="large" style="color: gray;"> 15kg 이상</span><span class="large"> ${lPetAllPrice}원 | ${lPetDayPrice}원</span>
		</td>
	</tr>
</table>

<table id="under" class="t1">
    <tr>
		<td id="introSec" rowspan="2" height="400px" style="width:60%; border:none;">
			<h2 style="font-size: 2.2em; "><b>'${selectNickname }' 펫시터를 소개합니다.</b></h2>
 			<span style="font-size: 22px;">${selectShortContent}</span><br><br>
			<span style="font-size: 25px;">${shortContent}</span>
			<br><span style="font-size: 25px;"> ${selectContent}</span>
			</td>
	</tr>
	<tr>  
		<td id="locationSec" height="70%" style="width:40%">
			<span style="font-weight: bold; font-size: 22px;">펫시터 위치</span><br>
			<span>
				<button type="button" class="btn btn-info" id="mbtn" onclick="codeAddress()">확인</button>
			</span>
			<span style="font-size: 19px; float:left;">${selectAddr}</span><br>
			<input type="hidden" name="saddr" id="saddr" value="${addr1}">
			<div class="map-content" id="map" style="float:left; font-size: 1em;"></div>

			<script>
				var map;
				var geocoder;
				
				function myMap() {
					geocoder = new google.maps.Geocoder();
					var latlng = new google.maps.LatLng(37.5400456, 126.9921017);
					var mapOptions = {
							zoom: 15,
							center: latlng
					}
					map = new google.maps.Map(document.getElementById("map"), mapOptions)
				}
				
				function codeAddress() {
					var address = document.getElementById('saddr').value;
					geocoder.geocode( { 'address' : address}, function(results, status) {
						if (status == 'OK') {
							console.log(results);
							map.setCenter(results[0].geometry.location);
							
							var myCity = new google.maps.Circle({
								center: results[0].geometry.location,
								radius: 400,
								strokeColor: 'GREEN',
								strokeOpacity: 0.8,
								strokeWeight: 2,
								fillColor: 'GREEN',
								fillOpacity: 0.4
							});
							myCity.setMap(map);
							
						} else {
							alert('실패');
						}
					});
				}
				
				
			</script> 
			<script 
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDyOvi_zQTPa31XJfwKOJVzvCvb1056_NY&callback=myMap">
			</script>
			
			
			<!-- <div class="map-content" style="float:left;">
			     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.4265244579956!2d127.02601207645192!3d37.497857228062216!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca159effab6a1%3A0x2c7fcbe64938c1ad!2z7Iqk7YOA67KF7IqkIOqwleuCqFLsoJA!5e0!3m2!1sko!2skr!4v1686754047184!5m2!1sko!2skr" width="225" height="225" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	        </div> -->
		</td>
	</tr>
</table>

<div class="row">
	<div class="col-md-7" id="s1">
		<p style="font-size:1.3em; font-weight:bold; margin-bottom:0;">이용 가능 서비스</p>
		
		<!-- 이 테이블에는 펫시터 소개 등록에서 펫시터가 등록한 서비스만 보여줘야 해요! -->
		
		<c:forEach var="item" items="${service}">
				<img id="service1" src="<%=request.getContextPath()%>/images/${item}.jpg" alt="service" style="max-width:30%; height: 60%;">				
		</c:forEach>
		
	</div>
	
	<div class="col-md-7" id="r1">
		<p style="font-size:1.3em; font-weight:bold; margin-bottom:0;">후기 - ${CntReple}개 </p>
		<div style="height:300px; overflow-y:auto">
		<c:forEach var="item" items="${selectRepleAll}">
			<hr style="color:#eeeeee">
			<table class="table table-borderless" id="review" style="width:100%">
				<tr>
					<td style="font-weight: bold; padding-bottom:1px;">${item.nickname}
						<img id="st1" src="<%=request.getContextPath()%>/images/star3.png" alt="별" style="max-width: 2%; background-color: white;">
						x${item.star}
			        </td>
				</tr>
				<tr>
					<td style="font-size:0.9em; padding-top:1px;">${item.wdate}</td>
					<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd; width:30%">
						<img id="service1" src="<%=request.getContextPath()%>/resources/upload/${item.rfile}" alt="사진" style="width:30%">
					</td>
				</tr>
				<tr>
					<td style="padding-top:10px;">
						${item.title} <br><br>
						${item.content}
					</td>
				</tr>
			</table>
		</c:forEach>
		</div>
		
	</div>
	<br>

	<input type="hidden" name="ino" id="ino" value="${vo.ino}">
	
</div>


<%-- 달력 --%>
<h3 id="ch">예약 가능 날짜</h3>
<form action="${myctx}/sendDate" name="sd" id="sd" method="post">
	<div class="container-calendar" style="width: 1000px; margin: 50px; /* border: 3px solid pink; */">
		<div id="container-calendar" style="width: 60%; height: 90%; margin: 0 50px; /* border: 3px solid lime; */">
			<div id="calendar"></div>
		</div>
		<div style="margin-top: 60px; margin-left: 60px; font-size: 1.2em;">[예약 날짜 선택]</div>
		<div class="row">
			<div class="col-md-4 offset-1">
				<label for="start-date">시작 날짜:</label> 
					<input type="text" id="start-date" class="form-control" readonly>
			</div>
			<div class="col-md-4 offset-1">
				<label for="end-date">종료 날짜:</label> <input type="text" id="end-date"
					class="form-control" readonly>
			</div>
			<div class="col-md-4 offset-1">
				<label for="register">* 예약 신청 버튼을 누르면, 휴대폰 번호와 함께 예약 정보가
					전송됩니다.</label>
				<button class="btn btn-primary">예약 신청</button>
			</div>
		</div>
	</div>
</form>
<!-- ------------------------------------------------------------------------------ -->

<script>
/* 달력 예약 -------------------------*/
    $(document).ready(function() {
  $('#start-date').datepicker({
    autoclose: true,
    format: 'yyyy-mm-dd',
    startDate: new Date(), // 오늘 이전의 날짜는 선택할 수 없도록 설정
  }).on('changeDate', function(selected) {
    var startDate = new Date(selected.date.valueOf());
    $('#end-date').datepicker('setStartDate', startDate); // 시작 날짜 이후부터 선택 가능하도록 설정
  });
  
  $('#end-date').datepicker({
    autoclose: true,
    format: 'yyyy-mm-dd',
    startDate: new Date(), // 오늘 이전의 날짜는 선택할 수 없도록 설정
  });
});
    
    /* 달력 모양 -------------------------*/
    document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: 500,
			contentHeight: 200,
			
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator: true, // 현재 시간 마크
			locale: 'ko' // 한국어 설정
		});
		calendar.render();
		calendar.updateSize();
	});
    
  
</script>

