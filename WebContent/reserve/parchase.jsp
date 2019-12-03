<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>music for everyone fucking hell concert mthfcker</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../assets/css/purchase.css">
</head>
<style>
.describe {
	width: 66%;
	float: left;
}

.image {
	width: 33%;
	float: right;
}

hr {
	margin: 0;
}

.pur .title h2 {
	font-weight: bolder;
}

.pur_card {
	padding: 0 10%;
	display: block;
}

.pur_card .credit {
	width: 100%;
	display: inline-block;
}

.pur_card .credit input {
	width: 20%;
}

.purchasetotal {
	padding: 10%;
}

.reserverbtn {
	clear: both;
}

#gray {
	color: #a9afb4;
}

.price {
	float: right;
	font-weight: bolder;
}

.credit #input-box {
	box-sizing: border-box;
	border: 1px solid grey;
	display: flex;
	padding: 2%;
	height: 50px;
	width: 100%;
}

.credit #input-box input[name=credit] {
	border: none;
	width: 23%;
	text-align: center;
}

.credit #input-box input[id=credit1] {
	overflow: visible;
}

.credit #input-box #cardicon {
	height: 20px;
	width: 10%;
	margin: auto;
}

.credit #input-box #cardicon img {
	width: 100%;
	height: auto;
	vertical-align: top;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#goback").click(function(event) {
			var answer = confirm("결제를 취소하시겠습니까?");
			console.log(answer);//취소를 클릭한 경우 -false
			if (!answer) {//취소를 클릭한 경우
				event.preventDefault();
			}
		})
	})
</script>
<body>
	<!-- 상단 : 네비게이션 바 부분 -->
	<header>
		<div class="menubar">
			<a class="logo">NAV BAR</a> <a class="icon">ICON</a>
		</div>
	</header>
	<!-- //상단 : 네비게이션 바 부분 -->

	<div class="container">
		<form method="post" action="reserve_complete.jsp">
			<div id="detail">
				<div>
					<a href="Reserve_Background.jsp" id="goback">◀ Go back</a>
				</div>
				<div class="purchasetotal">
					<div class="pur title">
						<h2>AKMU CONCERT[ 항 해 ]</h2>
					</div>
					<!-- 결제detail -->
					<div class="pur describe">
						<hr>
						<div>
							<h5 id="gray">2020. 02. 01(SAT) 7PM</h5>
						</div>
						<hr>
						<div>
							<h5 id="gray">
								Ticket price<span class="price pricetag" id="gray">￦96,000(x1)</span>
							</h5>
						</div>
						<hr>
						<div>
							<h5 id="gray">
								Ticket booking fee<span class="price booingtag" id="gray">￦4,000(x1)</span>
							</h5>
						</div>
						<hr>
						<div>
							<h4>
								<strong>TOTAL:</strong>
							</h4>
						</div>
						<div>
							<h3>
								<strong>￦100,000</strong>
							</h3>
						</div>
					</div>
					<!-- //결제detail -->


					<!-- 결제detail_image 그림 end -->
					<div class="pur image">
						<img src="../reserve/image/2.jpg"
							style="width: 150px; height: 195px;">
					</div>
					<!-- //결제detail_image 그림 end -->
				</div>

				<hr style="margin: 0 10%; clear: both;">
				<br> <br>


				<div class="pur_card">
					<div>
						<div>
							<div class="credit">
								<div>신용카드</div>
								<div id="input-box">
									<i id="cardicon"><img src="../reserve/image/card-img.png"></i>
									<input type="text" id="credit1" name="credit"
										placeholder="Card" required> &nbsp; <input type="text"
										id="credit2" name="credit" placeholder="Number" required>
									&nbsp; <input type="text" id="credit3" name="credit" required>
									&nbsp; <input type="text" id="credit4" name="credit" required>
									&nbsp; <input type="text" id="mmyy" name="credit"
										placeholder="MM/YY" required> &nbsp; <input
										type="text" id="cvc" name="credit" placeholder="CVC" required>
								</div>
								<div id="card_message"></div>
							</div>
							<div class="save_credit">
								<a href="#">Save Credit Card</a>
							</div>
						</div>
					</div>
				</div>





				<!-- PAY 버튼  -->
				<div id="layer_fixed" class="reserverbtn">
					<button type="submit" class="btn btn-info">PAY</button>
				</div>
				<!-- //PAY end-->
			</div>
		</form>
	</div>

	<!-- footer -->
	<footer>footer</footer>
	<!-- //footer -->

</body>
</html>
