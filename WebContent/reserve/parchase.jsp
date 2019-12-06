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

.policy {
	padding: 0 10%;
	display: block;
}

.pur_card .credit {
	width: 100%;
	display: inline-block;
}

.pur_card .credit input[id=cardnumber] {
	padding: 1%;
	width: 70%;
}

.pur_card .credit input[id=cardmmyy] {
	width: 12%;
}

.pur_card .credit input[id=cardcvv] {
	width: 12%;
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

.credit #input-box #cardicon {
	height: 25px;
	width: 8%;
	margin: auto;
}

.credit #input-box #cardicon img {
	width: 100%;
	height: auto;
	vertical-align: top;
}
</style>
<script type="text/javascript">
	/* 확인 alert */
	$(function() {
		/* goback 클릭시 확인 alert */
		$("#goback").click(function(event) {
			var answer = confirm("결제를 취소하시겠습니까?");
			console.log(answer);//취소를 클릭한 경우 -false
			if (!answer) {//취소를 클릭한 경우
				event.preventDefault();
			}
		})

		/* pay 클릭시 확인 alert */
		$(".reserverbtn .sub").click(function(event) {
			var answer = confirm("결제를 진행하시겠습니까?");
			console.log(answer);//취소를 클릭한 경우 -false
			if (!answer) {//취소를 클릭한 경우
				event.preventDefault();
			}
		})
	})

	/* 카드 유효성 검사 */
	$(document).ready(function() {
		$("#payment").click(function() {
			if ($.trim($("#cardnumber").val()) == '') {
				alert('카드번호를 입력해주세요.');
				$("#cardnumber").focus();
				return false;
			}

			if ($.trim($("#cardmmyy").val()) == '') {
				alert('카드 유효기간을 입력해주세요.');
				$("#cardmmyy").focus();
				return false;
			}

			if ($.trim($("#cardcvv").val()) == '') {
				alert('카드뒷면 CVV를 입력해주세요.');
				$("#cardcvv").focus();
				return false;
			}
		})
	})
	
	function validatecardnumber(cardnumber) {
   
        //빈칸과 대시 제거
        cardnumber = cardnumber.replace(/[-]/g,'');
        var pattern = /^(5[1-5]\d{14})|(4\d{12}(\d{3})?)|(3[47]\d{13})|6011\d{12})|((30[0-5]|36\d|38\d)\d{11})$/
     
    }

	function check() {

		var cardnumber = document.getElementById("cardnumber");
		var cardmmyy = document.getElementById("cardmmyy");
		var cardcvv = document.getElementById("cardcvv");
		
		
		if (cardnumber.value.length == 16) {
			if (!isNaN(cardnumber.value)) { //16자리가 모두 숫자인경우
				cardmmyy.focus();
			} else { //16자리가 숫자가 아닌경우
				alert("숫자로 입력하세요");
				cardnumber.value = ''; //앞자리 모두 초기화
				cardnumber.focus(); //앞자리에 포커스
			}
		}
		
		if (cardmmyy.value.length == 4) {
			if (!isNaN(cardnumber.value)) { //4자리가 모두 숫자인경우
				cardcvv.focus();
			} else { //16자리가 숫자가 아닌경우
				alert("숫자로 입력하세요");
				cardmmyy.value = ''; //앞자리 모두 초기화
				cardmmyy.focus(); //앞자리에 포커스
			}
		}
		
		if (cardcvv.value.length == 3) {
			if (!isNaN(cardcvv.value)) { //4자리가 모두 숫자인경우
				
				
			} else { //16자리가 숫자가 아닌경우
				alert("숫자로 입력하세요");
				cardcvv.value = ''; //앞자리 모두 초기화
				cardcvv.focus(); //앞자리에 포커스
			}
		}

	}

	/* 카드 번호 입력시 4자리숫자 입력 후 자동 띄어쓰기 */
	function cardnumber_format(value) {
		var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '')
		var matches = v.match(/\d{4,16}/g);
		var match = matches && matches[0] || ''
		var parts = []
		for (i = 0, len = match.length; i < len; i += 4) {
			parts.push(match.substring(i, i + 4))
		}
		if (parts.length) {
			return parts.join(' ')
		} else {
			return value
		}
	}

	onload = function() {
		document.getElementById('cardnumber').oninput = function() {
			this.value = cardnumber_format(this.value)
		}
	}
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
									<input type="text" id="cardnumber" class="creditcard number" name="credit" placeholder="Card Number" onkeyup="validatecardnumber" required>
									&nbsp; 
									<input type="text" id="cardmmyy" class="creditcard mmyy" name="credit" placeholder="MM/YY" required> 
									<input type="text" id="cardcvv" class="creditcard cvv" name="credit" placeholder="CVV" required>
								</div>
								<div id="card_message"></div>
							</div>
							<div class="save_credit">
								<a href="#">Save Credit Card</a>
							</div>
						</div>
					</div>
				</div>

				<div class="policy">
					<div>
						<div>
							<div>
								<i class="policy lock"><img src="#"></i>
							</div>
							<div>
								<div>
									<img src="#">visa
								</div>
								<div>
									<img src="#">master
								</div>
								<div>
									<img src="#">american Express
								</div>
							</div>
						</div>

						<div>
							<a href="#">Terms and conditions of use</a>
						</div>
						<div>
							<a href="#">Privacy policy</a>
						</div>

					</div>
				</div>





				<!-- PAY 버튼  -->
				<div id="layer_fixed" class="reserverbtn">
					<button type="submit" class="btn btn-info sub" id="payment">PAY</button>
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
