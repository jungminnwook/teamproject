<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Cake Template">
<meta name="keywords" content="Cake, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Cake | Template</title>

<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
   rel="stylesheet">

<!-- Css Styles -->
<%-- include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>

<body>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>

<!-- Header Section Begin -->
   <jsp:include page="/WEB-INF/views/include/Nav.jsp" />
   <!-- Header Section End -->

   <!-- Breadcrumb Begin -->
   <div class="breadcrumb-option">
      <div class="container">
         <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
               <!-- <div class="breadcrumb__text"> -->
               <div>
                  <h2>회원 정보</h2>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
               <div class="breadcrumb__links">
                  <a href="/index">홈</a> <span>회원 정보</span>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Breadcrumb End -->

   <!-- Checkout Section Begin -->
   <section class="checkout spad">
      <div class="container">
         <div class="checkout__form">
            <form action="/member/temperature" method="POST"
               enctype="multipart/form-data">
               <div class="row">
                  <div class="col-lg-8 col-md-6">
                     <div class="form-group">
                        <div class="col-md-5 col-lg-5 " align="center">
                           <c:set var="fileCallPath"
                              value="${ profilePicVO.uploadpath }/${profilePicVO.mid}/s_${ profilePicVO.uuid }_${ profilePicVO.filename }" />
                           <img src="/display?fileName=${fileCallPath}" id="preview-image"
                              class="img-thumbnail">
                        </div>
                          <div class="checkout__input">
                              <p>
                                 단호박 온도
                                 <c:set var="total" value="${ memberVO.temperature }" />
                                 <c:out value="${ memberVO.temperature }" />
                                 º

                              </p>
                              <div class="container">
                                 <div class="progress">

                                    <c:choose>
                                       <c:when test="${ total < 25}">
                                          <div class="progress-bar bg-success" role="progressbar"
                                             style="width: ${ memberVO.temperature }%"
                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                       </c:when>
                                       <c:when test="${ total < 50}">
                                          <div class="progress-bar bg-into" role="progressbar"
                                             style="width: ${ memberVO.temperature }%"
                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                       </c:when>
                                       <c:when test="${ total < 75}">
                                          <div class="progress-bar bg-warning" role="progressbar"
                                             style="width: ${total}%"
                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                       </c:when>
                                       <c:otherwise>
                                          <div class="progress-bar bg-danger" role="progressbar"
                                             style="width: ${ memberVO.temperature }%"
                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                       </c:otherwise>
                                    </c:choose>
                                 </div>
                                    <!-- <input type button
                                       class="btn btn-lg bg-warning d-flex flex-row justify-content-center" value="나빠요"
                                       onclick="javascript:this.form.amount.value++;"></button>
                                    &nbsp;
                                    <button
                                       class="btn btn-lg bg-warning d-flex flex-row justify-content-center"
                                       onclick="Tem('m', this);">좋아요</button> -->
                                 </div>
                              </div>
                     </div>
                     
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 이름
                              </p>
                               <input type="text" value="${ memberVO.name }" name="name"
                                 readonly="readonly">
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 아이디
                              </p>
                              <input type="text" value="${ memberVO.id }" name="id"
                                 readonly="readonly">
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <p>
                                 우편번호
                              <p>
                                  <input id="member_post" type="text" readonly="readonly"
                                    value="${ memberVO.address1 }" name="address1" readonly>
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <p>
                                 주소
                              <p>
                                 <input id="member_addr" type="text"
                                    value="${ memberVO.address2 }" readonly name="address2">
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <p>
                                 상세주소
                              <p>
                                 <input type="text" value="${ memberVO.address3 }"
                                    name="address3" readonly>
                           </div>
                        </div>
                     </div>
                     
                     

                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 휴대전화
                              </p>
                              <input type="text" value="${ memberVO.phonenumber }"
                                 name="phonenumber" readonly>
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 Email
                              </p>
                              <input type="text" value="${ memberVO.email }" name="email"
                                 readonly>
                           </div>
                        </div>
                     </div>


                     <div class="row">
                        <div class="form-group">
                           <div class="col-lg-6">
                              <div class="checkout__input">
                                 <p>
                                    성별
                                 </p>

                              </div>
                              <input type="text" class="form-control" id="gender"
                                 name="gender" value="${ memberVO.gender }" readonly>
                           </div>
                        </div>
                        <br>
                        <div class="form-group">
                           <div class="checkout__input">
                              <p>
                                 생년월일
                              </p>
                           </div>
                           <input type="text" id="birthday" class="form-control"
                              name="birth" value="${ memberVO.birth }" readonly>
                        </div>
                     </div>

                     
                  </div>
               </div>

            </form>

         </div>
      </div>
   </section>
   <!-- Checkout Section End -->

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
                  <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed do
                     eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
                  <div class="footer__social">
                     <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                        class="fa fa-twitter"></i></a> <a href="#"><i
                        class="fa fa-instagram"></i></a> <a href="#"><i
                        class="fa fa-youtube-play"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
               <div class="footer__newslatter">
                  <h6>Subscribe</h6>
                  <p>Get latest updates and offers.</p>
                  <form action="#">
                     <input type="text" placeholder="Email">
                     <button type="submit">
                        <i class="fa fa-send-o"></i>
                     </button>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <div class="copyright">
         <div class="container">
            <div class="row">
               <div class="col-lg-7">
                  <p class="copyright__text text-white">
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     Copyright &copy;
                     <script>
                        document.write(new Date().getFullYear());
                     </script>
                     All rights reserved | This template is made with <i
                        class="fa fa-heart" aria-hidden="true"></i> by <a
                        href="https://colorlib.com" target="_blank">Colorlib</a>
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

   <!-- Js Plugins -->
   <jsp:include page="/WEB-INF/views/include/javascripts.jsp" />
   

</body>

</html>