<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TTIP</title>
</head>
<body>
	
	<!-- 헤더바 -->
    <%@include file="common/header.jsp" %>

    <!--캐러셀-->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" align="center">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${contextPath }/resources/main/이미지1.jpg" class="d-block w-100" alt="">
          </div>
          <div class="carousel-item">
            <img src="${contextPath }/resources/main/이미지2.jpg" class="d-block w-100" alt="">
          </div>
          <div class="carousel-item">
            <img src="${contextPath }/resources/main/이미지3.jpg" class="d-block w-100" alt="">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

    <!-- 푸터 -->
    <jsp:include page="common/footer.jsp"/>

</body>
</html>