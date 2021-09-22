<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jsp와 java 연결해주는 느낌 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%-- include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<link rel="stylesheet" href="/resources/css/test.css">
</head>
<body>
	<%-- include topNavbar.jsp --%>
	<jsp:include page="/WEB-INF/views/include/topNavbar.jsp" />



	<!-- middle container -->
	<div class="container mt-4">

		<!-- Right area -->
		<div class="col">

			<!-- Contents area -->
			<div class="border border-info p-4 rounded">
				<h4>이미지 갤러리</h4>
				<h5>이미지 개수 ${ imageCount }</h5>

				<hr class="featurette-divider">

				<c:choose>
					<c:when test="${imageCount > 0 }">
						<div class="row">
							<c:forEach var="attach" items="${galleryImg }">
								<c:if test="${ attach.filetype eq 'I'}">
									<c:set var="fileCallPath"
										value="${attach.uploadpath }/s_${attach.uuid }_${attach.filename }" />
									<c:set var="originPath"
										value="${attach.uploadpath }/${attach.uuid }_${attach.filename }" />
									<div class="test">
										<a href="/display?fileName=${originPath}"> <img
											src="/display?fileName=${fileCallPath}">

										</a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<span>이미지 파일이 없습니다.</span>
					</c:otherwise>
				</c:choose>
				<!-- pagination area -->
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center my-4">
              
              <%-- 이전 --%>
              <li class="page-item ${ (pageMaker.prev) ? '' : 'disabled' }">
              	<a class="page-link" href="${ (pageMaker.prev) ? '/board/list?pageNum=' += (pageMaker.startPage - 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#board">이전</a>
              </li>
              
              <%-- 시작페이지 번호 ~ 끝페이지 번호 --%>
              <c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
              	<li class="page-item ${ (pageMaker.cri.pageNum eq i) ? 'active' : '' }">
              		<a class="page-link" href="/board/list?pageNum=${ i }&type=${ pageMaker.cri.type }&keyword=${ pageMaker.cri.keyword }#board">${ i }</a>
              	</li>
              </c:forEach>
              
              <%-- 다음 --%>
              <li class="page-item ${ (pageMaker.next) ? '' : 'disabled' }">
              	<a class="page-link" href="${ (pageMaker.next) ? '/board/list?pageNum=' += (pageMaker.endPage + 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#board">다음</a>
              </li>

              </ul>
            </nav>
            <!-- end of pagination area -->
			</div>
		</div>
	</div>

	



	<%-- include bottomFooter.jsp --%>
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />


	<%-- include javascripts.jsp --%>
	<jsp:include page="/WEB-INF/views/include/javascripts.jsp" />

</body>
</html>