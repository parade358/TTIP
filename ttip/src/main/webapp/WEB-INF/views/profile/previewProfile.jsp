<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/profile/previewProfile.css">
    <script src="https://kit.fontawesome.com/28c3f049d0.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="allContainer">
        <div class="allContainerItem">
            <div class="blurbackgrounAndProfile">
                <div class="blurbackground">
                	<img src="https://i.pinimg.com/564x/88/3d/74/883d74b5eca63acc4e07773f3a645ba6.jpg" id="blurbackgroundId">
                </div>
                <div class="profilePictureContainer">
                	<div class="profilePictureItem">
	                    <img src="https://i.pinimg.com/564x/88/3d/74/883d74b5eca63acc4e07773f3a645ba6.jpg" id="previewProfileId">
                	</div>
                </div>
            </div>
            <div class="bannerAndInfo">
                <div class="twoSection">
                    <div class="container1" id="container1Id">
                        <div class="nickname"><h2>${loginUser.userNickName }</h2></div>
                        <div class="mainService">${p.mainService }</div>
                        <div class="address"><i class="fas fa-map-marker-alt"></i> ${p.address }</div>
                        <div class="oneLineIntroduce">${p.oneLineIntro }</div>
                    </div>
                    <div class="container2">
                        <div class="detailInfoItem">
                            <div class="infoTitle"><h3>고수 정보</h3></div>
                            <div class="phoneAvailable"><i class="fa-regular fa-clock"></i> ${p.phoneAvailable }</div>
                        </div>
                        <div class="detailInfoItem">
                            <div class="infoTitle"><h3>서비스 상세설명</h3></div>
                            <div class="detailServiceDescription">${p.serviceDetailContent }</div>
                        </div>
                        <div class="detailInfoItem">
                            <div class="infoTitle"><h3>제공 서비스</h3></div>
                            <div class="subService" id="subServiceId"></div>
                        </div>
                    </div>
                    <hr>
                    <div class="container3">
                        <div class="infoTitle"><h3>사진 및 동영상</h3></div>
                        <div class="imageVideo" id="imageVideoId"></div>
                    </div>
                    <hr>
                    <div class="container4">
                        <div class="infoTitle"><h3>질문답변</h3></div>
                        <div class="questionAnswer">
                        	<div class="answered-box-result">
	                        	<ul id="answered-box-ul">
	                        		<li>
	                        			<div class="question-box">Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</div>
                        				<div class="answered-item"id="startServiceId"></div>
	                        		</li>
                        			<li>
		                        		<div class="question-box">Q. 어떤 서비스를 전문적으로 제공하나요?</div>
		                        		<div class="answered-item"id="specialListId"></div>
	                        		</li>
	                        		<li>
		                        		<div class="question-box">Q. 서비스의 견적은 어떤 방식으로 산정 되나요?</div>
		                        		<div class="answered-item"id="methodId"></div>
	                        		</li>
	                        		<li>
		                        		<div class="question-box">Q. 완료한 서비스 중 대표적인 서비스는 무엇인가요? 소요 시간은 얼마나 소요 되었나요?</div>
		                        		<div class="answered-item"id="whatisMainCategoryId"></div>
	                        		</li>
	                        		<li>
		                        		<div class="question-box">Q. A/S 또는 환불 규정은 어떻게 되나요?</div>
		                        		<div class="answered-item"id="whatisreturnId"></div>
	                        		</li>
	                        	</ul>
                        	</div>
                        </div>
                    </div>
                </div>
                <div class="twoSection">
                    <div class="banner">
                        <div class="bannerItem">
                            <p>궁금하신 것들이 있다면 채팅해보아요!</p>
                        </div>
                        <div class="bannerItem">
                            <button class="likeBtn" id="likeBtnId"><i class="fa-solid fa-heart"></i></button>
                            <button class="chatBtn" id="chatBtnId">채팅하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="userNo" value="${loginUser.userNo }">
    <input type="hidden" id="subServiceHidden" value="${p.subService }">
    <input type="hidden" id="userNo" value="${loginUser.userNo }">
    <input type="hidden" id="contextPath" value="${contextPath }">
    <input type="hidden" id="changeName" value="${p.changeName }">
    <input type="hidden" id="previewInfo" value="${p }">
    <script>
    	$(function(){
    		
    		console.log('profile 모든 정보',$('#previewInfo').val());
    		
    		//제공서비스
    		var subService = $('#subServiceHidden').val();
    	    var selectedCategory = [];
    		selectedCategory = subService.split(',');
    		var str = "";
    		for(var i in selectedCategory){
    			str += "<div class='category-box'>"+selectedCategory[i]+"</div>"
    		}
    		$("#subServiceId").html(str);
    		
    		//프로필 사진 
    		$('#previewProfileId').prop('src', $("#contextPath").val()+"/"+ $('#changeName').val());
    		
    		//blur 백그라운드
    		$('#blurbackgroundId').prop('src', $("#contextPath").val()+"/"+ $('#changeName').val());
    		//상세이미지
    		$.ajax({
        		url: "selectDetailImage.pr",
        		data: {"userNo": $("#userNo").val()},
        		success: function(imageList){
        			console.log('이미지 조회:',imageList);
        			var imageStr = "";
        			for(var i in imageList){
        				console.log('image changeName:',imageList[i].changeName);
        				imageStr += "<div class='finalDetailImageBoxClass'>"
		        						+"<img src='"+$("#contextPath").val()+'/'+imageList[i].changeName+"' alt='image'>"
		        						+"<input type='hidden' name='oldFileNo' value='"+imageList[i].atNo+"'></input>"
		        						+"<input type='hidden' name='oldChangeName' value='"+imageList[i].changeName+"'></input>"
        							+"</div>"
        			}
        			$("#imageVideoId").html(imageStr);
        		}
        	});
    		
    		
    		
    		//질문 답변 조회
    	      $.ajax({
    	       url: "selectQuestionComment.pr",
    	       data: {userNo: $("#userNo").val()},
    	       success: function(qaCommentList){
    	           console.log('제발와줘:',qaCommentList);
    	           for(var i in qaCommentList){
    	               console.log('questionNum:',qaCommentList[i].questionNum);
    	               switch(qaCommentList[i].questionNum){
    	                   case 1:
    	                       $("#startServiceId").text(qaCommentList[i].qaAnswer);
    	                       break;
    	                   case 2:
    	                       $("#specialListId").text(qaCommentList[i].qaAnswer);
    	                       break;
    	                   case 3:
    	                       $("#methodId").text(qaCommentList[i].qaAnswer);
    	                       break;
    	                   case 4:
    	                       $("#whatisMainCategoryId").text(qaCommentList[i].qaAnswer);
    	                       break;
    	                   case 5:
    	                       $("#whatisreturnId").text(qaCommentList[i].qaAnswer);
    	                       break;
    	               }
    	               
    	           }
    	           var answeredItemArr = $('#answered-box-ul .answered-item');
    	               var count = 0;
    	               answeredItemArr.each(function(){
    	                   if($(this).text()==""){
    	                       count += 1
    	                       $(this).parent().hide();
    	                   }
    	               });
    	               
    	               if(count>=5){
    	                   answeredItemArr.each(function(){
    	                       $(this).parent().show();
    	                   });
    	               }
    	              
    	       },
    	       error: function(result){
    	           console.log('질문답변을 가져오기 실패');
    	       }
    	   });
    	});
    	
    </script>
</body>
</html>