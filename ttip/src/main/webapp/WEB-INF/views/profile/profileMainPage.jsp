<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/profileMainPage.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/fileUpload.css">
</head>
</head>
<body>
    <div class="allPage">
        <div class="all-container">
            <div class="item">
                <h2>완성도 <span class="barPercentage">50%</span></h2>
                <div class="edit"></div>
                <div class="workBox">
                    <div class="progressContainer">
                        <div id="progress">
                            <div id="bar"></div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="item">
                <h2>프로필사진</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox">
                    <div class="profileContainer">
                        <div class="profileImg">
                            하
                        </div>
                        <div class="profileDetailInfo">
                            <div class="profileDetail-1">
                                <ul class="reviewData">
                                    <li class="profile-item">
                                        <div>0</div>
                                        <div>리뷰평점</div>
                                    </li>
                                    <li class="profile-item dividerBox">
                                        <div class="divider"></div>
                                    </li>
                                    <li class="profile-item">
                                        <div>0</div>
                                        <div>리뷰수</div>
                                    </li>
                                    <li class="profile-item dividerBox">
                                        <div class="divider"></div>
                                    </li>
                                    <li class="profile-item">
                                        <div>0</div>
                                        <div>고용수</div>
                                    </li>
                                </ul>
                            </div>
                            <div class="profileDetail-2">
                                <a href="">활동분석</a>
                                <a href="">미리보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="item">
                <h2>띱 활동명</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox">권예찬</div>
            </div>
            <hr>
            <div class="item">
                <h2>대표서비스</h2>
                <div class="edit"><button type="button"class="editBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button></div>
                <div class="workBox">영어과외</div>
            </div>
            <hr>
            <div class="item">
                <h2>제공 서비스</h2>
                <div class="edit"><button class="editBtn" onclick="editCategory();">수정</button></div>
                <div class="workBox">
                    <div class="categery-container">
                        <div class="category-box">+ 서비스 추가</div>
                        <div class="category-box">수학 과외</div>
                        <div class="category-box">영어 과외</div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="item">
                <h2>한줄소개</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox">고수의 수학 과외, 영어 과외 서비스</div>
            </div>
            <hr>
            <div class="item">
                <h2>활동 지역</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox">서울특별시 강남구 강남대로 지하 396</div>
            </div>
            <hr>
            <div class="item">
                <h2>연락 가능 시간</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox">
                    <div class="selectTime">
                        <div class="startTime time-select-box">
                            <select class="form-select" aria-label="Default select example">
                                <option value></option>
                                <option value="1">오전 12시</option>
                                <option value="2">오전 1시</option>
                                <option value="3">오전 2시</option>
                                <option value="3">오전 3시</option>
                                <option value="3">오전 4시</option>
                                <option value="3">오전 5시</option>
                                <option value="3">오전 6시</option>
                                <option value="3">오전 7시</option>
                                <option value="3">오전 8시</option>
                                <option value="3" selected>오전 9시</option>
                                <option value="3">오전 10시</option>
                                <option value="3">오전 11시</option>
                                <option value="3">오전 12시</option>
                                <option value="2">오후 1시</option>
                                <option value="3">오후 2시</option>
                                <option value="3">오후 3시</option>
                                <option value="3">오후 4시</option>
                                <option value="3">오후 5시</option>
                                <option value="3">오후 6시</option>
                                <option value="3">오후 7시</option>
                                <option value="3">오후 8시</option>
                                <option value="3">오후 9시</option>
                                <option value="3">오후 10시</option>
                                <option value="3">오후 11시</option>
                            </select>
                        </div>
                        <span>부터</span>
                        <div class="endTime time-select-box">
                            <select class="form-select" aria-label="Default select example">
                                <option value></option>
                                <option value="1">오전 12시</option>
                                <option value="2">오전 1시</option>
                                <option value="3">오전 2시</option>
                                <option value="3">오전 3시</option>
                                <option value="3">오전 4시</option>
                                <option value="3">오전 5시</option>
                                <option value="3">오전 6시</option>
                                <option value="3">오전 7시</option>
                                <option value="3">오전 8시</option>
                                <option value="3">오전 9시</option>
                                <option value="3">오전 10시</option>
                                <option value="3">오전 11시</option>
                                <option value="3">오전 12시</option>
                                <option value="2">오후 1시</option>
                                <option value="3">오후 2시</option>
                                <option value="3">오후 3시</option>
                                <option value="3">오후 4시</option>
                                <option value="3">오후 5시</option>
                                <option value="3"selected>오후 6시</option>
                                <option value="3">오후 7시</option>
                                <option value="3">오후 8시</option>
                                <option value="3">오후 9시</option>
                                <option value="3">오후 10시</option>
                                <option value="3">오후 11시</option>
                            </select>
                        </div>
                        <span>까지</span>
                    </div>
                </div>
            </div>
            <hr> 
            <div class="item">
                <h2>자격증 및 기타 서류 등록</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox"></div>
            </div>
            <hr>
            <div class="item">
                <h2>고수 서비스 상세설명</h2>
                <div class="edit">
                    <button class="editBtn" id="detailServiceEditBtn" onclick="showDetailServiceBox();">수정</button>
                    <button class="saveBtn" id="detailServiceSaveBtn">저장</button>
                </div>
                <div class="workBox">
                    <textarea class="detailDescription" id="detailDescription"rows="6"placeholder="다른 사용자가 가장 꼼꼼히 보는 공간입니다. 회원님의 장점과 함께 서비스 특징, 서비스 제공 방법, 준비 사항을 자세히 적어주세요!"></textarea>
                </div>
            </div>
            <hr>
            <div class="item">
                <h2>포트폴리오</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox"></div>
            </div>
            <hr>
            <div class="item">
                <h2>사진 및 동영상</h2>
                <div class="edit">
                    <button class="editBtn" data-bs-toggle="modal" data-bs-target="#uploadPicture">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox">
                </div>
            </div>
            <hr>
            <div class="item">
                <h2>질문답변</h2>
                <div class="edit">
                    <button class="editBtn" id="questionEnrollBtn" onclick="showAnswerBox();">등록하기</button>
                    <button class="saveBtn" id="questionSaveBtn">저장</button>
                </div>
                <div class="workBox">
                    <div class="question-answer-box">
                        <ul>
                            <li>
                                <div class="question-box">Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</div>
                                <textarea name="answerBox" rows="6"placeholder="상담, 예약, 서비스 진행, 대금 납부까지 어떻게 진행하는지 자세히 적어주세요."></textarea>
                            </li>
                            <li>
                                <div class="question-box">Q. 어떤 서비스를 전문적으로 제공하나요?</div>
                                <textarea name="answerBox" rows="6" placeholder="제공하는 서비스를 조금 더 구체적으로 설명해주세요."></textarea>
                            </li>
                            <li>
                                <div class="question-box">Q. 서비스의 견적은 어떤 방식으로 산정 되나요?</div>
                                <textarea name="answerBox" rows="6" placeholder="답변을 추가해주세요."></textarea>
                            </li>
                            <li>
                                <div class="question-box">Q. 완료한 서비스 중 대표적인 서비스는 무엇인가요? 소요 시간은 얼마나 소요 되었나요?</div>
                                <textarea name="answerBox" rows="6" placeholder="답변을 추가해주세요."></textarea>
                            </li>
                            <li>
                                <div class="question-box">Q. A/S 또는 환불 규정은 어떻게 되나요?</div>
                                <textarea name="answerBox" rows="6" placeholder="답변을 추가해주세요."></textarea>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr>
            <div class="item">
                <h2>리뷰</h2>
                <div class="edit">
                    <button class="editBtn">수정</button>
                    <button class="saveBtn">저장</button>
                </div>
                <div class="workBox"></div>
            </div>
            <hr>
        </div>
    </div>
        <!-- 대표서비스, 제공서비스 모달 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">어떤 서비스를 제공할 수 있나요?</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
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
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit"class="btn">다음</button>
            </div>
        </div>
        </div>
    </div>

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
                        <div class="header">
                            <h2>사진 업로드</h2>
                            <div class="server-message"></div>
                        </div>
                
                        <div class="input-div">
                            <p>이미지를 드래그 & 드랍으로 넣거나 <span class="browse">파일 찾기</span></p>
                            <input type="file" name="formData" class="file" multiple="multiple" accept="image/png, image/jpeg, image/jpg">
                        </div>
                
                        <form action="" id="saved-form">
                            <div class="header">
                                <h3>업로드된 사진</h3>
                                <button type="submit">Delete</button>
                            </div>
                            <div class="saved-div"></div>
                        </form>
                
                        <form action="" id="queued-form">
                        <input type="file" name="formData" class="file" multiple="multiple" accept="image/png, image/jpeg, image/jpg">
                            <div class="header">
                                <h3>업로드될 사진</h3>
                                <button type="submit">Upload</button>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="${contextPath }/resources/js/profileMainPage.js"></script>
    <script src="${contextPath }/resources/js/fileUpload.js"></script>
</body>
</html>