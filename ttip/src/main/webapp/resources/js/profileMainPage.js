

$(function(){
    $("[class$='-hidden-workBox']").hide();
    
    
});
//프로필 정보 조회
/*
function selectAllProfileInfo(){

    $.ajax({
    	url : "selectAllProfileInfo.pr",
    	data : {userNo: $("#userNo").val()},
    	success : function(result){
    		
    		resolve(result);
    	}
    	
    });
}
*/


//질문 답변 수정하기
function showAnswerBox(){
    document.querySelector("#questionSaveBtn").style.display = 'block';
    document.querySelector("#questionEnrollBtn").style.display = 'none';
    var answerBox = document.getElementsByName("answerBox");
    console.log(answerBox);
    for(var i=0 ; i<answerBox.length;i++){
        answerBox[i].style.display = 'block';
    }
}
//고수 상세 설명 수정하기
function showDetailServiceBox(){
    document.querySelector("#detailServiceSaveBtn").style.display = 'block';
    document.querySelector("#detailServiceEditBtn").style.display = 'none';
    $("#detail-description-result").hide();
    $(".detail-hidden-workBox").show();
}
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
        		}
        	});
        },
        error: function(){
            console.log('닉네임 업데이트 실패');
        }
    });
    
}

