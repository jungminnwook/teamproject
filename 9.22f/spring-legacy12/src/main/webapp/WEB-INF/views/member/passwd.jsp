<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <h5>비밀번호 변경</h5>

            <hr class="featurette-divider">

          
             <form action="/member/passwd" method="POST">
              <div class="form-group">
                <label for="id">
                  <i class="material-icons align-middle">account_box</i>
                  <span class="align-middle">아이디</span>
                </label>
                <input type="text" value="${ sessionScope.id }" class="form-control" id="id" aria-describedby="idHelp" name="id" required autofocus readonly="readonly">
                <small id="idHelp" class="form-text">아이디는 필수 입력 요소입니다.</small>
              </div>

              <div class="form-group">
                <label for="password">
                  <i class="material-icons align-middle">lock</i>
                  <span class="align-middle">비밀번호</span>
                </label>
                <input type="password" class="form-control" id="password" aria-describedby="pwdHelp" name="passwd" required>
                <small id="pwdHelp" class="form-text text-muted">비밀번호는 필수 입력 요소입니다.</small>
              </div>
              <div class="form-group">
                <label for="password2">
                  <i class="material-icons align-middle">check</i>
                  <span class="align-middle">비밀번호 재확인</span>
                </label>
                <input type="password" class="form-control" id="password2">
              </div>

              
              
              <div class="my-3 text-center">
                <button type="submit" class="btn btn-primary">비밀번호 수정</button>
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
   $('input#id').on('keyup', function(){
      
      let id = $(this).val();
      if (id.length == 0){
         return;
      }
      
      //ajax 함수 호출
      $.ajax({
         url: '/api/members/' + id + '.json',
         method: 'GET',
         success: function(data){
            console.log(typeof data); // object
            console.log(data); // {}         
            
            if (data.count == 0){
               $('small#idHelp').html('사용가능한 아이디 입니다.')
                  .removeClass('text-muted').removeClass('text-danger')
                  .addClass('text-success');
            }else{ // data.count == 1
               $('small#idHelp').html('사용중인 아이디 입니다.')
                  .removeClass('text-muted').removeClass('text-success')
                  .addClass('text-danger');
               
            }
         },
         error: function(request, status, error){
            alert('code: ' + request.status + '\n message:' + request.responseText + '\n error: ' +error);
         }    
      });
   })</script>


</body>
</html>