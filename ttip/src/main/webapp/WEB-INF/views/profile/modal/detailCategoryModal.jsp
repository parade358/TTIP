<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 대표서비스, 제공서비스 모달 -->
        <div class="modal fade" id="detailCategoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">어떤 서비스를 제공할 수 있나요?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="selectDetailCategoryId" class="mainCategoryWrap">
	                <div class="modal-body">
					        <div class="wrap" id="main-category-list">
					            <div class="category" id="mainCategoryBoxId">
					            </div>
					        </div>
					        <div class="wrap2" id="detail-category-list">
					            <div class="category" id="detailCategoryBoxId">
					            </div>
					        </div>
			                <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" id="mainPageBackPage">이전</button>
			                <button type="button"class="btn" id="selectDetailCateBtn"onclick="selectDetailCategory();">다음</button>
			                <button type="button" class="btn" id="selectDetailCateBtn2" style="display:none" data-bs-dismiss="modal">다음</button>
			              </div>
	            	</div>
		        </div>
            </div>
        </div>
    </div>
</body>
</html>