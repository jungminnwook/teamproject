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
					<h5>회원 탈퇴</h5>

					<hr class="featurette-divider">

					<form action="/member/remove" method="POST" id="kks">
						<div class="form-group">
							<label for="id"> <i class="material-icons align-middle">account_box</i>
								<span class="align-middle">아이디</span>
							</label> <input type="text" value="${ sessionScope.id }"
								class="form-control" id="id" aria-describedby="idHelp" name="id"
								required autofocus readonly="readonly">
						</div>
						<label for="inputPassword" class="sr-only">Password</label> <input
							type="password" name="passwd" id="inputPassword"
							class="form-control" placeholder="비밀번호" required>

						<div class="my-3 text-center">

							<button type="submit" class="frm, btn btn-primary">회원 탈퇴</button>

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
		var frm = document.querySelector('#kks');

		frm.addEventListener('submit', function(event) {

			event.preventDefault();

			var isRemove = confirm('회원 탈퇴 하시겠습니까?');

			if (!isRemove) {
				return;
			}

			frm.submit();

		});
	</script>



</body>
</html>