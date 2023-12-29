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
	<!-- font-awesome -->
	<script src="https://kit.fontawesome.com/28c3f049d0.js" crossorigin="anonymous"></script>
	
	 <style>
	    .searchBar {
	      width: 250px;
	      padding: 10px;
	      font-size: 16px;
	      border: 0px;
	      border-radius: 5px;
	      outline: none;
	      background-color : #F4F4F4;
	    }
	
	    .searchBar::placeholder {
	      color: #999;
	    }
	  </style>
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
                <span class="header-element"><a href="profile.pr" class="header-Btn" style="text-decoration: none;color: black;">프로필</a></span>
                <span class="header-element"><a href="" class="header-Btn" style="text-decoration: none;color: black;">공지사항</a></span>
                <span class="header-element"><a href="" class="header-Btn" style="text-decoration: none;color: black;">커뮤니티</a></span>
                <span class="header-element"><a href="announceMentEnroll.an?currentPage=1" class="header-Btn" style="text-decoration: none;color: black;">재능교환</a></span>
            </div>
            <div class="center-selection">
				<form action="" class="d-flex">
					<input class="searchBar" type="text" placeholder="어떤 서비스가 필요하세요?">
				</form>
			</div>
			<c:choose>
				<c:when test="${empty loginUser}">
					<div class="right-selection">
						<span class="header-element"><a href="${contextPath}/login.me" id="login" style="text-decoration: none;color: black;">로그인</a></span> 
						<span class="header-element"><a href="${contextPath}/enroll.me" id="join" style="text-decoration: none;color: black;">회원가입</a></span>
					</div>
				</c:when>
				<c:otherwise>
					<span class="header-element"><a href="profile.pr" class="header-Btn" style="text-decoration: none;color: black;">프로필</a></span>
					<span class="header-element"><a href="chat" class="header-Btn" style="text-decoration: none;color: black;">채팅</a></span>
					<div class="logo-image">
						<a href="#" onclick="toggleSelect();"> <img src="${contextPath}/resources/image/userImg.png" alt="프로필이미지" class="logo">
						</a>
						<div id="selectContainer">
							<div class="dropdown-menu" id="dropdownMenu">
								<span style="font-weight: bold; font-size: 16px;"> &nbsp; ${loginUser.userNickName}님 환영합니다. </span> <hr>
								<a href="${contextPath}/mypage.me" class="header-Btn" >마이페이지</a><br>
								<a href="${contextPath}/logout.me" class="header-Btn">로그아웃</a>
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