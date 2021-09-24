<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%--include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
<body>
   <%--include topNavbar.jsp --%>
   <jsp:include page="/WEB-INF/views/include/topNavbar.jsp" />



   <!-- middle container -->
   <div class="container mt-4">
      <div class="row">

         <!-- Left Menu -->
         <div class="col-sm-3">

            <!-- Vertical Nav -->
            <ul class="nav flex-column nav-pills">
               <li class="nav-item"><a class="nav-link active" href="#">Active</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
               <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
               <li class="nav-item"><a class="nav-link disabled" href="#"
                  tabindex="-1" aria-disabled="true">Disabled</a></li>
            </ul>
            <!-- end of Vertical Nav -->
         </div>
         <!-- end of Left Menu  -->


         <!-- Right area -->
         <div class="col-sm-9">

            <!-- Contents area -->
            <div class="border border-info p-4 rounded">
               <h5>회원 정보 수정</h5>

               <hr class="featurette-divider">

               <form action="/member/modify" method="POST"
                  enctype="multipart/form-data">
                  <div class="form-group">
                     <div class="col-md-5 col-lg-5 " align="center">
                        <c:set var="fileCallPath"
                           value="${ profilePicVO.uploadpath }/${profilePicVO.mid}/s_${ profilePicVO.uuid }_${ profilePicVO.filename }" />
                        <img src="/display?fileName=${fileCallPath}" id="preview-image"
                           class="img-thumbnail">
                     </div>
                  </div>
                  <div class="form-group">
                     <div id="fileBox">
                        <input type="file" name="file" id="input-image" accept="image/*">
                     </div>
                  </div>
                  <div class="form-group">
                     <label for="id"> <i class="material-icons align-middle">account_box</i>
                        <span class="align-middle">아이디</span>
                     </label> <input type="text" value="${ sessionScope.id }"
                        class="form-control" id="id" aria-describedby="idHelp" name="id"
                        required autofocus readonly="readonly">
                  </div>



                  <div class="form-group">
                     <label for="name"> <i class="material-icons align-middle">person</i>
                        <span class="align-middle">이름</span>
                     </label> <input type="text" class="form-control" id="name" name="name">
                  </div>

                  <div class="form-group">
                     <label for="birthday"> <i
                        class="material-icons align-middle">event</i> <span
                        class="align-middle">생년월일</span>
                     </label> <input type="date" class="form-control" id="birthday"
                        name="birthday">
                  </div>

                  <div class="form-group">
                     <label for="gender"> <i
                        class="material-icons align-middle">wc</i> <span
                        class="align-middle">성별 선택</span>
                     </label> <select class="form-control" id="gender" name="gender">
                        <option value="" disabled selected>성별을 선택하세요.</option>
                        <option value="M">남자</option>
                        <option value="F">여자</option>
                        <option value="U">선택 안함</option>
                     </select>
                  </div>

                  <div class="form-group">
                     <label for="email"> <i
                        class="material-icons align-middle">mail</i> <span
                        class="align-middle">이메일 주소</span>
                     </label> <input type="email" class="form-control" id="email" name="email">
                  </div>



                  <div class="text-center">
                     <label class="mr-3">이벤트 등 알림 메일 수신동의 : </label>
                     <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline1" name="recvEmail"
                           class="custom-control-input" value="Y" checked> <label
                           class="custom-control-label" for="customRadioInline1">동의함</label>
                     </div>
                     <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="customRadioInline2" name="recvEmail"
                           class="custom-control-input" value="N"> <label
                           class="custom-control-label" for="customRadioInline2">동의
                           안함</label>
                     </div>
                  </div>

                  <div class="my-3 text-center">
                     <button type="submit" class="btn btn-primary">회원 정보 수정</button>
                     <button type="reset" class="btn btn-primary ml-3">초기화</button>
                  </div>
               </form>

            </div>
            <!-- end of Contents area -->
         </div>
         <!-- end of Right area -->
      </div>
   </div>
   <!-- end of middle container -->



   <%--include bottomFooter.jsp --%>
   <jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />


   <%--include javascripts.jsp --%>
   <jsp:include page="/WEB-INF/views/include/javascripts.jsp" />
   <script>
      $('input#id').on(
            'keyup',
            function() {

               let id = $(this).val();
               if (id.length == 0) {
                  return;
               }

               //ajax 함수 호출
               $.ajax({
                  url : '/api/members/' + id + '.json',
                  method : 'GET',
                  success : function(data) {
                     console.log(typeof data); // object
                     console.log(data); // {}         

                     if (data.count == 0) {
                        $('small#idHelp').html('사용가능한 아이디 입니다.')
                              .removeClass('text-muted').removeClass(
                                    'text-danger').addClass(
                                    'text-success');
                     } else { // data.count == 1
                        $('small#idHelp').html('사용중인 아이디 입니다.')
                              .removeClass('text-muted').removeClass(
                                    'text-success').addClass(
                                    'text-danger');

                     }
                  },
                  error : function(request, status, error) {
                     alert('code: ' + request.status + '\n message:'
                           + request.responseText + '\n error: '
                           + error);
                  }
               });
            })
   </script>
   <script>
      function readImage(input) {
          // 인풋 태그에 파일이 있는 경우
          if(input.files && input.files[0]) {
              // 이미지 파일인지 검사 (생략)
              pathpoint = input.value.lastIndexOf('.');
            filepoint = input.value.substring(pathpoint+1,input.length);
            filetype = filepoint.toLowerCase();
            

             // FileReader 인스턴스 생성
              const reader = new FileReader();
              // 이미지가 로드가 된 경우
              reader.onload = e => {
                  const previewImage = document.getElementById("preview-image");
                  previewImage.src = e.target.result;
              }
              // reader가 이미지 읽도록 하기
              reader.readAsDataURL(input.files[0]);
          }
      }
      
      // input file에 change 이벤트 부여
      const inputImage = document.getElementById("input-image")
      inputImage.addEventListener("change", e => {
          readImage(e.target)
      })

   </script>

</body>
</html>