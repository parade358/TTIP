<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/annoucement.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Orbit&display=swap" rel="stylesheet">
</head>

<body>
    <div class="allPage">
    	<form action="selectDetailCategory.an" method="get">
    		<input type="hidden" name="currentPage" value="2">
	        <div class="wrap">
	            <!--progress bar (페이지 진행도)-->
	            <div class="progressContainer">
	                <div id="progress">
	                    <div id="bar"></div>
	                </div>
	                <span class="barPercentage">50%</span>
	            </div>
	            <div class="title">
	                <h1>어떤 서비스를 제공할 수 있나요?</h1>
	            </div>
	            <div class="category">
	            	<c:forEach var="list" items="${list }">
		                <div class="main-category">
		                    <label class="container">${list.categoryName }
		                        <input type="checkbox" name="checkedCategory" value="${list.categoryNo }">
		                        <span class="checkmark"></span>
		                    </label> 
		                </div>
	            	</c:forEach>
	            </div>
	        </div>
	      <div class="transferBtn">
	            <a class="btn" href="${backPage }">이전</a>
	            <button type="submit"class="btn">다음</button>
	        </div>
        </form>
		    <!-- Button trigger modal -->
		<button type="button" id="hiddenModalBtn"class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"></button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        공고 등록 전 프로필 작성을 해야 합니다.
		      </div>
		      <div class="modal-footer">
		        <a type="button" class="btn btn-secondary" data-dismiss="modal" href="${backPage }">이전</a>
		        <a type="button" class="btn btn-primary" href="${contextPath }/">이동</a>
		      </div>
		    </div>
		  </div>
		</div> 
		
		<script>
		  $(function(){
			
		    $("#hiddenModalBtn").click().hide();
		  });
		</script>
    <input type="text"id="hiddenCurrentPage" class="hiddenNum" value="${currentPage}"></input>
    <script src="${contextPath }/resources/js/announcement.js"></script>
   </div>
</body>

</html>