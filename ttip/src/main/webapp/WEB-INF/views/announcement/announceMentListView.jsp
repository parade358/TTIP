<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TTIP</title>
    
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    
    <!-- 부트스트랩 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/annoucement/annoucementList.css">
	
	
</head>
<body>

    <!-- 헤더바 -->
    <%@include file="../common/header.jsp" %>

	
	<div id="list">
		
        <div id="title">
            <h1>공고리스트</h1>
        </div>

        <div id="category">
            <select class="form-select" aria-label="Default select example" id="main">
                <option selected>메인 카테고리</option>
                <option value="1">스포츠</option>
                <option value="2">악기</option>
                <option value="3">댄스</option>
              </select>
              <select class="form-select" aria-label="Default select example" id="sub">
                <option selected>세부 카테고리</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
              </select>
        </div>
        <div>
        
            <div id="searchBarDiv">
                <input type="text" placeholder="검색창" id="searchBar"><button id="searchBtn">검색</button>
            </div>

            <div id="announceList">

                <div class="announce">
                    <div class="userName">최유성</div>
                    <div class="announceInfo">★9.8 스포츠 · 축구 · 실력 : 중 · 양천구</div>
                    <div class="userText">축구를 알려드릴수있습니다. 배우고싶은 취미는 아무거나 괜찮습니다^^ 편하게 채팅주세요</div>
                </div>
                <div class="userImgDiv"><img src="${contextPath }/resources/image/userImg.png" class="userImg"></div>
    
                <div class="announce">
                    <div class="userName">이민호</div>
                    <div class="announceInfo">★5.4 취미 · 요리 · 실력 : 상 · 영등포구</div>
                    <div class="userText" >여성분들에게 요리를 알려드리고싶어요 ㅎㅎ</div>
                </div>
                <div class="userImgDiv"><img src="${contextPath }/resources/image/userImg.png" class="userImg"></div>
    
                <div class="announce">
                    <div class="userName">김유저</div>
                    <div class="announceInfo">★7.8 스포츠 · 농구 · 실력 : 하 · 강남구</div>
                    <div class="userText">농구를 알려드립니다. 잘하진 못하지만 서로 열심히 해보아요</div>
                </div>
                <div class="userImgDiv"><img src="${contextPath }/resources/image/userImg.png" class="userImg"></div>
				
				<div class="announce">
                    <div class="userName">홍길동</div>
                    <div class="announceInfo">★8.7 스포츠 · 축지법 · 실력 : 상 · 전국팔도</div>
                    <div class="userText">동에번쩍 서에번쩍</div>
                </div>
                <div class="userImgDiv"><img src="${contextPath }/resources/image/userImg.png" class="userImg"></div>
				
				<div class="announce">
                    <div class="userName">전수현</div>
                    <div class="announceInfo">★8 취미 · 늦지않는법 · 실력 : 상 · 노원구</div>
                    <div class="userText">약속시간을 지키는 비법</div>
                </div>
                <div class="userImgDiv"><img src="${contextPath }/resources/image/userImg.png" class="userImg"></div>
                
                <div class="announce">
                    <div class="userName">권예찬</div>
                    <div class="announceInfo">★9.9 취미 · 피카츄배구 · 실력 : 상 · 이레빌딩</div>
                    <div class="userText">피카츄 배구 마스터</div>
                </div>
                <div class="userImgDiv"><img src="${contextPath }/resources/image/userImg.png" class="userImg"></div>
				
				<div class="announce">
                    <div class="userName">오유빈</div>
                    <div class="announceInfo">★10 취미 · 피카츄배구 · 실력 : 상상 · 미아리</div>
                    <div class="userText">피카츄 배구 마스터의 사부</div>
                </div>
                <div class="userImgDiv"><img src="${contextPath }/resources/image/userImg.png" class="userImg"></div>
				
				
            </div>



        </div>
	
	</div>

    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>