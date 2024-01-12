var num = "";

var check = "n";

$(function(){
			
	var email = $("#email");
	
	var mailBtn = $("#findPwd");
	
	var codeInput = $("#code");
	
	var codeBtn = $("#codeBtn");
	
	mailBtn.click(function(){
	
		$.ajax({
			url : "findPwdCheck.me",
			data : {email : email.val()},
			success : function(result){
				
				if(result>0){
					check = "y";
					codeInput.show();
					codeBtn.show();
					$.ajax({
						url : "findPwd.me",
						data : {email : email.val()},
						success : function(result){
							num = result;
							setTimeout(function() {
								num = "xxxxx";
							}, 60000);
						},error : function(){
							console.log("통신 오류");
						}
					});
				}else{
					alert("입력하신 이메일로 가입된 회원이 없습니다.");
				}
				
			},error : function(){
				console.log("통신 오류");
			}
		});
	
	});
				
});

$(function () {
    var codeBtn = $("#codeBtn");
    var email = $("#email");
    codeBtn.click(function () {
        var code = $("#code").val();
		console.log(email.val()); 
        if (num === code) {
        	alert("인증 성공");
        	
        	window.location.href = "newPwd.me?email=" + email.val();
        	
        	
        } else {
        	alert("인증번호를 확인해주세요.");
        }
    });
});


function checkPwd() {
    var pwInput = document.getElementById("pwd");
    var pwMessage = document.getElementById("pwMessage");

    // 최소 8자, 대소문자, 숫자, 특수문자를 모두 포함해야 하는 정규표현식
    var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    var isValidPw = pwPattern.test(pwInput.value);

    if (isValidPw) {
        pwMessage.innerHTML = "사용 가능한 비밀번호 입니다.";
        pwMessage.className = "message";

        // 유효성 검사를 통과한 경우에만 비밀번호 일치 여부를 체크
        checkMatch();
    } else {
        pwMessage.innerHTML = "비밀번호는 최소 8자, 대소문자, 숫자, 특수문자를 포함해야 합니다.";
        pwMessage.className = "error-message";
    }

    return isValidPw;
}

function checkMatch() {
    var passwordInput = document.getElementById("pwd");
    var confirmPasswordInput = document.getElementById("confirmPassword");
    var passwordMatchMessage = document.getElementById("passwordMatchMessage");

    var doPasswordsMatch = passwordInput.value === confirmPasswordInput.value;

    if (doPasswordsMatch && confirmPasswordInput.value !== "") {
        // 비밀번호가 일치하고 수정 시에는 일치하지 않다는 메시지 표시
        passwordMatchMessage.innerHTML = "비밀번호가 일치합니다.";
        passwordMatchMessage.className = "message";
    } else if (confirmPasswordInput.value === "") {
        // 확인 비밀번호가 비어있을 때의 메시지 표시
        passwordMatchMessage.innerHTML = "확인 비밀번호를 입력해주세요.";
        passwordMatchMessage.className = "error-message";
    } else {
        // 비밀번호가 일치하지 않을 때의 메시지 표시
        passwordMatchMessage.innerHTML = "비밀번호가 일치하지 않습니다.";
        passwordMatchMessage.className = "error-message";
    }

    return doPasswordsMatch;
}


/*
$(document).ready(function () {
    $("#changePwd").click(function () {
        // 비밀번호와 확인 비밀번호 가져오기
        var password = $("#pwd").val();
        var confirmPassword = $("#confirmPassword").val();

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "change_password.me", // 변경을 처리할 서버 스크립트 경로
            data: {
                password: password,
                confirmPassword: confirmPassword
            },
            success: function (data) {
                // 서버로부터의 응답을 처리
                console.log(data);
                // 추가적인 처리 작성
            },
            error: function (error) {
                // 오류 발생 시 처리
                console.log("Error: " + error);
            }
        });
    });
});
*/
        
        
