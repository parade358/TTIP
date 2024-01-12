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
	    
	    .dropdown-menu {
	    	left : 1150px;
	    }
	    
	    .header-Btn-new {
	    	margin-left: 45px;
	    	text-decoration: none;
    		color: black;
    		margin-bottom : 5px;
	    }
	    
	    #yourDivId{
        	display : none;
        	text-align: center;
    		margin-top: 20px; /* 상단 여백 조절 */
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
	
	<div id="yourDivId">
		<a href="chat2">채팅이 도착했습니다!! 클릭하여 채팅방으로 이동</a>
	</div>
	
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
                <span class="header-element"><a href="newChat" class="header-Btn" style="text-decoration: none;color: black;">재능교환</a></span>
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
					<span class="header-element"><a href="chat2" class="header-Btn" style="text-decoration: none;color: black;">채팅</a></span>
					<div class="logo-image">
						<a href="#" onclick="toggleSelect();"> <img src="${contextPath}/resources/image/userImg.png" alt="프로필이미지" class="logo">
						</a>
						<div id="selectContainer">
						<c:choose>
						    <c:when test="${loginUser.email eq 'admin'}">
						    	<div class="dropdown-menu" id="dropdownMenu">
									<span style="font-weight: bold; font-size: 16px;"> &nbsp; ${loginUser.userNickName}님 환영합니다. </span> <hr>
									<a href="${contextPath}/adminPage.ad" class="header-Btn-new">관리자페이지</a><br>
									<a href="${contextPath}/mypage.me" class="header-Btn-new">마이페이지</a><br>
									<a href="${contextPath}/logout.me" class="header-Btn-new">로그아웃</a>
								</div>
						    </c:when>
						    <c:otherwise>
								<div class="dropdown-menu" id="dropdownMenu">
									<span style="font-weight: bold; font-size: 16px;"> &nbsp; ${loginUser.userNickName}님 환영합니다. </span> <hr>
									<a href="${contextPath}/mypage.me" class="header-Btn-new">마이페이지</a><br>
									<a href="${contextPath}/logout.me" class="header-Btn-new">로그아웃</a>
								</div>
						    </c:otherwise>
						</c:choose>
							
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
	
	<script>
    //웹소켓 접속 함수 
		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 때문에 전역변수에 담아두고 사용한다)
		
		//연결함수(접속)
		
		$(function() {
			if("${loginUser}" !== ""){
				connect();
			}
		});
		
		function connect(){
			//접속경로를 담아 socket을 생성한다.
			var url = "ws://localhost:8888/ttip/member";
			socket = new WebSocket(url);
			
			//연결이 되었을때
			socket.onopen = function(){
				console.log("연결 성공");	
			};
			//연결이 종료됐을때
			socket.onclose = function(){
				console.log("연결 종료");
			};
			//에러가 발생했을때
			socket.onerror = function(e){
				console.log("에러가 발생했습니다.");
				console.log(e);
			}
			//메세지가 왔을때 
			socket.onmessage = function(message){
				console.log("메세지가 도착했습니다.");
				console.log(message); 
				
				hideDivAfterDelay();
				
			}
		}
		
		
		function hideDivAfterDelay() {
		    
		    $('#yourDivId').css('display', 'block');
		    
		    setTimeout(function () {
		        // div 숨기기
		        $('#yourDivId').css('display', 'none');
		    }, 4000); // 2000 milliseconds = 2 seconds
		}

    </script>
    
</body>
</html>