<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>Music For Everyone</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	  
	  <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
      <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
      <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
   </head>
   <body>
      <!-- Header -->
         <header id="header">
            <h1><a href="#">MFE <span>by</span></a></h1>
            <div>
            <button type ="button" class = "btn btn-secondary"><span class = "glyphicon glyphicon-tasks" aria-hidden="true"></span></button>
            <!--  검색 텍스트 -->
        	 <input class = "search_Text"type="text" id ="search_Text" placeholder = "search...">
            <button id = "search_Button" type ="button" class = "btn btn-secondary"><span class = "glyphicon glyphicon-search" aria-hidden="true"></span></button>
            <button type ="button" class = "btn btn-secondary" data-toggle="modal" data-target="#login_Modal"><span class = "glyphicon glyphicon-user" aria-hidden="true"></span></button>
            <a href="#menu">Menu</a>
            </div>
         </header>

      <!-- Nav -->
         
         <nav id="menu">
         	
            <ul class="links">
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">---비회원한테 보여지는 부분--- </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">로그인1 </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">회원가입</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터 </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">------회원 --------</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">마이페이지 </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">티켓관리</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">장바구니</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">찜목록 </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티</a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터 </a></li>
               <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">로그아웃 </a></li>
            </ul>
         </nav>

       
        <div id="main">
        <section class = "listWrapper">
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
   	     </div>
   	     </section>
		<section class = "listWrapper">
          <div class="slider">
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/240/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/241/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/242/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/243/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/244/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/239/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/249/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
     		<div class="item"><img src="http://picsum.photos/id/248/550/550"></div>
   	     </div>
   	     </section>
   	     </div>
  				
           

        

      <!-- Footer -->
         <footer id="footer">
            <div class="inner">
               <div class="flex flex-3">
                  <div class="col">
                     <h3>Vestibullum</h3>
                     <ul class="alt">
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                        <li><a href="#">Vis id faucibus montes tempor</a></li>
                        <li><a href="#">Massa amet lobortis vel.</a></li>
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                     </ul>
                  </div>
                  <div class="col">
                     <h3>Lobortis</h3>
                     <ul class="alt">
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                        <li><a href="#">Vis id faucibus montes tempor</a></li>
                        <li><a href="#">Massa amet lobortis vel.</a></li>
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                     </ul>
                  </div>
                  <div class="col">
                     <h3>Accumsan</h3>
                     <ul class="alt">
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                        <li><a href="#">Vis id faucibus montes tempor</a></li>
                        <li><a href="#">Massa amet lobortis vel.</a></li>
                        <li><a href="#">Nascetur nunc varius commodo.</a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <ul class="icons">
                  <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                  <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                  <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                  <li><a href="#" class="icon fa-snapchat"><span class="label">Snapchat</span></a></li>
               </ul>
               &copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Coverr</a>. Video: <a href="https://coverr.co">Coverr</a>.
            </div>
         </footer>
         
         <!--  로그인 모달 -->
         <div class="modal" id="login_Modal">
    		<div class="modal-dialog">
     			 <div class="modal-content">
      
      			  <!-- Modal Header -->
      			  <div class="modal-header">
      			    <h4 class="modal-title">로그인</h4>
     			    <button type="button" class="close" data-dismiss="modal">&times;</button>
      			  </div>
        
        		  <!-- Modal body -->
       			  <div class="modal-body">
        			  <div class="container uniform">
        				<form action="#" id = "login_form">
						 <fieldset>
					    	<div class = "form-group">
								<label for ="login_id" class="modalBlack">아이디</label>
								<input type="text" class="form-control" id="login_id"
								   placeholder = "Enter id" name="login_id" required maxLength="12">
								<span id = "login_id_message"></span>
							</div>
							<div class = "form-group">
								<label for ="modal_pass" class="modalBlack">비밀번호</label>
								<input type="password" class="form-control" id="login_pass"
								   placeholder = "Enter password" name="login_pass" required>
							</div>
							<div class="6u$ 12u$(small)">
								<input type="checkbox" id="login_remember" name="login_remember" checked>
								<label for="login_remember">Remember me</label>
							</div>
						</fieldset>
						</form>
        			</div>
    	    	</div>
        
        <!-- Modal footer -->
       			 <div class="modal-footer">
        			<button type="submit" class="btn btn-primary" >로그인</button>
         			<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
         			<button type="button" class="btn btn-info" data-dismiss="modal" data-toggle="modal" data-target="#addMember_Modal"> 회원가입</button>
     			 </div>
        
    		  </div>
    		</div>
  		</div>
         
         
         
         <!-- 회원가입 모달 -->
		<div class="modal" id="addMember_Modal">
    		<div class="modal-dialog">
     			 <div class="modal-content">
      
      			  <!-- Modal Header -->
      			  <div class="modal-header">
      			    <h4 class="modal-title">회원가입</h4>
     			    <button type="button" class="close" data-dismiss="modal">&times;</button>
      			  </div>
        
        		  <!-- Modal body -->
       			  <div class="modal-body">
        			  <div class="container">
        				<form action="#" id = "addMember_form">
						 <fieldset>
					    	<div class = "form-group">
								<label for ="addMember_id" class="modalBlack">아이디</label>
								<input type="text" class="form-control" id="addMember_id"
								   placeholder = "Enter id" name="addMember_id" required maxLength="12">
								<span id = "addMember_id_message"></span>
							</div>
							<div class = "form-group">
								<label for ="addMember_pass" class="modalBlack">비밀번호</label>
								<input type="password" class="form-control" id="addMember_pass"
								   placeholder = "Enter password" name="addMember_pass" required>
							</div>
							<div class = "form-group">
								<label for = "addMember_name" class="modalBlack">이름</label>
								<input type="text" id = "addMember_name" name = "addMember_name" placeholder="Enter name" required maxLength="15">
							</div>
							<div class = "form-group">
								<label for = "addMember_age" class="modalBlack">나이</label>
								<input type="text" id = "addMember_age" name = "addMember_age" placeholder="Enter age" required maxLength="2">
							</div>
							<div class="u$(small)">
								<div><label for="male" class = "modalBlack">성별</label></div>
								<input type="radio" id = "male" name="addMember_gender" value="1" checked>
								<label for="male" class ="modalBlack">남</label>
								<input type="radio" id = "female" name="addMember_gender" value="2">
								<label for="female" class ="modalBlack">여</label>
							</div>
						</fieldset>
						</form>
        			</div>
    	    	</div>
        
        <!-- Modal footer -->
       			 <div class="modal-footer">
        			<button type="submit" class="btn btn-primary">회원가입</button>
         			 <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
     			 </div>
        
    		  </div>
    		</div>
  		</div>
      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/skel.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
         <script>
      // 회원가입 id 체크
      
      	$(document).ready(function(){
			$("#addMember_id").on('keyup', function() {
				//처음에 pattern에 적합하지 않은 경우 메시지 출력 후
				// 적합한 데이터를 입력해도 계속 같은 데이터 출력하므로
				// 이벤트 시작할 때마다 비워둔다.
				$("addMember_id_message").empty();
				// \w => [A-Za-z0-9_]
				var pattern = /^\w+@\w*[.]\w{3}$/;
				var id =$("#addMember_id").val();
				
				if(!pattern.test(id)) {
					$("#addMember_id_message").css('color', 'red')
										.html("이메일 형식으로 맞춰주세요.");
					return;
				}
				$.ajax({
					url : "../idCheckServlet",
					type : 'post',
					data : {"id": id},
					success : function(rdata) {
						if(rdata == -1) {
							$("#addMember_id_message").css('color', 'green').html(
									"사용 가능한 아이디 입니다.");
						} else {
							$("#addMember_id_message").css('color', 'blue').html(
									 "사용중인 아이디 입니다.");
						}
					}//if
				});//ajax
				
			});// keyup
			$('#search_Text').hide();
			
			$('#search_Button').click(function() {
				$('#search_Text').toggle();
				$('#search_Button').hide();
				$('#search_Text').focus();
			});
			$('#search_Text').blur(function() {
				$('#search_Button').show();
				$('#search_Text').val('');
				$('#search_Text').hide();
			});
		     $.noConflict();
		
		     $('.slider').slick({
		    	  centerMode: true,
		    	  slidesToShow: 10,
		    	  infinite :true,
		    	  slidesToscroll : 8,
		    	  responsive: [
		    	    {
		    	      breakpoint: 768,
		    	      settings: {
		    	        arrows: false,
		    	        centerMode: true,
		    	        slidesToShow: 7
		    	      }
		    	    },
		    	    {
		    	      breakpoint: 480,
		    	      settings: {
		    	        arrows: false,
		    	        centerMode: true,
		    	        slidesToShow: 3
		    	      }
		    	    }
		    	  ]
		    	});
      	});
         </script>
 
 

   </body>
</html>