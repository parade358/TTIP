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
   		    		if(result.mainService!=null){
   		    			console.log('대표서비스 null이 아니지?');
	   		    		var selectedCategory = result.mainService;
			    		var str = "<div class='category-box'>"+selectedCategory+"</div>"
			    		$("#mainCategoryContainerBox .category-box:not(#serviceAdd2)").remove();
			    		$("#mainCategoryContainerBox").append(str);
			    		
			    		$('#mainCategoryComplete').val('true');
			    		$('swiper-slide:nth-child(2)').remove();
			    	}else{
			    		$('#mainCategoryComplete').val('false');
			    		$('swiper-slide:nth-child(2)').show();
			    	}
			    	if(result.subService!=null){
	   		    		var selectedCategory = [];
			    		selectedCategory = result.subService.split(',');
			    		var str = "";
			    		for(var i in selectedCategory){
			    			str += "<div class='category-box'>"+selectedCategory[i]+"</div>"
			    		}
			    		$("#categoryContainerBox .category-box:not(#serviceAdd)").remove();
			    		$("#categoryContainerBox").append(str);
			    		$('#subCategoryComplete').val('true');
			    		$('swiper-slide:nth-child(3)').remove();
			    	}else{
			    		$('#subCategoryComplete').val('false');
			    		$('swiper-slide:nth-child(3)').show();
			    	}
   		    		
		    		//한줄소개
		    		if(result.oneLineIntro!=null){
				    		var introduceStr = result.oneLineIntro;
				    		$("#introduce-result").text(introduceStr);
		    				$('#oneLineComplete').val('true');
			    		
			    	}else{
			    		$('#oneLineComplete').val('false');
			    	}
   		    		
		    		
		    		//연락 가능 시간
		    		if(result.phoneAvailable!=null){
				    		var timeStr = result.phoneAvailable
				    		$("#time-selected-result").html(timeStr);
		    				$('#phoneAvailableComplete').val('true');
			    		
			    	}else{
			    		$('#phoneAvailableComplete').val('false');
			    	}
		    		
		    		//서비스 상세설명
		    		if(result.serviceDetailContent!=null){
				    		var detailDescripStr = result.serviceDetailContent;
				    		$("#detail-description-result").html(detailDescripStr);
		    				$('#detailDescriptionComplete').val('true');
			    		
			    	}else{
			    		$('#detailDescriptionComplete').val('false');
			    	}
		    		//프로필 번호
		    		var profileNo = result.profileNo;
		    		$("#profileNo").val(profileNo);
		    		
		    		//changeName 설정
		    		var changeName = result.changeName;
		    		$("#changeName").val(changeName);
		    		
		    		//이미지 불러오기
		    		var profile = result.changeName;
		    		if(profile!=null){
			    		$('#finalProfilePictureId').prop('src', $("#contextPath").val()+"/"+ profile);
		    			$('#profilePictureComplete').val('true');
		    		}else{
		    			$('#profilePictureComplete').val('false');
		    		}
		    		
		    		checkProgress();
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
	        			if(count==5){
	        				console.log('count확인: false');
	        				$('#questionComplete').val('false');
	        			}else{
	        				console.log('count확인: true');
	        				$('#questionComplete').val('true');
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
        			
        			if(imageList!=null){
        				$('#imageVideoComplete').val('true');
        			}else{
        				$('#imageVideoComplete').val('false');
        			}
        		}
        	});
   		    //멤버 정보 조회
   		    $.ajax({
        		url : "memberSessionReinsert.me",
        		data : {"email": $("#email").val()},
        		success : function(member){
        		
	        		$("#nickname-result").text(member.userNickName);
	        		$("#sample6_address").text(member.address);
	        		
	        		if(member.userNickName!=null){
	        			$('#areaComplete').val('true');
	        		}else{
	        			$('#areaComplete').val('false');
	        		}
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
    	
    	function checkProgress(){
    		console.log('바에 들어왔나?');
    		console.log('프로필 히든값 :',$('#profilePictureComplete').val());
    		console.log('대표서비스 히든값 :',$('#mainCategoryComplete').val());
    	    var elem = document.getElementById("bar");
    	    var currBarPercentage = 0;
    	    
    	    
    	    if ($('#profilePictureComplete').val() == 'true') {
    	    	console.log('프로필에 들어왔니?');
    	        var width = currBarPercentage;
    	        var itemPercentage = 15;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#mainCategoryComplete').val() == 'true') {
    	    	console.log('대표서비스 완성했을까?');
    	        var width = currBarPercentage;
    	        var itemPercentage = 15;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#subCategoryComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 5;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#detailDescriptionComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 15;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#areaComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 15;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#oneLineComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 5;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#phoneAvailableComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 5;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#licenseComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 10;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#porfolioComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 5;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#imageVideoComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 5;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    if ($('#questionComplete').val() == 'true') {
    	        var width = currBarPercentage;
    	        var itemPercentage = 5;
    	        currBarPercentage = itemPercentage + currBarPercentage;
    	        var id = setInterval(frame, 10);
    	        function frame() {
    	            if (width >= currBarPercentage) {
    	                clearInterval(id);
    	            } else {
    	                width++;
    	                elem.style.width = width + "%";
    	                $('#barPercentageText').html(currBarPercentage+'%');
    	            }
    	        }
    	    }
    	    
    	    
    	    
    	}
    	