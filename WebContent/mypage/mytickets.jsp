<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../mainActivity/assets/css/main.css" />
<link rel="stylesheet" href="css/info.css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/import.css" />
<link rel="stylesheet" type="text/css" href="css/mypage.css" />
<link rel="stylesheet" type="text/css" href="css/popup.css" />
<title>나의 티켓관리</title>
<style>
body {
	background: #020B13;
	}
.align-center {
	background : rgba(255,255,255,0);
	text-align: center;
	color : white;
}
.mypage_contain{
	width : 70%;
	margin : 0 auto;
	padding-top : 50px;
}
ul {
	list-style: none;
}
.tit {
	color : white;
}
ul li {
	list-style-type: none;
	display : inline;
	margin-left : 20px;
	
}
.point {
	text-align: right;
	color : white;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:forward page ='main.net'></jsp:forward>
	<!-- 본문 -->
    <div class="mypage_contain">
        <header class="align-center">
			<h2>예매 티켓 관리</h2>
		</header>
		<br>
         <div class="mycont">
           <h2 class="tit">
                <label>예매내역</label>
           </h2>
       <div class="point fr btn_mt30">
       	<ul id="ulGubun">
	        <li  DispGubun="-1"><a href="#" DispGubun="-1"  >전체</a></li>
	        <li  class="bgn ov" DispGubun="1"><a href="#" DispGubun="1" >예매/예약</a></li>
	        <li  DispGubun="2"><a href="#" DispGubun="2" >취소</a></li>
     	</ul>
       </div>
       <div id="divOrderList">
       	<table class="tmypage" summary="최근 예매내역 리스트">
       		<colgroup>
       			<col width="13%">
       			<col width="13%">
       			<col width="*">
       			<col width="18%">
       			<col width="10%">
       			<col width="15%">
       		</colgroup>
       		<thead>
       			<tr>
       				<th scope="row" class="fst">예매일</th>
       				<th scope="row">예매번호</th>
       				<th scope="row">공연명</th>
       				<th scope="row">관람일시</th>
       				<th scope="row">매수</th>
       				<th scope="row" class="end">예매상태</th>
       			</tr>
       		</thead>
       		<tbody>
       			<tr>
       				<td colspan="6" class="le ri">예매내역이 없습니다.</td>
       		</tbody>
       	</table>
       </div>
       	<div class="mycont">
        	<h2 class="tit">유의사항</h2>
            <p>어저구 저쩌구</p>
        </div>
      </div>
      </div>
                <!-- //본문 -->
</body>
</html>