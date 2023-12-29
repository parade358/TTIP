
/*********************************** 띱 활동명 ********************************/
//띱 활동명 수정하기
function editNickName(){
    document.querySelector("#saveNickName").style.display = 'block';
    document.querySelector("#editNickName").style.display = 'none';
    $("#nickname-result").hide();
    $(".nickname-hidden-workBox").show();
}
//띱 활동명 저장하기
function saveNickName(){
    document.querySelector("#saveNickName").style.display = 'none';
    document.querySelector("#editNickName").style.display = 'block';
    $("#nickname-result").show();
    $(".nickname-hidden-workBox").hide();
    $.ajax({
        url: "changeNickName.pr",
        data: {"changedNickname": $("#nickname-box").val(),
        	   "userNo": $("#userNo").val() },
        success : function(result){
        	$.ajax({
        		url : "memberSessionReinsert.me",
        		data : {"email": $("#email").val()},
        		success : function(member){
	        		$("#nickname-result").text(member.userNickName);
	        		$("#sample6_address").text(member.address);
        		}
        	});
        },
        error: function(){
            console.log('닉네임 업데이트 실패');
        }
    });
}    
// 띱 활동명 글자수 증가
$("#nickname-box").keyup(function(){
   $("#currNumberOfNickname").text($(this).val().length);
});
/******************************** 한 줄 소개 ************************************/
 //한줄소개 수정하기
 document.getElementById("editOneLineBtn").addEventListener("click",function(){
 	document.querySelector("#saveOneLineBtn").style.display = 'block';
    document.querySelector("#editOneLineBtn").style.display = 'none';
    $("#introduce-result").hide();
    $(".one-line-introduce-hidden-workBox").show();
 });
 //한줄소개 저장하기
  document.getElementById("saveOneLineBtn").addEventListener("click",function(){
 	document.querySelector("#saveOneLineBtn").style.display = 'none';
    document.querySelector("#editOneLineBtn").style.display = 'block';
    $("#introduce-result").show();
    $(".one-line-introduce-hidden-workBox").hide();
    $.ajax({
        url: "updateOneLineIntroduce.pr",
        data: {"changedText": $("#oneLineTextArea").val(),
        	   "userNo": $("#userNo").val() },
        success : function(result){
        	 $.ajax({
   		    	url : "selectAllProfileInfo.pr",
   		    	data : {userNo: $("#userNo").val()},
   		    	success : function(result){
		    		var str = result.oneLineIntro;
		    		$("#introduce-result").html(str);
   		    	}
   		    });
        },
        error: function(){
            console.log('닉네임 업데이트 실패');
        }
    });
    
 });
 //한줄소개 글자수 증가
$("#oneLineTextArea").keyup(function(){
   $("#currNumberOfOneLine").text($(this).val().length);
});
/******************************** 연락 가능 시간 ************************************/
//연락 가능 시간 수정하기
 document.getElementById("editTimeBtn").addEventListener("click",function(){
 	document.querySelector("#saveTimeBtn").style.display = 'block';
    document.querySelector("#editTimeBtn").style.display = 'none';
    $("#time-selected-result").hide();
    $(".time-select-hidden-workBox").show();
 });
//연락 가능 시간 저장하기
 document.getElementById("saveTimeBtn").addEventListener("click",function(){
 	document.querySelector("#saveTimeBtn").style.display = 'none';
    document.querySelector("#editTimeBtn").style.display = 'block';
    $("#time-selected-result").show();
    $(".time-select-hidden-workBox").hide();
    
    var timsStr = "";
    timeStr = $('#startTime').val()+" - "+$('#endTime').val();
    console.log('확인시간:',timeStr);
    $.ajax({
        url: "updateTime.pr",
        data: {"changedTime": timeStr,
        	   "userNo": $("#userNo").val() },
        success : function(result){
        	 $.ajax({
   		    	url : "selectAllProfileInfo.pr",
   		    	data : {userNo: $("#userNo").val()},
   		    	success : function(result){
		    		var str = result.phoneAvailable;
		    		$("#time-selected-result").html(str);
   		    	}
   		    });
        },
        error: function(){
            console.log('시간 업데이트 실패');
        }
    });
    
 });
 /******************************** 서비스 상세설명 ************************************/
