<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 사진 및 동영상 모달 -->
    <div class="modal fade" id="uploadPicture" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">사진 및 동영상</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <main class="app">
                    <div class="upload-header">
                        <h2>사진 업로드</h2>
                        <div class="server-message"></div>
                    </div>
            
                    <div class="input-div">
                        <p>이미지를 드래그 & 드랍으로 넣거나 <span class="browse">파일 찾기</span></p>
                        <input type="file" class="file" multiple="multiple" accept="image/png, image/jpeg, image/jpg">
                    </div>
                    <form action="" id="queued-form">
                        <div class="upload-header">
                            <h3>업로드될 사진</h3>
                            <button type="submit" class="uploadBtn">Upload</button>
                        </div>
                        <div class="queued-div"></div>
                    </form>
                </main>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit"class="btn">다음</button>
            </div>
        </div>
        </div>
    </div>
</body>
</html>