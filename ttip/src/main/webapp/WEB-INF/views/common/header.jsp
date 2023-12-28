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
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <!-- CSS 파일 -->
    <link rel="stylesheet" href="${contextPath }/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath }/resources/css/footer.css">
</head>
<body>
	<c:if test="${not empty alertMsg }">
		<script>
			var alertMsg = "${alertMsg}";
			alert(alertMsg);
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	
	<header class="header">
        <div class="header-container">
            <div class="logo-selection">
                    <a href="${contextPath}">
    					<img src="${contextPath}/resources/main/logo.png" alt="logo" class="logo">
					</a>
            </div>
            <div class="left-selection">
                <span class="header-element">공지사항</span>
                <span class="header-element">커뮤니티</span>
                <span class="header-element"><a href="profile.pr">프로필</a></span>
                <span class="header-element"><a href="announceMentEnroll.an?currentPage=1" id="gonggo">운봉공고</a></span>
            </div>
            <div class="center-selection">
				<form action="" class="d-flex">
					<input class="searchBar" type="text" placeholder="어떤 서비스가 필요하세요?">
				</form>
			</div>
			<span class="header-element">프로필</span> <span class="header-element">채팅</span>
			<c:choose>
				<c:when test="${empty loginUser}">
					<div class="right-selection">
						<span class="header-element"><a
							href="${contextPath}/login.me" id="login">로그인</a></span> <span
							class="header-element"><a href="${contextPath}/enroll.me"
							id="join">회원가입</a></span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="logo-image">
						<a href="#" onclick="toggleSelect();"> <img
							src="${contextPath}/이미지파일경로" alt="프로필이미지" class="logo">
						</a>

						<div id="selectContainer">
							<div class="dropdown-menu" id="dropdownMenu">
								<span style="font-weight: bold; font-size: 16px;"> &nbsp; ${loginUser.userNickName}님 환영합니다. </span> <hr>
								<a href="${contextPath}/mypage.me">마이페이지</a> 
								<a href="${contextPath}/logout.me">로그아웃</a>
							</div>
						</div>
					</div>
				</c:otherwise>

			</c:choose>
        </div>
    </header>
    
    <script>
		function toggleSelect() {
			var selectContainer = document.getElementById("dropdownMenu");
			selectContainer.classList.toggle("show");
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			if (!event.target.matches('.logo')) {
				var dropdowns = document
						.getElementsByClassName("dropdown-menu");
				for (var i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>
    
</body>
</html>