//서비스 상세설명 수정하기
document.getElementById('editDetailServiceBtn').addEventListener('click',function(){
	document.querySelector("#editDetailServiceBtn").style.display = 'none';
    document.querySelector("#saveDetailServiceBtn").style.display = 'block';
   $("#detail-description-result").hide();
    $(".detail-description-hidden-workBox").show();
});


function detailDescripFunctions(){
	//30자 이상 입력 true/false
	var status = false;
	
	showAlertMessage(status);
	disableBtn();
	
	function disableBtn() {
	
	    // 서비스 상세설명 글자수 증가
	    $("#detailDescriptionTextArea").keyup(function () {
	        var strLength = $(this).val().length;
	        if (strLength < 30) {
	            $("#detailDescMinTextNum").css("color", "#b5b5b5");
	            $("#checkIcon").css("color", "#b5b5b5");
	            status = false;
	        } else {
	            $("#detailDescMinTextNum").css("color", "black");
	            $("#checkIcon").css("color", "#7752FE");
	            status = true;
	        }
	        
	    });
	
	    // 서비스 상세설명 저장하기
	    $("#saveDetailServiceBtn").click(function () {
	    	console.log('들어왔어');
	        if (status) {
	            document.querySelector("#editDetailServiceBtn").style.display = 'block';
	            document.querySelector("#saveDetailServiceBtn").style.display = 'none';
	            $("#detail-description-result").show();
	            $(".detail-description-hidden-workBox").hide();
	
	            $.ajax({
	                url: "updateDetailDescription.pr",
	                data: {
	                    "changedDescription": $("#detailDescriptionTextArea").val(),
	                    "userNo": $("#userNo").val()
	                },
	                success: function (result) {
	                    $.ajax({
	                        url: "selectAllProfileInfo.pr",
	                        data: {
	                            userNo: $("#userNo").val()
	                        },
	                        success: function (result) {
	                            var str = result.serviceDetailContent;
	                            $("#detail-description-result").html(str);
	                        }
	                    });
	                },
	                error: function () {
	                    console.log('서비스 상세설명 업데이트 실패');
	                }
	            });
	            
	        }
	    });
	
	    return status;
	}
	function showAlertMessage(status){
		if(status){
			$("#minNumAlertMsg").css('display','none');
		}else{
			$("#minNumAlertMsg").css('display','block');
		}
	}
 }
 /******************************** 질문 답변 ************************************/
//질문 답변 수정하기
function showAnswerBox(){
    document.querySelector("#questionSaveBtn").style.display = 'block';
    document.querySelector("#questionEnrollBtn").style.display = 'none';
    $(".question-hidden-workBox").show();
    $(".answered-box-result").hide();
}

//질문 답변 저장하기
document.getElementById("questionSaveBtn").addEventListener("click",function(){

	var textAreaElements = $("textarea[name='answerBox']");
	var textAreaAllLength = 0;
	

	textAreaElements.each(function (){
		textAreaAllLength += $(this).val().length
	});
		
		var commentObjectArray = [];
		var textAreaElements = $("textarea[name='answerBox']");
		
		textAreaElements.each(function (i) {
		    if ($(this).val().length > 0) {
		        var QA_comment = {
		            questionNum: parseInt($(this).prev().val()),
		            qaAnswer: $(this).val(),
		        }
		        commentObjectArray.push(QA_comment);
		    }else{
		    	var QA_comment = {
		            questionNum: parseInt($(this).prev().val()),
		            qaAnswer: '',
		        }
		        commentObjectArray.push(QA_comment);
		    }
		});
		
		console.log('객체배열 확인:', commentObjectArray);
	   	
	   	 $.ajax({
		    url: "updateQuestion.pr",
		    type: "POST",
		    traditional: true,
		    data: {
		    	'commentObjectArray' : JSON.stringify(commentObjectArray),
		    	'userNo' : $("#userNo").val()
		    },
		    success: function(result) {
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
				
		    },
		    error: function() {
		        console.log('질문답변 업데이트 실패');
		    }
		});
   

    
 });
