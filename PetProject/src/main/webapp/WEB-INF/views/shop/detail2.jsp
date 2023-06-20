<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--jQuery라이브러리 CDN방식으로 참조 ----------------->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- --------------------------------------------- -->

<style>
table {
	margin: 20px;
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
	font-size: 25px;
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
	font-size: 30px;
	font-weight: bolder;
}

.star {
	float: right;
	margin: 2px;
	margin-top: -5px;
}

#address {
	font-size: 25px;
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
	padding: 20px;
}

#chat {
	background-color: #8EDBA3;
	border: none;
	color: white;
	font-size: 17px;
	font-weight: bold;
	border-radius: 7px;
	padding: 8px;
	margin-left:12px;
	float: right;
}

#locationSec {
	padding: 20px;
}
</style>

<script type="text/javascript">
        let index=1;
        let star=3.7;
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

<table id="on">
	<tr>
		<td id="imgSec" rowspan="2" width="50%">
			<button id="prev">◀️</button>
			<img id="petImg" src="${myctx}/images/pet1.jpg" alt="no image" width="100%" height="100%">
			<button id="next">▶️</button>        
        </td>
		<td id="infoSec" width="50%" height="40%">
			<span id="nickname">닉네임</span>
			<img src="#" alt="뱃지" width="25px" height="25px">
			<span id="noheart" class="like">🤍</span>
			<span id="heart" class="like" style="display: none;">❤️</span><br><br>
			<span id="intro_title">소개 제목</span>
			<span id="review" style="font-size: 20px; float: right;"></span>
			<div>
				<img id="5" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="4" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="3" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="2" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
				<img id="1" class="star" src="<%=request.getContextPath()%>/images/star1.png" alt="별" style="max-width: 5%; background-color: white;">
           	</div>
			<br><br>
			<span id="address">서울특별시 00구 00동</span>
		</td>
	</tr>
	<tr>
		<td id="feeSec" height="60%">
			<span id="fee">이용 요금</span>
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1박케어 | 데이케어 </span>
			<span id="question">&nbsp;?&nbsp;</span><br><br>
			<span style="font-size: 20px">🐕</span><span>소형견</span><span style="color: gray;">&nbsp;&nbsp; 7kg 미만&nbsp;&nbsp;</span><span> 0,000원 | 0,000원</span><br>
			<span style="font-size: 25px">🐕</span><span>중형견</span><span style="color: gray;">&nbsp; 7~14.9kg&nbsp;</span><span> 0,000원 | 0,000원</span><br>
			<span style="font-size: 30px">🐕</span><span>대형견</span><span style="color: gray;"> 15kg 이상</span><span> 예약불가 | 예약불가</span>
		</td>
	</tr>
</table>

<article style="float:left; border:1px solid #cccccc; margin:30px 10px 30px 40px; padding: 15px;">
	<div class="introduce" style="width: 100%;">
		<h3 style="font-weight: bold">'홍길동' 펫시터를 소개합니다!asdfasdfasdf</h3>
 		<span>#3인가구 #아파트 .. 펫시터가 설정한 태그</span><br><br>
		<span style="font-size: 22px;">펫시터가 작성한 소개글</span>
		<br>~~~~~<br>
            ~~~~~<br>
            ~~~~~<br>
	</div>
</article>

<aside style="float:right; border:1px solid #cccccc; margin: 30px 100px 30px 10px; padding: 10px;">
	<div class="side" style="padding:15px 5px 15px 15px;">
		<span style="font-weight: bold; font-size: 21px;">채팅 가능 시간</span>
		<button id="chat">채팅하기</button><br><br>
		<span style="font-size: 17px;">월-금 00:00~00:00</span><br>
		<span style="font-size: 17px;">주 말 00:00~00:00</span>
	</div>
</aside>
