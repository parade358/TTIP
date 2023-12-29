/**
 * 
 */

 $(function(){
 			//hidden-Box 다 숨기기
 			 $("[class$='-hidden-workBox']").hide();
 			 
 			//프로필 정보 조회
   		    $.ajax({
   		    	url : "selectAllProfileInfo.pr",
   		    	data : {userNo: $("#userNo").val()},
   		    	success : function(result){
   		    		console.log('모든 프로필 정보',result);
   		    		//대표 서비스
   		    		if(result.mainService!=""){
	   		    		var selectedCategory = result.mainService;
			    		var str = "<div class='category-box'>"+selectedCategory+"</div>"
			    		$("#mainCategoryContainerBox .category-box:not(#serviceAdd2)").remove();
			    		$("#mainCategoryContainerBox").append(str);
			    	}
			    	if(result.subService!=""){
	   		    		var selectedCategory = [];
			    		selectedCategory = result.subService.split(',');
			    		var str = "";
			    		for(var i in selectedCategory){
			    			str += "<div class='category-box'>"+selectedCategory[i]+"</div>"
			    		}
			    		$("#categoryContainerBox .category-box:not(#serviceAdd)").remove();
			    		$("#categoryContainerBox").append(str);
			    	}
   		    		
		    		//한줄소개
		    		var introduceStr = result.oneLineIntro;
		    		$("#introduce-result").text(introduceStr);
		    		
		    		//연락 가능 시간
		    		var timeStr = result.phoneAvailable
		    		$("#time-selected-result").html(timeStr);
		    		
		    		//서비스 상세설명
		    		var detailDescripStr = result.serviceDetailContent;
		    		$("#detail-description-result").html(detailDescripStr);
		    		
		    		//프로필 번호
		    		var profileNo = result.profileNo;
		    		$("#profileNo").val(profileNo);
		    		
		    		//changeName 설정
		    		var changeName = result.changeName;
		    		$("#changeName").val(changeName);
		    		
		    		//이미지 불러오기
		    		var profile = result;
		    		$('#finalProfilePictureId').prop('src', $("#contextPath").val()+"/"+ profile.changeName);
   		    	}
   		    });
   		    
   		    //질문 답변 조회
   		    $.ajax({
	        	url: "selectQuestionComment.pr",
	        	data: {userNo: $("#userNo").val()},
	        	success: function(qaCommentList){
	        		console.log('제발와줘:',qaCommentList);
	        		document.querySelector("#questionSaveBtn").style.display = 'none';
				   	document.querySelector("#questionEnrollBtn").style.display = 'block';
				   	$(".question-hidden-workBox").hide();
				   	$(".answered-box-result").show();
				   	
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
		    
		    //상세 이미지 조회
		    $.ajax({
        		url: "selectDetailImage.pr",
        		data: {userNo: $("#userNo").val()},
        		success: function(imageList){
        			console.log('이미지 조회:',imageList);
        			var imageStr = "";
        			for(var image of imageList){
        				imageStr += "<div class='finalDetailImageBoxClass'>"
		        						+"<img src='"+$("#contextPath").val()+'/'+image.changeName+"' alt='image'>"
		        						+"<span onclick='deleteQueuedImage(${index})'>&times;</span>"
		        						+"<input type='hidden' name='oldFileNo' value='"+image.atNo+"'></input>"
		        						+"<input type='hidden' name='oldChangeName' value='"+image.changeName+"'></input>"
        							+"</div>"
        			}
        			$("#imageVideoContainer").append(imageStr);
        		}
        	});
   		    //멤버 정보 조회
   		    $.ajax({
        		url : "memberSessionReinsert.me",
        		data : {"email": $("#email").val()},
        		success : function(member){
	        		$("#nickname-result").text(member.userNickName);
	        		$("#sample6_address").text(member.address);
        		}
        	});
   		   
   		    //메인카테고리 조회
    		$.ajax({
    			url: "selectMainCategoryModal.an",
    			data: {currentPage:1},
    			success: function(map) {
    				console.log(map.list);
    				var list = map.list
    				var str = "";
    				
    				for(var i in list){
    					str +=  "<div class='main-category'>"      
								      +"<label class='container'>"+list[i].categoryName+""          
								      +" <input type='checkbox' name='checkedCategory' value="+list[i].categoryNo+">"              
								      +"<span class='checkmark'></span>"              
						      		  +"</label>"          
						      	+"</div>"      
    				}
					$("#mainCategoryBoxId").html(str); 
					$("#detail-category-list").css("display",'none');
					$("#mainCategoryBoxId2").html(str); 
					$("#detail-category-list-2").css("display",'none');
    			}
    		});
    	});
    	