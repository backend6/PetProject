<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--jQuery라이브러리 CDN방식으로 참조 ----------------->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- --------------------------------------------- -->

<!-- 웹소켓 관련 참조 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/stomp.min.js"></script>

<script type="text/javascript">
	let win = null;
	function open_chat() {
		win = window.open("../chat", "chat", "width=400, height=440, left=300, top=200");
	} 
</script>

<style>
#on, #under {
	margin: 20px auto;
	width: 90%;
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

img {
	background-color: #efefef;
	width: 100%;
}

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

.like {
	background-color: white;
	border-color: white;
	font-size: 30px;
	float: right;
	cursor: pointer;
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
	font-size: 20px;
	font-weight: bold;
}

#question {
	background-color: gray;
	color: white;
	font-size: 15px;
	font-weight: bold;
	border-radius: 10px;
}

#chatSec {
	padding: 15px;
}

#chat {
	background-color: #8EDBA3;
	border: none;
	color: white;
	font-size: 17px;
	font-weight: bold;
	border-radius: 7px;
	padding: 8px;
	margin-left:3px;
	float: right;
}

#chat:hover { background-color: #8ECEA3 }

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
	margin-left: 70px;
}

#r1{
	width:70%;
	margin-left: 70px;
}

#service, #review { margin-top: 10px; }

#service td, #review td { padding: 5px; }

</style>

<script type="text/javascript">
        let index=1;
        let star=${SumStar}/${CntStar};
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

            $('.like').click(()=>{
                let hid=$('.like:hidden');
                let vis=$('.like:visible');
                hid.show();
                vis.hide();
            })



            let i=1;
            for(i=1;i<=star;i++){
                $('#'+i).attr('src','<%=request.getContextPath()%>/images/star3.png');
            }
            if(i-1<star){
                $('#'+i).attr('src','<%=request.getContextPath()%>/images/star2.png');
            }
            $('#review').text('평점('+star+')');
        })
    </script>

<table id="on" class="t1">
	<tr>
		<td id="imgSec" rowspan="2" width="50%">
			<button id="prev">◀️</button>
			<img id="petImg" src="${myctx}/images/pet1.jpg" alt="no image" width="100%" height="100%">
			<button id="next">▶️</button>        
        </td>
		<td id="infoSec" width="50%" height="40%">
			<span id="nickname">${selectNickname }</span>
			<img src="#" alt="뱃지" width="25px" height="25px">
			<span id="noheart" class="like">🤍</span>
			<span id="heart" class="like" style="display: none;">❤️</span><br><br>
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
			<span id="question">&nbsp;?&nbsp;</span><br><br>
			<span style="font-size: 20px">🐕</span><span>소형견</span><span style="color: gray;">&nbsp;&nbsp; 7kg 미만&nbsp;&nbsp;</span><span> ${sPetAllPrice}원 | ${sPetDayPrice}원</span><br>
			<span style="font-size: 27px">🐕</span><span>중형견</span><span style="color: gray;">&nbsp; 7~14.9kg&nbsp;</span><span> ${mPetAllPrice}원 | ${mPetDayPrice}원</span><br>
			<span style="font-size: 30px">🐕</span><span>대형견</span><span style="color: gray;"> 15kg 이상</span><span> ${lPetAllPrice}원 | ${lPetDayPrice}원</span>
		</td>
	</tr>
</table>

<table id="under" class="t1">
    <tr>
		<td id="introSec" rowspan="2" height="400px" style="width:70%; border:none;">
			<h2><b>'${selectNickname }' 펫시터를 소개합니다.</b></h2>
 			<span>${selectShortContent}</span><br><br>
			<span style="font-size: 22px;">${shortContent }</span>
			<br>${selectContent}
			</td>
		<td id="chatSec" height="30%" style="width:30%">
			<span style="font-weight: bold; font-size: 20px;">채팅 가능 시간</span>
			<button type="button" id="chat">채팅하기</button><br><br>
			<span style="font-size: 17px;">월-금 00:00~00:00</span><br>
			<span style="font-size: 17px;">주 말 00:00~00:00</span>
		</td>
	</tr>
	<tr>  
		<td id="locationSec" height="70%" style="width:30%">
			<span style="font-weight: bold; font-size: 20px;">펫시터 위치</span><br>
			<span style="font-size: 15px;">서울특별시 00구 00동<br> 00역에 0번출구에서 0분 </span><br>
			<div id="map" style="background-color:#cccccc; height: 70%;">
				지도
			</div>
		</td>
	</tr>
</table>

<div class="row">
	<div class="col-md-7" id="s1">
		<p style="font-size:1.3em; font-weight:bold; margin-bottom:0;">이용 가능 서비스</p>
		
		<!-- 이 테이블에는 펫시터 소개 등록에서 펫시터가 등록한 서비스만 보여줘야 해요! -->
		<table class="table" id="service" style="width:100%;">
			<tr>
				<td>a</td>
				<td>b</td>
				<td>c</td>
			</tr>
			<tr>
				<td>a</td>
				<td>b</td>
				<td>c</td>
			</tr>
			<tr>
				<td>a</td>
				<td>b</td>
				<td>c</td>
			</tr>
		</table>
	</div>
	
	<div class="col-md-7" id="r1">
		<p style="font-size:1.3em; font-weight:bold; margin-bottom:0;">후기 - ?개 </p>
		
		<table class="table table-borderless" id="review" style="width:100%">
			<tr>
				<td colspan="3" style="font-weight: bold; padding-bottom:1px;">닉네임</td>
			</tr>
			<tr>
				<td style="font-size:0.9em; padding-top:1px;">2023년 6월 7일(날짜)</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
			</tr>
			<tr>
				<td style="padding-top:10px;">
					리뷰우 ~~~~~~~~<br> 
					~~~~~~~~~~~~~~~ <br> 
					~~~~~~~~~ 
				</td>
			</tr>
		</table>
		<hr style="color:#eeeeee">
		
		<!-- 후기 개수만큼 반복문 돌리고 여긴 빼기 -->
		<table class="table table-borderless" id="review" style="width:100%">
			<tr>
				<td colspan="3" style="font-weight: bold; padding-bottom:1px;">닉네임</td>
			</tr>
			<tr>
				<td style="font-size:0.9em; padding-top:1px;">2023년 6월 7일(날짜)</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
				<td rowspan="2" style="text-align:center; vertical-align:middle; background-color:#dddddd">
					사진
				</td>
			</tr>
			<tr>
				<td style="padding-top:10px;">
					리뷰우 ~~~~~~~~<br> 
					~~~~~~~~~~~~~~~ <br> 
					~~~~~~~~~ 
				</td>
			</tr>
		</table>
		
		<div class="text-center">
			<p style="font-size:1em;"><a href="#" style="color:inherit;">후기 더보기</a></p>
		</div>
		
	</div>
	<br>

	
	
</div>

