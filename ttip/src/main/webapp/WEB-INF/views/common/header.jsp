<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- contextPath -->
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
	
	<!-- 이전 페이지 referer -->
	<c:set var="backPage" value='<%=request.getHeader("referer")%>'/> 
    <!-- 기본 라이브러리 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- 부트스트랩 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
   
    <!-- JS파일 -->
    <script src="${contextPath }/resources/js/carousel.js"></script>
    
    <!-- CSS 파일 -->
    <link rel="stylesheet" href="${contextPath }/resources/css/header.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/carousel.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/footer.css">
</head>
<body>
	<header class="header">
        <div class="header-container">
            <div class="logo-selection">
                    <img src="${contextPath }/resources/main/logo.png" alt="logo" class="logo" onclick="">
            </div>
            <div class="left-selection">
                <span class="header-element">공지사항</span>
                <span class="header-element">커뮤니티</span>
                <span class="header-element"><a href="profile.pr">프로필</a></span>
                <span class="header-element"><a href="announceMentEnroll.an?currentPage=1" id="gonggo">운봉공고</a></span>
            </div>
            <div class="center-selection">
                <form action="" class="d-flex">
                    <input class="form-control me-2" type="text" placeholder="어떤 서비스가 필요하세요?">
                </form>
            </div>
            <div class="right-selection">
                <span class="header-element">로그인</span>
                <span class="header-element">회원가입</span>
            </div>
        </div>
    </header>
</body>
</html>