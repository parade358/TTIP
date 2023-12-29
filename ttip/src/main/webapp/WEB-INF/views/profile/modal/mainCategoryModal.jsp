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
        <div class="modal fade" id="mainCategoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h1 class="modal-title fs-5" id="mainModalLabel">어떤 서비스를 제공할 수 있나요?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="selectMainCategoryId" class="mainCategoryWrap">
	                <div class="modal-body">
					        <div class="wrap" id="main-category-list-2">
					            <div class="category" id="mainCategoryBoxId2">
					            </div>
					        </div>
					        <div class="wrap2" id="detail-category-list-2">
					            <div class="category" id="detailCategoryBoxId2">
					            </div>
					        </div>
			                <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" id="mainPageBackPage2">이전</button>
			                <button type="button"class="btn" id="selectDetailCateBtnn"onclick="selectDetailCategory2();">다음</button>
			                <button type="button" class="btn" id="selectDetailCateBtnn2" style="display:none" data-bs-dismiss="modal">다음</button>
			              </div>
	            	</div>
		        </div>
            </div>
        </div>
    </div>
</body>
</html>