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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/carousel.css">
	
	<style>
		.btnImg{
			width : 50px;
			height : 50px
		}
		
	    .hover03 {
	      -webkit-transition: margin 0.2s ease-in-out;
	      transition: margin 0.2s ease-in-out;
	    }
	
	    .hover03:hover {
	      cursor: pointer;
	      margin-top: -5px;
    	}
    	
    	#hot {
		    height: 500px;
		    width: 950px;
		    background-color: beige;
		    border-radius: 10px;
		    display: flex;
		    justify-content: space-around;
		    margin-left: auto;
		    margin-right: auto;
		    margin-bottom: 30px;
		}
		
    	#hotTalent {
		    height: 500px;
		    width: 950px;
		    background-color: #3282F6;
		    border-radius: 10px;
		    display: flex;
		    justify-content: space-around;
		    margin-left: auto;
		    margin-right: auto;
		    margin-bottom: 30px;
		}
		
    	#etc {
		    height: 500px;
		    width: 950px;
		    background-color: #C8BFE7;
		    border-radius: 10px;
		    display: flex;
		    justify-content: space-around;
		    margin-left: auto;
		    margin-right: auto;
		    margin-bottom: 30px;
		}
  </style>
	
	
</head>
<body>
	
	<!-- 헤더바 -->
    <%@include file="common/header.jsp" %>

    <!--캐러셀-->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" align="center" style="margin-bottom: 30px;">
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
      
    <div id="mainBtn1" style="display: flex;
							  justify-content: space-evenly;
							  margin-left: auto;
    						  margin-right: auto;
							  width: 970px;
							  margin-bottom: 30px;"
							  align="center">
    
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/art.png" class="btnImg"><p>미술</p></div>
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/dance.png" class="btnImg"><p>댄스</p></div>
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/hobby.png" class="btnImg"><p>취미</p></div>
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/language.png" class="btnImg"><p>외국어</p></div>
    
    </div>  
    <div id="mainBtn2" style="display: flex;
						      justify-content: space-evenly;
						      margin-left: auto;
    						  margin-right: auto;
						      width: 970px;
						      margin-bottom: 30px;"
						      align="center">
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/music.png" class="btnImg"><p>악기</p></div>
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/picture.png" class="btnImg"><p>사진</p></div>
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/sports.png" class="btnImg"><p>스포츠</p></div>
    	<div class="hover03" style="height: 70px;" onclick="navigateToAnnounceMentList()"><img src="${contextPath }/resources/main/sports.png" class="btnImg"><p>스포츠</p></div>
    </div> 
    
    <div align="center" id="hot">
    	인기게시글
    </div> 
    
    <div align="center" id="hotTalent">
    	인기있는 재능
    </div>
    
    <div align="center" id="etc">
    	기타 등등
    </div> 

    <!-- 푸터 -->
    <jsp:include page="common/footer.jsp"/>
    
    <script>
	  // hover03 div 클릭 이벤트 처리 함수
	  function navigateToAnnounceMentList() {
	    window.location.href = 'announceMentList.an';  // 이 부분에 매핑하고자 하는 주소를 넣으세요.
	  }
	</script>
	
	
    

</body>
</html>