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
    	<form action="insertDetailCtg.an" method="get">
    		<input type="hidden" name="currentPage"value="3">
	        <div class="wrap">
	            <!--progress bar (페이지 진행도)-->
	            <div class="progressContainer">
	                <div id="progress">
	                    <div id="bar"></div>
	                </div>
	                <span class="barPercentage">80%</span>
	            </div>
	            <div>
	                <h1>어떤 서비스를 제공할 수 있나요?</h1>
	            </div>
	            <div class="category">
	            	<c:forEach var="list" items="${list }">
		                <div class="main-category">
		                    <label class="container">${list.detailName }
		                        <input type="checkbox" name="checkedCategory" value="${list.detailNo}">
		                        <span class="checkmark"></span>
		                    </label> 
		                </div>
	            	</c:forEach>
	            </div>
	        </div>
	        <div class="transferBtn">
	            <a class="btn" onclick="javascript:history.go(-1);">이전</a>
	            <button type="submit"class="btn">다음</button>
	        </div>
        </form>
    </div>
    <input type="text"id="hiddenCurrentPage" class="hiddenNum" value="${currentPage}"></input>
    <script src="${contextPath }/resources/js/announcement.js"></script>
</body>

</html>