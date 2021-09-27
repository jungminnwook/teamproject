<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Cake Template">
<meta name="keywords" content="Cake, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상품 List</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/barfiller.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>
    <%-- include topNavbar.jsp --%>
<jsp:include page="/WEB-INF/views/include/Nav.jsp" />


    
    <!-- middle container -->
    <div class="container mt-4">
      <div class="row">

        <!-- Left Menu -->
        <div class="col-sm-3">

          <!-- Vertical Nav -->
          <ul class="nav flex-column nav-pills">
            <li class="nav-item">
              <a class="nav-link active" href="#">Active</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
          </ul>
          <!-- end of Vertical Nav -->
        </div>
        <!-- end of Left Menu  -->


        <!-- Right area -->
        <div class="col-sm-9">
          
          <!-- Contents area -->
          <div class="border border-info p-4 rounded">
            <h5>게시판 새글쓰기</h5>

            <hr class="featurette-divider">

            <form action="/board/write" method="POST" enctype="multipart/form-data">
              <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" class="form-control" id="id" aria-describedby="idHelp" name="mid" value="${ sessionScope.id }" readonly>
              </div>

              <div class="form-group">
                <label for="subject">제목</label>
                <input type="text" class="form-control" id="subject" name="subject" autofocus>
              </div>

              <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" rows="10" name="content"></textarea>
              </div>

			  
			  <button type="button" class="btn btn-primary my-3" id="btnAddFile">파일 추가</button>
			  
			  
			  <div><span>첨부 파일</span></div>
			  <div id="fileBox">
			  
			  	<div class="my-2">
                  <input type="file" name="files" multiple>
                  <button type="button" class="btn btn-primary btn-sm delete-file">
                  	<i class="material-icons align-middle">clear</i>
                  	<span class="align-middle">삭제</span>
                  </button>
                </div>
                
			  </div>
              

              <div class="my-4 text-center">
                <button type="submit" class="btn btn-primary">
                  <i class="material-icons align-middle">create</i>
                  <span class="align-middle">새글등록</span>
                </button>
                <button type="reset" class="btn btn-primary ml-3">
                  <i class="material-icons align-middle">clear</i>
                  <span class="align-middle">초기화</span>
                </button>
                <button type="button" class="btn btn-primary ml-3" onclick="location.href = '/board/list?pageNum=${ pageNum }';">
                  <i class="material-icons align-middle">list</i>
                  <span class="align-middle">글목록</span>
                </button>
              </div>
            </form>

          </div>
          <!-- end of Contents area -->
        </div>
        <!-- end of Right area -->
      </div>
    </div>
    <!-- end of middle container -->



   <!-- Footer Section Begin -->
    <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>WORKING HOURS</h6>
                        <ul>
                            <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                            <li>Saturday: 10:00 am – 16:30 pm</li>
                            <li>Sunday: 10:00 am – 16:30 pm</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="img/footer-logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore dolore magna aliqua.</p>
                        <div class="footer__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__newslatter">
                        <h6>Subscribe</h6>
                        <p>Get latest updates and offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send-o"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <p class="copyright__text text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                          Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                      </p>
                  </div>
                  <div class="col-lg-5">
                    <div class="copyright__widget">
                        <ul>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Site Map</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search End -->





    



	<script>
// 		var a = function () {};
// 		a();
		
// 		document.querySelector('#btnAddFile').addEventListener('click', function (event) {
// 			var str = `
// 				<div class="my-2">
// 	                <input type="file">
// 	                <button type="button" class="btn btn-primary btn-sm delete-file">
// 	                	<i class="material-icons align-middle">clear</i>
// 	                	<span class="align-middle">삭제</span>
// 	                </button>
// 	            </div>
// 			`;
// 			document.querySelector('#fileBox').innerHTML += str;
// 		});

		
		const MAX_FILE_COUNT = 5;
		let fileCount = 1;  // 화면에 보이는 file 입력상자 개수
		
		// jQuuery 방식 이벤트 처리
		// 정적 이벤트 연결
		$('#btnAddFile').on('click', function (event) {
			if (fileCount >= MAX_FILE_COUNT) {
				alert('첨부파일은 최대 5개 까지만 첨부할 수 있습니다.')
				return;
			}
			
			var str = `
				<div class="my-2">
	                <input type="file" name="files" multiple>
	                <button type="button" class="btn btn-primary btn-sm delete-file">
	                	<i class="material-icons align-middle">clear</i>
	                	<span class="align-middle">삭제</span>
	                </button>
	            </div>
			`;
			$('div#fileBox').append(str);
			
			fileCount++;
		});
		
		
		// 동적 이벤트 연결 - 이벤트 등록을 이미 존재하는 요소에게 위임하는 방식
		$('div#fileBox').on('click', 'button.delete-file', function (event) {
			//event.target; // 실제 이벤트가 발생한 오브젝트
			
			$(this).closest('div').remove();  // empty()와 구분 주의!
			//$(this).parent().remove();
			
			fileCount--;
		});
	</script>
</body>

<!-- Js Plugins -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.barfiller.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.nicescroll.min.js"></script>
<script src="/resources/js/main.js"></script>


</html>










