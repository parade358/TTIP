<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <div class="modal fade" id="profilePictureUploadModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h1 class="modal-title fs-5" id="profilePictureLabel">프로필 사진 등록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="profilePictureId" class="mainCategoryWrap">
                	<form action="profilePictureUpload.pr" id="profile-form"enctype="multipart/form-data"></form>
	                <div class="modal-body imageUploadContainer">
	                		<div class="imageUploadItem">
		                	   <div class="imageUploadBtn" id="insertProfileImage">사진 등록하기</div>
						       <input type="file" accept="image/*" name="image" id="insertProfileImageInput" required></input>
	                		</div>
	                		<div class="imageUploadItem">
	                			<div class="imageUploadBtn">기본 이미지로 변경</div>
						       <input type="file" accept="image/*" name="image"></input>
	                		</div>
			               <div class="modal-footer">
			               		
			              </div>
	            	</div>
		        </div>
            </div>
        </div>
    </div>
</body>
</html>